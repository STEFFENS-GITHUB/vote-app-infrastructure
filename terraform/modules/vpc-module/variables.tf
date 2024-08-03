# VPC RESOURCE VARIABLES

variable "vpc_cidr_block" {
    description = "CIDR block for the VPC"
    type = string
    default = "192.168.0.0/16"
}

variable "bool_dns_hostnames" {
    description = "Boolean value for enabling DNS hostname allocation in VPC"
    type = bool
    default = true
}

variable "bool_dns_support" {
    description = "Boolean value for enabling DNS resolution support in VPC"
    type = bool
    default = true
}

variable "vpc_name_tag" {
    description = "Name tag for the VPC"
    type = string
    default = ""
}

# IGW VARIABLES

variable "igw_name_tag" {
    description = "Name tag for the IGW"
    type = string
    default = ""
}

# PUBLIC SUBNET VARIABLES

variable "public_subnet_cidr" {
    description = "CIDR block for the public VPC"
    type = string
    default = "192.168.1.0/24"
}

variable "public_subnet_az" {
    description = "Availability zone for public subnet"
    type = string
    default = "us-east-1a"
}

variable "public_subnet_map_ip" {
    description = "Variable for mapping public IPs to instances"
    type = bool
    default = true
}

variable "public_subnet_dns_name" {
    description = "Variable for mapping dns names to a records"
    type = bool
    default = true
}

# PRIVATE SUBNET VARIABLES

variable "private_subnet_cidr" {
    description = "CIDR block for the private VPC"
    type = string
    default = "192.168.100.0/24"
}

variable "private_subnet_az" {
    description = "Availability zone for private subnet"
    type = string
    default = "us-east-1c"
}

variable "private_subnet_dns_name" {
    description = "Variable for mapping dns names to a records"
    type = bool
    default = true
}