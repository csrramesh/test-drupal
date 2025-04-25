
resource "aws_db_subnet_group" "drupal" {
  name       = "drupal-db-subnet-group"
  subnet_ids = ["subnet-12345678", "subnet-23456789"]  # Placeholder
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
  db_name                 = "drupal"
  username                = "drupaluser"
  password                = "Drupal123!"
  db_subnet_group_name    = aws_db_subnet_group.drupal.name
  vpc_security_group_ids  = ["sg-12345678"]  # Placeholder
  skip_final_snapshot     = true
  publicly_accessible     = true
}
