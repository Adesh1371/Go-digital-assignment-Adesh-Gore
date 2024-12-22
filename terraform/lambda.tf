resource "aws_lambda_function" "s3_to_rds" {
  function_name     = "s3-to-rds"
  role              = "arn:aws:iam::977098984022:role/myroles"
  image_uri         = "977098984022.dkr.ecr.ap-south-1.amazonaws.com/s3-rds-data-bucket:latest"
  package_type      = "Image"

  environment {
    variables = {
      DB_HOST     = aws_db_instance.rds_instance.address
      DB_USER     = "admin"
      DB_PASSWORD = "password123"
      DB_NAME     = "mydb"
    }
  }
}
