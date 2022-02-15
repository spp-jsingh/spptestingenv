variable "aws_region" {
  default = "us-east-1"
}

variable "s3_sftp_bucket_name" {
  default = "s3-sftp-tf"
}

variable "sftp_username" {
  type    = list(string)
  default = ["user1", "user2"]
}

variable "ssh_public_keys" {
  type    = list(string)
  default = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQuMWJlSY9rmTXUmiHbkBwaal/huGmGt4ObWdfRggS0KgC11Sd3yjZnt5iurkXuIy6Q3SryigEIYKjeA5FHXT9V/gIF6h09tsVzqGMJynVi2drROnGe7979hwGQYkqBJPzmJQn7CvNftgn7KXW+do1CjUG9h5M/Ui0CZWMRziTPOwT2jHa7mu8wcXeW+hh+SRcrCspF5fxiVSS0Yljm3CFGzpRm3gF744gectyU9weWoAIYdrJT1wchrmawUMVS1aSwA/QMh2hhGg87nVUpw6NM3J+g94X8mBlpIsBMc+Bq1QXHofIwBuAKaLU2IieobDqlCmh4/JmfTyUzxF+5xZy/AlspPJmkVg3yFyugogi0vsz41uaLd5LMe+KwCrQgbpMc8H455INWnxH/huKfApoWNXqOhPRv32NPN9riyKPc6qR6+uHz92vjqOLX288XeS4yoKgeDyqmUIoAoU5XZW0OYmIloFUx2H0JxGvRzQW+f+h09h//5Vtuo4rp6Raqq0= jsingh@Justins-MBP", "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBHiV8CHYJNo7Tir/k9bUOPBqVUZTLq0Cmw2BqJ1oQvXIiqYDLplaSYlvaE9RjS6O3jweo8T1hg1zeUGKXDvRC2WQuVbGPafknLr9H3nyKfA6yuWYaSLh5d4a4ZbeHCcFas5sQzKeT0pXU1HBRFeXvkKDAWsEacv3NpW7FrUt1ele8TBZM7zoO6RIgBdXoCgAHHoUK+U9OkdDPDNmOegrcJP8ZmmIScIeDZfvD6XTJBSBlFiNB8Swk67EWRUtx8AYuAmXCx3EatlO2XB85pr1ls+lqk4jMk+c8paDXQin5N4sJjd2AWQZd7pXPslfUfCavyWck7BG63k5weO3sghz+sRvKsFjAiKX6EEeIV7vrkOO/Dp4xIIBvq1WfNH8QZGqjnv/i4dPgZE5zUfdSBS7MwU2nQdpszAGYYO+wTgs67mdbkJLD2oNCTIWSk1nrhstcWFfoB4khA8U9kL6pGhepxWPSDTdgra+ISRj6CNcq9D3mctorwSQzkNyF7uic09M= jsingh@Justins-MacBook-Pro.local"]
}
