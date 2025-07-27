# Vpc setps
provider "aws" {
  region     = "eu-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
resource "aws_vpc" "unique_vpc" {
  cidr_block = "12.0.0.0/16"
    tags = {
        Name = "unique_vpc"
    }
}
resource "aws_subnet" "private_subnet" {
    Vpcid = aws_vpc.unique_vpc.id
    cidr_block = "12.0.1.0/24"
    availability_zone = "eu-east-1a"
    tags = {
        Name = "unique_pvt_subnet"
    
    }
}
resource "aws_subnet" "public_subnet" {
    Vpcid = aws_vpc.unique_vpc.id
    cidr_block = "12.0.1.0/24"
    availability_zone = "eu-east-1a"
    tags = {
        Name = "unique_pub_subnet"
    
    }
}
resource "route_table" "pvt_rt" {
    Vpcid = aws_vpc.unique_vpc.id
    associate_with_subnet = aws_subnet.private_subnet.id
    tags = {
        Name = "unique_pvt_rt"
    }
}
resource "route_table" "pub_rt" {
    Vpcid = aws.unique_vpc.id
    associate_with_subnet = aws_subnet.public_subnet.id
    tags = {
        Name = "unique_pub_rt"
    }
}
resource "aws_internet_gateway" "public_igw" {
    vpc_id = aws_vpc.unique_vpc.id
    attach_to_subnet = aws_subnet.public_subnet.id
    tags = {
        Name = "unique_pub_igw"
    }
}