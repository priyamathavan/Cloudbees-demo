module "network" {
  source = "../network"
}

resource "aws_instance" "ec2_instance" {
  ami           = data.aws_ami.amazon-linux-2.id 
  instance_type = lookup(var.instance_type,terraform.workspace)
  key_name      = aws_key_pair.public_rsa_key.key_name
  subnet_id   = module.network.public_subnet_a_id
  vpc_security_group_ids = [module.network.ec2_sg_id]
  tags = {
    Name = "cloudbees-tech-instance"
    Environment = terraform.workspace
    IACTool = "terraform"
    
  }
}

resource "aws_instance" "ec2_instance_standby" {
  ami           = data.aws_ami.amazon-linux-2.id 
  instance_type = lookup(var.instance_type,terraform.workspace)
  key_name      = aws_key_pair.public_rsa_key.key_name
  subnet_id   = module.network.public_subnet_b_id
  vpc_security_group_ids = [module.network.ec2_sg_id]
  tags = {
    Name = "cloudbees-tech-instance"
    Environment = terraform.workspace
    IACTool = "terraform"  
  }
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_rsa_key" {
  content  = tls_private_key.key.private_key_pem
  filename = "private_rsa_key"
}

resource "aws_key_pair" "public_rsa_key" {
  key_name   = "public_rsa_key"
  public_key = tls_private_key.key.public_key_openssh
}

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
