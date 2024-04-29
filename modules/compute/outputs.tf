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
