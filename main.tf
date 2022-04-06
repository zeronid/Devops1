terraform{
    required_providers {
        aws= {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "alex_vpc" {
    cidr_block = "192.168.7.0/25"
    tags={
        Name="alex_vpc"
    }
}

resource "aws_subnet" "subnet_web" {
    vpc_id = aws_vpc.alex_vpc.id
    cidr_block = "192.168.7.0/27"

    tags={
        Name="subnet_web"
    }
}

resource "aws_subnet" "subnet_app" {
    vpc_id = aws_vpc.alex_vpc.id
    cidr_block = "192.168.7.32/27"

    tags={
        Name="subnet_app"
    }
}

resource "aws_subnet" "subnet_DB" {
    vpc_id = aws_vpc.alex_vpc.id
    cidr_block = "192.168.7.64/28"

    tags={
        Name="subnet_db"
    }
}