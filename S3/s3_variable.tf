# Region Define
variable "aws_region" {
    description = "AWS Region to deploy resources"
    type        = string
    default     = "***" # Replace with your actual region, e.g., "us-east-1"
}
# aws access key
variable "aws_access_key" {
    description = "AWS Access Key"
    type        = string
    default     = "***" # Replace with your actual access key
}
# aws secret key
variable "aws_secret_key" {
    description = "AWS Secret Key"
    type        = string
    default     = "***" # Replace with your actual secret key 
}