
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
}

resource "aws_instance" "MyFirstInstance" {
  ami           = "ami-05692172625678b4e"
  instance_type = "t2.micro"

  tags = {
    Name = "My-First-Terraform-Instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.MyFirstInstance.public_ip
}