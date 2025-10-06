variable "aws_region" {
  type        = string
  description = "AWS region to build AMI"
  default     = "eu-north-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for building"
  default     = "t3.micro"
}

variable "ami_name_prefix" {
  type        = string
  description = "Prefix for AMI name"
  default     = "devops-base-ubuntu"
}

variable "ssh_username" {
  type        = string
  description = "SSH username"
  default     = "ubuntu"
}

variable "ssh_keypair_name" {
  type        = string
  description = "SSH key pair name (optional, Packer creates temporary keys by default)"
  default     = ""
}

variable "ssh_private_key_file" {
  type        = string
  description = "Path to SSH private key file (optional, only needed if using custom key pair)"
  default     = ""
}

variable "source_ami_owner" {
  type        = string
  description = "AWS account ID of the AMI owner (099720109477 = Canonical/Ubuntu)"
  default     = "099720109477"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to AMI"
  default = {
    Environment = "production"
    ManagedBy   = "Packer"
    Project     = "DevOps-Base-Image"
  }
}
