variable "key_name" {
  description = "The name of the key pair"
  type        = string
  default     = "terraform"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-03fd334507439f4d1"
}

