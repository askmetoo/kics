resource "aws_s3_bucket" "example" {
  bucket = "example"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.example.id

  block_public_acls   = true
  block_public_policy = false
  ignore_public_acls  = false
}

// comment
// comment
// comment
// comment
// comment
resource "aws_s3_bucket_public_access_block" "example_not_found" {
  bucket = aws_s3_bucket.example.id

  block_public_acls   = true
  ignore_public_acls  = false
}