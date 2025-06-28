resource "aws_vpc" "tf_vpc" {
  cidr_block           = var.vpc_cidr # Refer var
  enable_dns_hostnames = true
  tags = {
    Name     = "tf_vpc",
    Resource = "VPC"
  }
}

# Subnet
resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.tf_vpc.cidr_block, 8, 1)
  map_public_ip_on_launch = true
  availability_zone       = var.az_a
  tags = {
    Name     = "subnet_a",
    Resource = "Subnet"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.tf_vpc.cidr_block, 8, 2)
  map_public_ip_on_launch = true
  availability_zone       = var.az_b
  tags = {
    Name     = "subnet_b",
    Resource = "Subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name     = "internet_gateway",
    Resource = "Internet Gateway"
  }
}

# Route table
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.tf_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name     = "route_table",
    Resource = "Route table"
  }
}

# association, public subnet
resource "aws_route_table_association" "subnet_route" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "subnet2_route" {
  subnet_id      = aws_subnet.subnet_a.id
  route_table_id = aws_route_table.route_table.id
}
