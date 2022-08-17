resource "aws_vpc" "pin" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostNames

  tags = {
    Name = "pin"
  }
} # end resource

resource "aws_subnet" "pin_subnet" {
  vpc_id                  = aws_vpc.pin.id
  cidr_block              = var.subnetCIDRblock
  map_public_ip_on_launch = var.mapPublicIP
  availability_zone       = var.availabilityZone

  tags = {
    Name = "pin_subnet"
  }
}

resource "aws_security_group" "pin_sg" {
  vpc_id      = aws_vpc.pin.id
  name        = "pin_sg"
  description = "My VPC Security Group"

  # allow ingress of port 22
  ingress {
    cidr_blocks = var.ingressCIDRblock
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "pin_sg"
    Description = "pin VPC security group"
  }
}

resource "aws_network_acl" "pin_acl" {
  vpc_id     = aws_vpc.pin.id
  subnet_ids = [aws_subnet.pin_subnet.id]
  # allow ingress port 22
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 22
    to_port    = 22
  }

  # allow ingress port 80 
  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 80
    to_port    = 80
  }

  # allow ingress ephemeral ports 
  ingress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 1024
    to_port    = 65535
  }

  # allow egress port 22 
  egress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 22
    to_port    = 22
  }

  # allow egress port 80 
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 80
    to_port    = 80
  }

  # allow egress ephemeral ports
  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = var.destinationCIDRblock
    from_port  = 1024
    to_port    = 65535
  }
  tags = {
    Name = "pin_acl"
  }
} # end resource

resource "aws_internet_gateway" "pin_gw" {
  vpc_id = aws_vpc.pin.id
  tags = {
    Name = "pin_gw"
  }
} # end resource
# Create the Route Table
resource "aws_route_table" "pin_route_table" {
  vpc_id = aws_vpc.pin.id
  tags = {
    Name = "pin_route_table"
  }
} # end resou

resource "aws_route" "pin_internet_access" {
  route_table_id         = aws_route_table.pin_route_table.id
  destination_cidr_block = var.destinationCIDRblock
  gateway_id             = aws_internet_gateway.pin_gw.id
} # end resource
# Associate the Route Table with the Subnet
resource "aws_route_table_association" "pin_association" {
  subnet_id      = aws_subnet.pin_subnet.id
  route_table_id = aws_route_table.pin_route_table.id
} # end resource

