resource "aws_db_instance" "tech_database" {
  identifier           = "tech-database-2-${var.environment}"
  allocated_storage    = 50
  apply_immediately    = true
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "14"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.postgres14"

  vpc_security_group_ids = [aws_security_group.postgres.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name

  backup_retention_period = 1
  backup_window           = "03:00-04:00"
  maintenance_window      = "mon:04:00-mon:05:00"

  skip_final_snapshot = true
  deletion_protection = false
  publicly_accessible = false
  multi_az            = false

  storage_encrypted = false

  performance_insights_enabled = true

  tags = {
    Name        = "tech-database-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "terraform"
    "TestPipe"  = "v1"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "tech-db-subnet-group-${var.environment}"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "Tech DB Subnet Group"
    Environment = var.environment
  }
}