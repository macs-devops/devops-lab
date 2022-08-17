data "aws_region" "current" {}

resource "aws_vpc_ipam" "pin" {
  operating_regions {
    region_name = data.aws_region.current.name
  }
}

resource "aws_vpc_ipam_pool" "pin" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.pin.private_default_scope_id
  locale         = data.aws_region.current.name
}

resource "aws_vpc_ipam_pool_cidr" "pin" {
  ipam_pool_id = aws_vpc_ipam_pool.pin.id
  cidr         = "172.2.0.0/16"
}

resource "aws_vpc" "pin" {
  ipv4_ipam_pool_id   = aws_vpc_ipam_pool.pin.id
  ipv4_netmask_length = 28
  depends_on = [
    aws_vpc_ipam_pool_cidr.pin
  ]
}

