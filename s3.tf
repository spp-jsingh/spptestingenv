resource "aws_s3_bucket" "s3-sftp" {
  bucket = var.s3_sftp_bucket_name
  acl    = "private"

  tags = {
    Terraform = "True"
  }
}

#create a folder for the user in S3 bucket which was previourly created. ( not part of this code )
resource "aws_s3_bucket_object" "s3_folder" {
  depends_on   = [aws_s3_bucket.s3-sftp]
  bucket       = aws_s3_bucket.s3-sftp.id
  key          = element(var.sftp_username, 0)
  content_type = "application/x-directory"
}