resource "aws_iam_role" "sftp_role" {
  name = "sftp-transfer-server-iam-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "transfer.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

#Set SFTP user permissions.
resource "aws_iam_role_policy" "sftp_policy" {
  name     = "sftp-transfer-server-iam-policy"
  role     = aws_iam_role.sftp_role.id
  for_each = toset(["user1", "user2"])
  policy   = <<POLICY
{  
      
    "Version": "2012-10-17",
    "Statement": [
        {
        "Sid": "AllowFullAccesstoCloudWatchLogs",
        "Effect": "Allow",
        "Action": [
            "logs:*"
        ],
        "Resource": "*"
        },
        {
          "Effect": "Allow",
          "Action": [
            "s3:ListBucket",
            "s3:GetBucketLocation"
          ],
         "Resource": [
            "${aws_s3_bucket.s3-sftp.arn}"
          ]
        },
        {
          "Effect": "Allow",
          "Action": [
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObject",
            "s3:DeleteObjectVersion",
            "s3:GetObjectVersion",
            "s3:GetObjectACL",
            "s3:PutObjectACL"
          ],

          "Resource": [
            "arn:aws:s3:::${aws_s3_bucket.s3-sftp.id}/*"
        ]
      }
    ]
}
POLICY
}

#create sftp user 
resource "aws_transfer_user" "sftp_user" {
  depends_on = [aws_s3_bucket.s3-sftp]
  #user_name   = ["user1", "user2"]
  user_name      = element(var.sftp_username, 0)
  server_id      = aws_transfer_server.sftp_server.id
  for_each       = toset(["user1", "user2"])
  role           = aws_iam_role.sftp_role.arn
  home_directory = "/${aws_s3_bucket.s3-sftp.id}/*"
}

resource "aws_transfer_ssh_key" "ssh_public_keys" {
  count     = length(var.ssh_public_keys)
  server_id = aws_transfer_server.sftp_server.id
  #for_each  = toset(["user1", "user2"])
  user_name = element(var.sftp_username, 0)
  #user_name = "user1"
  body = element(var.ssh_public_keys, 0)
}