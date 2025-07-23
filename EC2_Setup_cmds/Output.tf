output "public_ip" {
    value = aws_instance.Nginx-Server.public_ip

}

output "aws_dns" {
    value = aws_instance.Nginx-Server.public_dns
}