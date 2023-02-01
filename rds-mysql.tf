resource "aws_db_instance" "orchsky" {
  identifier             = "orchsky-${terraform.workspace}"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  name                   = "orchsky"
  username               = "orchsky"
  password               = "Admin1234"
  parameter_group_name   = "default.mysql5.7"
  db_subnet_group_name   = aws_db_subnet_group.orchsky.id
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
}

resource "aws_db_subnet_group" "orchsky" {
  name       = "orchsky-rds"
  subnet_ids = aws_subnet.private.*.id

  tags = {
    Name = "Orchsky RDS Subnet group"
  }

}

resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Allow traffic for rds/mysql"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.web_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}