provider"aws"{
   region="ap-south-1"
     access_key = "{MY_SECRET_KEY}"
     secret_key = "{MY_SECRET_KEY}"
}

resource "aws_s3_bucket" "data_bucket" {
  bucket = "s3-rds-data-bucket"
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = null
  instance_class       = "db.t4g.micro"
  db_name                 = "mydb"
  username             = "admin"
  password             = "password123"
  publicly_accessible  = true
}

resource "aws_ecr_repository" "ecr_repo" {
  name = "s3-rds-data-bucket"
}
