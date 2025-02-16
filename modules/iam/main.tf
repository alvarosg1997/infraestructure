resource "aws_iam_user" "terraform_user" {
  name                 = var.user_name
  path                 = "/"
  permissions_boundary = null
  tags                 = var.tags
  tags_all             = var.tags_all
}

resource "aws_iam_policy" "terraform_policy" {
  description = "Provides full access to AWS services and resources."
  name        = "AdministratorAccess"
  path        = "/"
  policy      = file("${path.module}/files/AdministratorAccess.json")
  tags        = {}
  tags_all    = {}
}

resource "aws_iam_user_policy_attachment" "terraform_attach" {
  user       = aws_iam_user.terraform_user.name
  policy_arn = aws_iam_policy.terraform_policy.arn
}
