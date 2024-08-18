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

resource "aws_subnet" "public_subnets" {
  for_each = { for i, subnet in var.public_subnets : i => subnet }
  
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  enable_resource_name_dns_a_record_on_launch = each.value.dns_name

  map_public_ip_on_launch = true
  vpc_id = aws_vpc.terraform-vpc.id

  tags = { 
    Tier = "public"
  }

  depends_on = [
    aws_vpc.terraform-vpc
  ]
}

resource "aws_subnet" "private_subnets" {
  for_each = { for i, subnet in var.private_subnets : i => subnet }
  
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  enable_resource_name_dns_a_record_on_launch = each.value.dns_name

  vpc_id = aws_vpc.terraform-vpc.id

  tags = { 
    Tier = "private"
  }

  depends_on = [
    aws_vpc.terraform-vpc
  ]
}