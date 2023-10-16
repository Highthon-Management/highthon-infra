data "aws_iam_policy_document" "policy" {
  version = "2012-10-17"
  statement {
    actions = [
      "s3:Get*",
      "s3:Put*"
    ]
    effect = "Allow"
    resources = ["${aws_s3_bucket.s3.arn}//highthon/*"]
    principals {
      identifiers = ["*"]
      type        = "AWS"
    }
  }
}