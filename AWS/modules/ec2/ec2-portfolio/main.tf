resource "aws_instance" "portfolio_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name  
  security_groups = [aws_security_group.portfolio_sg.name]


  user_data = <<-EOF
              #!/bin/bash
              apt update -y && apt upgrade -y

              # Instalar Docker
              apt install -y docker.io
              systemctl enable --now docker
              usermod -aG docker ubuntu
              usermod -aG root ubuntu

              # Instalar Docker Compose
              curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              chmod +x /usr/local/bin/docker-compose
              EOF

  tags = {
    Name = "Ubuntu-portfolio-Server"
  }
}

resource "aws_security_group" "portfolio_sg" {
  name        = "portfolio-security-group"
  description = "Allow HTTP and SSH"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["79.117.123.153/32"] 
  }
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["79.117.123.153/32"] 
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Crear Elastic IP
resource "aws_eip" "portfolio_eip" {
  tags = {
    Name = "Portfolio-EIP"
  }
}

# Asociar la Elastic IP a la instancia EC2
resource "aws_eip_association" "portfolio_eip_assoc" {
  instance_id   = aws_instance.portfolio_server.id
  allocation_id = aws_eip.portfolio_eip.id
}
