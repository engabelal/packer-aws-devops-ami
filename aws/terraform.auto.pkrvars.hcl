aws_region      = "eu-north-1"
instance_type   = "t3.micro"
ami_name_prefix = "devops-base-ubuntu"

# Source AMI Owner (099720109477 = Canonical/Ubuntu official)
source_ami_owner = "099720109477"

# Optional: SSH Key Pair (leave empty for Packer temporary keys)
ssh_keypair_name     = ""  # Example: "my-packer-key"
ssh_private_key_file = ""  # Example: "./my-packer-key.pem"

tags = {
  Environment = "production"
  ManagedBy   = "Packer"
  Project     = "DevOps-Base-Image"
  CreatedBy   = "Ahmed Belal - ABCloudOps"
}
