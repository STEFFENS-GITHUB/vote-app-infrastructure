resource "aws_vpc" "terraform-vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = var.bool_dns_hostnames
  enable_dns_support = var.bool_dns_support
  tags = {
    Name = var.vpc_name_tag
  }
}

resource "aws_internet_gateway" "terraform-igw" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = var.igw_name_tag
  }
  depends_on = [
    aws_vpc.terraform-vpc
  ]
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.terraform-vpc.id
  cidr_block = var.public_subnet_cidr
  tags = {
    Tier = "public"
  }
  availability_zone = var.public_subnet_az
  map_public_ip_on_launch = var.public_subnet_map_ip
  enable_resource_name_dns_a_record_on_launch = var.public_subnet_dns_name
  depends_on = [
    aws_vpc.terraform-vpc
  ]
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.terraform-vpc.id
  cidr_block = var.private_subnet_cidr
  tags = {
    Tier = "private"
  }
  availability_zone = var.private_subnet_az
  enable_resource_name_dns_a_record_on_launch = var.private_subnet_dns_name
  depends_on = [
    aws_vpc.terraform-vpc
  ]
}