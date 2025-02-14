resource "aws_iam_user" "terraform_user" {
    name                 = "terraform_user"
    path                 = "/"
    permissions_boundary = null
    tags                 = {
        "AKIA5IJOWSL3UUEYG6G7" = "Terraform_user_cli"
        "Name"                 = "terraform-user"
        "Purpose"              = "Terraform Infrastructure Management"
        "Environment"          = "Dev"
    }
    tags_all             = {
        "AKIA5IJOWSL3UUEYG6G7" = "Terraform_user_cli"
        "Name"                 = "terraform-user"
        "Purpose"              = "Terraform Infrastructure Management AWS"
    }
}

resource "aws_iam_policy" "terraform_policy" {
    description      = "Provides full access to AWS services and resources."
    name             = "AdministratorAccess"
    name_prefix      = null
    path             = "/"
  policy             = file("files/AdministratorAccess.json")
    tags             = {}
    tags_all         = {}
}


resource "aws_iam_user_policy_attachment" "terraform_attach" {
  user       = aws_iam_user.terraform_user.name
  policy_arn = aws_iam_policy.terraform_policy.arn
}
