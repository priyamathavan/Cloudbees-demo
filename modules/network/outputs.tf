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

output "public_subnet_b_id" {
  value       = aws_subnet.public_b.id
  description = "The ID of Public Subnet A"
}

output "public_rt" {
  value       = aws_route_table.public_rt.id
  description = "The ID of the Public Route Table"
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id 
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg  
}

output "rds_subnet_group_name" {
  value = aws_db_subnet_group.rds_subnet_group.name
  
}
