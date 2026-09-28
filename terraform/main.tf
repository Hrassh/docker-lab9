# Провайдер AWS
provider "aws" {
  region = var.aws_region
}

# Група безпеки: відкриває порти 22 (SSH)
resource "aws_security_group" "devops_sg" {
  name        = "devops-sg-tf"
  description = "Allow SSH and app port"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App port"
    from_port   = 3000
    to_port     = 3000
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

# Сервер EC2
resource "aws_instance" "devops_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  # Встановлення Docker 
  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y docker.io
    systemctl enable --now docker
  EOF

  tags = {
    Name = "devops-lab-terraform"
  }
}
