terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.53.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
  default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
  default = "10.0.10.0/24"
}

variable "availability_zone" {
  description = "name of availability zone"
  default = "us-east-1a"
}

variable "environment" {
  description = "name of environment"
  default = "development"
}

resource "aws_vpc" "development-vpc" {
  cidr_block = var.vpc_cidr_block
   tags = {
    Name = "development-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id     = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  tags = {
    Name = "${var.environment}-subnet"
  }
}

output "dev-vpc-id" {
  value = aws_vpc.development-vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}
