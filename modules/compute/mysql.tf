data "aws_ssm_parameter" "db_password" {
  name        = "dbpassword"
}


resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  identifier             = var.identifier
  username               = var.username
  password               = data.aws_ssm_parameter.db_password.value
  multi_az               = true
  db_subnet_group_name   = module.network.rds_subnet_group_name
  vpc_security_group_ids = [module.network.ec2_sg_id]
  skip_final_snapshot    = true
  tags = {
    Name = "mysql-${terraform.workspace}"
  }
}
