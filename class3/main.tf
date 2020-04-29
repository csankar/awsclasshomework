# Cloud Provider
provider "aws" {
  region = "eu-west-2"
}

# Security Group Config For AWS EC2 Instance
resource "aws_security_group" "demo_security_group" {
  name        = "demo_security_group"
  description = "Allowing Port 22 and Port 80 to the outside World."

  # Inbound Rules
  ingress {
    description = "Security Group Inbound Rule 1"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Security Group Inbound Rule 2"
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound Rules
  egress {
    description = "Security Group Outbound Rule 1"
    protocol = "tcp"
    from_port = 22
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Security Group Outbound Rule 2"
    protocol = "tcp"
    from_port = 80
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Tags
  tags = {
    name = "class_demo_tag"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# AWs Instance
resource "aws_instance" "demo_ec2_instance" {
  ami = "ami-0fc841be1f929d7d1"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.demo_security_group.id}"]
  tags = {
    Server = "Development"
  }
}