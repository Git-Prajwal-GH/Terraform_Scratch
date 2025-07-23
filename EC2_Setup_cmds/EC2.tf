# my own ec2 steps
provider "aws"{
    region     = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
}

resource "aws_instance" "Nginx-Server" {
    ami           = var.ami_id            # Always use the latest Ubuntu AMI ID
    instance_type = var.instance_type     # Change as per your requirement
    key_name      = "test"                # key_name as per your key pair name
                                          # use existing key pair
    security_groups = var.security_group  # Use existing security group or create a new one

    root_block_device {
        volume_size = var.storage_size
        volume_type = "gp3"
        delete_on_termination = true
    }

    user_data = var.user_data

    tags = {
        Name = var.aws_instance_tags.Name
    }
  
}

# <<-EOF
#                 #!/bin/bash
#                 apt-get update -y         # pakage manager cmd (ubuntu) & package update
#                 apt-get install -y nginx  # install nginx web server
#                 systemctl start nginx
#                 systemctl enable nginx
#                 EOF

# <<-EOF
#                 #!/bin/bash
#                 apt-get update -y         # pakage manager cmd (ubuntu) & package update
#                 apt-get install -y apache2  # install apache2 web server
#                 systemctl start apache2
#                 systemctl enable apache2
#                 EOF

# <<-EOF
#                 #!/bin/bash
#                 yum update -y         # pakage manager cmd (linux AMI) & package update
#                 yum install -y httpd  # install httpd web server
#                 systemctl start httpd
#                 systemctl enable httpd
#                 EOF