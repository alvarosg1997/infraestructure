output "iam_user_name" {
  value = aws_iam_user.terraform_user.name
}

output "iam_policy_arn" {
  value = aws_iam_policy.terraform_policy.arn
}