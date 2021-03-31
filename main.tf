provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""  
}

resource "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name: "development-vpc"
      vpc_env: "dev"
    }
}

resource "aws_subnet" "dev-subnet" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name: "dev-subnet"
    } 
}

data "aws_vpc" "existing-vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "dev-subnet2" {
    vpc_id = data.aws_vpc.existing-vpc.id
    cidr_block = "10.0.24.0/24"
    availability_zone = "us-east-1a"
    tags = {
      Name: "dev-subnet2"
    }
}
