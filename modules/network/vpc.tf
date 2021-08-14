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
