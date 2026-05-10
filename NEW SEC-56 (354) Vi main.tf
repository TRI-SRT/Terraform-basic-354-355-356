terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  # NO KEYS HERE - That's correct!
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c604fc6bbc4c210e"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-Mumbai-Server"
  }
}

output "instance_public_ip" {
  value = aws_instance.web_server.public_ip
}