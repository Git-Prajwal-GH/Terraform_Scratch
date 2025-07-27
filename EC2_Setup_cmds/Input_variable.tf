# Region Define
variable "aws_region" {
    description = "AWS Region to deploy resources"
    type        = string
    default     = "****" # Replace with your actual region, e.g., "us-east-1"
}
# aws access key
variable "aws_access_key" {
    description = "AWS Access Key"
    type        = string
    default     = "*****" # Replace with your actual access key
}
# aws secret key
variable "aws_secret_key" {
    description = "AWS Secret Key"
    type        = string
    default     = "*****" # Replace with your actual secret key 
}
# AMI ID for Instance
variable "ami_id" {
    description = "AMI ID for the instance"
    type        = string
    default     = "****" # Always use the latest Amazon Linux/Ubuntu AMI ID
}
# Instance Type
variable "instance_type" {
    description = "Type of the instance"
    type        = string
    default     = "t2.micro"  # Change as per your requirement
}
# Security Group 
variable "security_group" {
    description = "Security Group for the instance"
    type        = string
    default     = "default"  # Use existing security group or create a new one
}
variable "storage_size" {
    description = "Size of the root block device in GB"
    type        = number
    default     = 8
}
# User Data Script to run on instance creation
variable "user_data" {
    description = "value for user data script to run on instance creation"
    type        = string
    default = <<-EOF
                #!/bin/bash
                apt-get update -y         # pakage manager cmd (ubuntu) & package update
                apt-get install -y nginx  # install nginx web server
                systemctl start nginx
                systemctl enable nginx
                EOF
}
# Instance tags
variable "aws_instance_tags" {
    description = "Tags for the AWS Instance"
    type        = string
    default     = {
        Name = "Nginx-Server"
    }
}