resource "aws_security_group" "postgres" {
  name        = "tech-postgres-sg-${var.environment}"
  description = "Allow PostgreSQL inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description     = "PostgreSQL from application subnets"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    cidr_blocks     = var.app_subnet_cidrs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "tech-postgres-sg-${var.environment}"
    Environment = var.environment
  }
}