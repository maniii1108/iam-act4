terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
 
provider "aws" {
  region = var.aws_region
}

resource "aws_iam_user" "read_user" {
  name = var.iam_user_name
  tags = {
    Project = "Project-4-IAM-Automation"
  }
}

resource "aws_iam_policy" "s3_read_policy" {
  name        = "${var.iam_user_name}-s3-read-policy"
  description = "Policy granting S3 read-only permissions via Terraform variable"
  policy      = var.s3_read_policy_json
}
resource "aws_iam_user_policy_attachment" "attach_s3_read" {
  user       = aws_iam_user.read_user.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}

