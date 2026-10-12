resource "aws_vpc" "vpc_lab" {
  cidr_block = var.cidr_lab
  tags = {
    Name = "vpc-network-lab"
  }
}

resource "aws_subnet" "subnet_dmz" {
  vpc_id            = aws_vpc.vpc_lab.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Subnet-Pub-DMZ-AZ-1a"
  }
}

resource "aws_subnet" "subnet_app" {
  vpc_id            = aws_vpc.vpc_lab.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Subnet-Priv-App-AZ-1b"
  }
}

resource "aws_subnet" "subnet_bd" {
  vpc_id            = aws_vpc.vpc_lab.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1c"
  tags = {
    Name = "Subnet-Priv-BD-AZ-1c"
  }
}

resource "aws_internet_gateway" "igw_network_lab" {
  vpc_id = aws_vpc.vpc_lab.id
  tags = {
    Name = "IGW-VPC-LAB"
  }
}

resource "aws_eip" "eip_network_lab" {
  domain = "vpc"
  tags = {
    Name = "EIP-NAT-VPC-LAB"
  }
}

resource "aws_nat_gateway" "nat_network_lab" {
  allocation_id = aws_eip.eip_network_lab.id
  subnet_id     = aws_subnet.subnet_dmz.id
  tags = {
    Name = "NAT-VPC-LAB"
  }
  depends_on = [aws_internet_gateway.igw_network_lab]
}

resource "aws_route_table" "dmz_rtb" {
  vpc_id = aws_vpc.vpc_lab.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_network_lab.id
  }
  tags = {
    Name = "rt-dmz-public"
  }
}

resource "aws_route_table" "app_rtb" {
  vpc_id = aws_vpc.vpc_lab.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_network_lab.id
  }
  tags = {
    Name = "rt-app-private"
  }
}

resource "aws_route_table" "bd_rtb" {
  vpc_id = aws_vpc.vpc_lab.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_network_lab.id
  }
  tags = {
    Name = "rt-bd-private"
  }
}

resource "aws_route_table_association" "dmz_rtb_assoc" {
  subnet_id      = aws_subnet.subnet_dmz.id
  route_table_id = aws_route_table.dmz_rtb.id
}

resource "aws_route_table_association" "app_rtb_assoc" {
  subnet_id      = aws_subnet.subnet_app.id
  route_table_id = aws_route_table.app_rtb.id
}

resource "aws_route_table_association" "bd_rtb_assoc" {
  subnet_id      = aws_subnet.subnet_bd.id
  route_table_id = aws_route_table.bd_rtb.id
}
