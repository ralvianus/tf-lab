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

variable "instance_count" {
    description = "The amount of instance"
    type = number
    default = 1
}