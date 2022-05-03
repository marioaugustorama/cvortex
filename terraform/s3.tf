resource "aws_s3_bucket" "cvortex_bucket" {
  bucket = "cvortex"

  tags = {
    Key   = "Name"
    Value = "cvortex files"
  }
}

resource "aws_s3_bucket_versioning" "cvortex_bucket" {
  bucket = aws_s3_bucket.cvortex_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}