output "vpc_id" {
  value = aws_vpc.vpc_lab.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.nat_network_lab.id
}

output "ec2_dmz_public_ip" {
  value = aws_instance.ec2_dmz.public_ip
}

output "ec2_app_linux_private_ip" {
  value = aws_instance.ec2_app_linux.private_ip
}

output "ec2_app_windows_private_ip" {
  value = aws_instance.ec2_app_windows.private_ip
}

output "ec2_bd_linux_private_ip" {
  value = aws_instance.ec2_bd_linux.private_ip
}