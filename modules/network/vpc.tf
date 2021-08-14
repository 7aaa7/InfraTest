terraform {
  required_version = ">= 1.0"
}

resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc_cidr_block
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = var.vpc_enable_ipv6

  lifecycle {
    ignore_changes = [tags, ]
  }
  tags = {
    Name      = "${var.config.name}-vpc"
    Team      = "Test"
    CreatedBy = "Terraform"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_subnet" "subnet_public_1a" {  
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_public_1a_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.config.name}-subnet-public-1a"
    Tier = "Public"
  }
}


resource "aws_subnet" "subnet_backend_1a" {  
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_backend_1a_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "${var.config.name}-subnet-backend-1a"
    Tier = "Private"
    Type = "Backend"
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.config.name}-igw"
  }
}