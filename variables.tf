variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}
 
variable "iam_user_name" {
  description = "Name of the IAM user to create"
  type        = string
  default     = "s3-readonly-user-v2"
}
 
variable "s3_read_policy_json" {
  description = "IAM policy document granting S3 read-only permissions"
  type        = string
  default     = <<-EOT
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "AllowS3ReadAccess",
        "Effect": "Allow",
        "Action": [
          "s3:GetObject",
          "s3:GetObjectVersion",
          "s3:ListBucket",
          "s3:ListAllMyBuckets",
          "s3:GetBucketLocation"
        ],
        "Resource": "*"
      }
    ]
  }
  EOT
}
