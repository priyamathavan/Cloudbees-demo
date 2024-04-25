terraform {
  backend "s3" {
    depends_on = "aws_dynamodb_table.dynamodb-terraform-lock"
    bucket         = "cloudbees-demo-tech-assessment-sre"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = false
    dynamodb_table = "terraform-lock"
  }
}
