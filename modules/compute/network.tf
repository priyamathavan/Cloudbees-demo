resource "aws_vpc" "cloudbees_vpc" {
  cidr_block = var.network_cidr
}

resource "aws_internet_gateway" "cloudbees_igw" {
  vpc_id = aws_vpc.cloudbees_vpc.id 
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.cloudbees_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true  

  tags = {
    Name = "cloudbees_vpc_public_a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.cloudbees_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true  

  tags = {
    Name = "cloudbees_vpc_public_b"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.cloudbees_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "cloudbees_vpc_private_a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.cloudbees_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "cloudbees_vpc_private_b"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.cloudbees_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cloudbees_igw.id
  }

  tags = {
    Name = "cloudbees_vpc_public_rt"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.cloudbees_vpc.id
  tags = {
    Name = "cloudbees_vpc_private_rt"
  }
}

resource "aws_route_table_association" "public_a_rta" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_b_rta" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "ec2_sg" {
  name        = "EC2SecurityGroup"
  description = "Security group for EC2 instance"
  vpc_id = aws_vpc.cloudbees_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Security group for RDS"
  vpc_id = aws_vpc.cloudbees_vpc.id
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = [aws_subnet.private_a.id, aws_subnet.private_b.id]
  tags = {
    Name = "RDS Subnet Group"
  }
}


