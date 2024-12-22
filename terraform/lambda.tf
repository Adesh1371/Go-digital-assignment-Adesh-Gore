resource "aws_lambda_function" "s3_to_rds" {
  function_name     = "s3-to-rds"
  role              = "{ROLE}"
  image_uri         = "{IMAGE_URI}"
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
