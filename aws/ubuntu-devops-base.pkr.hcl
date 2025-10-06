packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "${var.ami_name_prefix}-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  instance_type = var.instance_type
  region        = var.aws_region

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = [var.source_ami_owner]
  }

  ssh_username         = var.ssh_username
  ssh_keypair_name     = var.ssh_keypair_name != "" ? var.ssh_keypair_name : null
  ssh_private_key_file = var.ssh_private_key_file != "" ? var.ssh_private_key_file : null

  tags = merge(
    var.tags,
    {
      Name        = "${var.ami_name_prefix}-${formatdate("YYYY-MM-DD", timestamp())}"
      OS          = "Ubuntu 22.04"
      BuildDate   = formatdate("YYYY-MM-DD", timestamp())
      PackerBuild = "true"
    }
  )
}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  # Wait for cloud-init
  provisioner "shell" {
    inline = [
      "echo 'Waiting for cloud-init to complete...'",
      "cloud-init status --wait"
    ]
  }

  # Copy configuration files
  provisioner "file" {
    source      = "${path.root}/../configs/"
    destination = "/tmp/"
  }

  # Execute provisioning scripts
  provisioner "shell" {
    scripts = [
      "${path.root}/../scripts/01-update-system.sh",
      "${path.root}/../scripts/02-install-tools.sh",
      "${path.root}/../scripts/03-install-aws-cli.sh",
      "${path.root}/../scripts/04-install-cloudwatch-agent.sh",
      "${path.root}/../scripts/05-install-ssm-agent.sh",
      "${path.root}/../scripts/06-security-hardening.sh",
      "${path.root}/../scripts/07-configure-auto-updates.sh",
      "${path.root}/../scripts/08-cleanup.sh"
    ]
  }
}
