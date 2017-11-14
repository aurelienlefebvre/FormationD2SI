provider "aws" {}

resource "aws_vpc" "mon_vpc" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name        = "VPC de Aurelien"
    DateCreated = "14/11/2017"
  }
}

resource "aws_subnet" "mon_subnet" {
  vpc_id                  = "${aws_vpc.mon_vpc.id}"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags {
    Name        = "Subnet de Aurelien"
    DateCreated = "14/11/2017"
  }
}

resource "aws_internet_gateway" "ma_gateway" {
  vpc_id = "${aws_vpc.mon_vpc.id}"

  tags {
    Name        = "Gateway de Aurelien"
    DateCreated = "14/11/2017"
  }
}

resource "aws_route_table" "ma_route_table" {
  vpc_id = "${aws_vpc.mon_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ma_gateway.id}"
  }

  tags {
    Name        = "Route table de Aurelien"
    DateCreated = "14/11/2017"
  }
}

resource "aws_route_table_association" "ma_route_table_association" {
  subnet_id      = "${aws_subnet.mon_subnet.id}"
  route_table_id = "${aws_route_table.ma_route_table.id}"
}
