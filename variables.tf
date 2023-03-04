variable "aws_secret_key" {
  description = "The AWS Secret Key that will be used by Terraform and the Avi Controller resources"
  type        = string
  sensitive   = true
  default     = null
}
variable "aws_access_key" {
  description = "The AWS Access Key that will be used by Terraform and the Avi Controller resources"
  type        = string
  sensitive   = true
  default     = null
}
variable "aws_region" {
  description = "The region for AWS"
  type        = string
  default     = "ap-southeast-1"
}

variable "name_prefix" {
  description = "This prefix is appended for tagging"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "key_pair_name" {
  description = "The name of the existing EC2 Key pair that will be used to authenticate"
  type        = string
  default     = "ralvianus-keypair"
}

variable "public_subnet_cidr_blocks" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
