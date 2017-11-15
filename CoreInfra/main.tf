provider "aws" {}

resource "aws_vpc" "mon_vpc" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name        = "VPC de Aurelien"
    DateCreated = "14/11/2017"
  }
}

variable subnet_cidrs{
  type="list"
  default=["10.0.1.0/24","10.0.2.0/24"]
}

resource "aws_subnet" "mon_subnet" {
  count = 2
  vpc_id                  = "${aws_vpc.mon_vpc.id}"
  cidr_block              = "${element(var.subnet_cidrs,count.index)}"
  map_public_ip_on_launch = true
  tags {
    Name        = "Subnet de Aurelien - ${count.index}"
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
  count = 2
  subnet_id      = "${element(aws_subnet.mon_subnet.*.id,count.index)}"
  route_table_id = "${aws_route_table.ma_route_table.id}"
}
