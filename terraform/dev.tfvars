vpc_cidr_block = "192.168.0.0/16"

public_subnets = [
    {
        cidr_block = "192.168.1.0/24"
        availability_zone = "us-east-1a"
        dns_name = true
    },
    {
        cidr_block = "192.168.2.0/24"
        availability_zone = "us-east-1b"
        dns_name = true
    }
]

private_subnets = [
    {
        cidr_block = "192.168.100.0/24"
        availability_zone = "us-east-1c"
        dns_name = true
    },
    {
        cidr_block = "192.168.101.0/24"
        availability_zone = "us-east-1d"
        dns_name = true
    }

]