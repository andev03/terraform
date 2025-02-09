provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" // Replace with a valid AMI ID for your region
  instance_type = "t3.medium"

  tags = {
    Name = "Udemy Demo"
  }
}

resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0" // Replace with a valid AMI ID for your region
    instance_type = "t3.medium"
    security_groups = [aws_security_group.example.name]

    tags = {
        Name = "Udemy Demo"
    }
}

resource "aws_security_group" "example" {
    name        = "example-security-group"
    description = "Security group for example instance"
    vpc_id      = "vpc-123456" // Replace with your VPC ID

    ingress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 3306
        to_port     = 3306
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