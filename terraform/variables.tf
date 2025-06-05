variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ami_id" {
  # Ubuntu 22.04 LTS (Change based on your region)
  default = "ami-053b0d53c279acc90"
}

variable "public_key_path" {
  description = "Path to your SSH public key"
  default     = "~/.ssh/id_rsa.pub"
}

variable "bucket_name" {
  default = "my-unique-terraform-state-bucket-kshitij"
}

variable "dynamodb_table" {
  default = "terraform-lock-table"
}