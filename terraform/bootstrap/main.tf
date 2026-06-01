resource "aws_s3_bucket" "s3_bucket" {
  bucket = "microservices-demo-bucket-657830185735"

  tags = {
    Name        = "microservices-demo-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name             = "terraform_lock"
  billing_mode     = "PAY_PER_REQUEST"
  hash_key         = "LockID"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}
