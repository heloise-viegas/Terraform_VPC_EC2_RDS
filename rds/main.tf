resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.test.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}

resource "aws_db_subnet_group" "test" {
  name       = "test"
  subnet_ids = var.private_subnet_ids
 

  tags = {
    Name = "test"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow MySQL access only from EC2 SG"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "example" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = var.ec2_sg_id
  security_group_id = aws_security_group.rds_sg.id
  description       = "Allow MySQL access from web security group"
}