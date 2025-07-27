# Provider Configuration
provider "aws" {
    region = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}
# S3 Bucket Creations Steps
resource "aws_s3_bucket" "awesome_bucket" {

    bucket = "awesomee-bucket"
      
}