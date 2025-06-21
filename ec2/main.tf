resource "aws_instance" "web" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"
  subnet_id = var.public_subnet_id
  security_groups = [aws_security_group.web_sg.name]
  user_data = <<-EOF
                  #!/bin/bash
                  yum update -y
                  yum install -y nginx
                    systemctl start nginx
                    systemctl enable nginx
                    echo "<h1>Hello, World!</h1>" > /usr/share/nginx/html/index.html
                 EOF
  tags = {
    Name = "HelloWorld"
  }
}


resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow SSH from my IP and HTTP from anywhere"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["YOUR_PUBLIC_IP/32"] # Replace with your actual public IP
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web_sg"
  }
}

