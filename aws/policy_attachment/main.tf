resource "aws_iam_user_policy_attachment" "template" {
  for_each   = toset(var.policy_arns)
  user       = var.username
  policy_arn = each.value
}
