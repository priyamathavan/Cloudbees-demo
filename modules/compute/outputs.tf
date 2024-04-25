###########################
########### EC2 ###########
###########################
output "ec2_public_ipv4" {
  value = aws_instance.ec2_instance.public_ip
}

output "ec2_id" {
  value = aws_instance.ec2_instance.id
}

output "ec2_standby_public_ipv4" {
  value = aws_instance.ec2_instance_standby.public_ip
}

output "ec2_standby_id" {
  value = aws_instance.ec2_instance_standby.id
}

###########################
########### RDS ###########
###########################

output "rds_instance_id" {
  value = aws_db_instance.rds_instance.id
  description = "The ID of the RDS instance"
}

output "rds_private_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}


output "vpc_id" {
  value       = aws_vpc.cloudbees_vpc.id
  description = "The ID of the VPC"
}

output "private_subnet_a_id" {
  value       = aws_subnet.private_a.id
  description = "The ID of Private Subnet A"
}

output "private_subnet_a_az" {
  value       = aws_subnet.private_a.availability_zone
  description = "The Availablity Zone of Private Subnet A"
}

output "private_subnet_b_id" {
  value       = aws_subnet.private_b.id
  description = "The ID of Private Subnet B"
}


output "public_subnet_a_id" {
  value       = aws_subnet.public_a.id
  description = "The ID of Public Subnet A"
}


output "public_rt" {
  value       = aws_route_table.public_rt.id
  description = "The ID of the Public Route Table"
}
