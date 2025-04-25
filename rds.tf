
resource "aws_db_subnet_group" "drupal" {
  name       = "drupal-db-subnet-group"
  subnet_ids = [aws_subnet.public_a.id, aws_subnet.public_b.id]

  tags = {
    Name = "Drupal DB subnet group"
  }
}

resource "aws_db_instance" "drupal" {
  identifier              = "drupal-db"
  allocated_storage       = 20
  max_allocated_storage   = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  db_name                 = var.db_name
  username                = var.db_user
  password                = "Drupal123!"
  db_subnet_group_name    = aws_db_subnet_group.drupal.name
  vpc_security_group_ids  = [aws_security_group.ecs_sg.id]
  skip_final_snapshot     = true
  publicly_accessible     = true
}
