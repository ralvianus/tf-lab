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

variable "key_pair_name" {
  description = "The name of the existing EC2 Key pair that will be used to authenticate"
  type        = string
  default     = "ralvianus-keypair"
}

variable "instance_count" {
    description = "The amount of instance"
    type = number
    default = 1
}
