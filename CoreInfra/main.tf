provider "aws" {}

resource "aws_vpc" "mon_vpc" {
  cidr_block = "10.0.0.0/16"

  tags {
    Name        = "VPC de Aurelien"
    DateCreated = "14/11/2017"
  }
}

resource "aws_subnet" "mon_subnet" {
  vpc_id     = "${aws_vpc.mon_vpc.id}"
  cidr_block = "10.0.0.0/16"

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
