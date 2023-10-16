resource "aws_s3_bucket" "s3" {
  bucket = "highthon-submit"
  force_destroy = true
  tags = {
    Name = "highthon-submit"
  }

  tags_all = {
    Name = "highthon-submit"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {

  bucket = aws_s3_bucket.s3.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "access_block" {

  bucket = aws_s3_bucket.s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "s3_policy" {

  bucket = aws_s3_bucket.s3.id

  policy = data.aws_iam_policy_document.policy.json
  depends_on = [aws_s3_bucket.s3, aws_s3_bucket_public_access_block.access_block]
}

resource "aws_s3_bucket_cors_configuration" "bucket_cors" {

  bucket = aws_s3_bucket.s3.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT","GET"]
    allowed_origins = ["*"]//나중에 Domain 추가
    expose_headers = ["ETag"]
  }
}

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