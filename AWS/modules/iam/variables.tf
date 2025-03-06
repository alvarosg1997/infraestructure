variable "user_name" {
  description = "The name of the IAM user"
  type        = string
  default     = "terraform_user"
}

variable "tags" {
  description = "Tags for the IAM user"
  type        = map(string)
  default     = {
    "AKIA5IJOWSL3UUEYG6G7" = "Terraform_user_cli"
    "Name"                 = "terraform-user"
    "Purpose"              = "Terraform Infrastructure Management"
    "Environment"          = "Dev"
  }
}

variable "tags_all" {
  description = "All tags for the IAM user"
  type        = map(string)
  default     = {
    "AKIA5IJOWSL3UUEYG6G7" = "Terraform_user_cli"
    "Name"                 = "terraform-user"
    "Purpose"              = "Terraform Infrastructure Management AWS"
  }
}

variable "policy_file_path" {
  description = "Path to the policy file (JSON)"
  type        = string
  default     = "files/AdministratorAccess.json"
}