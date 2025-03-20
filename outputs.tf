output "db_instance_endpoint" {
  description = "Endpoint do banco de dados RDS"
  value       = aws_db_instance.tech_database.endpoint
}

output "db_instance_name" {
  description = "Nome da instância RDS"
  value       = aws_db_instance.tech_database.identifier
}

output "db_username" {
  description = "Nome de usuário do banco de dados"
  value       = aws_db_instance.tech_database.username
  sensitive   = true
}

output "postgres_connection_string" {
  description = "String de conexão PostgreSQL"
  value       = "postgresql://${aws_db_instance.tech_database.username}:${var.db_password}@${aws_db_instance.tech_database.endpoint}/${aws_db_instance.tech_database.db_name}"
  sensitive   = true
}