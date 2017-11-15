output "vpc_id"{
  value="${aws_vpc.mon_vpc.id}"
}

output "subnet1_id"{
  value="${aws_subnet.mon_subnet.0.id}"
}

output "subnet2_id"{
  value="${aws_subnet.mon_subnet.1.id}"
}

output "subnet_ids"{
  value=["${aws_subnet.mon_subnet.*.id}"]
}
