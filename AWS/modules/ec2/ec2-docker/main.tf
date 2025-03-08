resource "aws_instance" "docker_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name  
  security_groups = [aws_security_group.docker_sg.name]


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

              # Ejecutar un contenedor con Nginx
              docker run -d -p 80:80 nginx
              EOF

  tags = {
    Name = "Ubuntu-Docker-Server"
  }
}

resource "aws_security_group" "docker_sg" {
  name        = "docker-security-group"
  description = "Allow HTTP and SSH"
  
  ingress {
    from_port   = 22
    to_port     = 22
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
