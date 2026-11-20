output "iam_user_arn" {
  value = aws_iam_user.read_user.arn
}
 
output "policy_arn" {
  value = aws_iam_policy.s3_read_policy.arn
}
 

