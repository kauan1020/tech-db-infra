variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
  default     = "tech-challenge"
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "ID da VPC onde o banco de dados será criado"
  type        = string
}

variable "subnet_ids" {
  description = "IDs das subnets onde o banco de dados será criado"
  type        = list(string)
}

variable "app_subnet_cidrs" {
  description = "CIDRs das subnets onde a aplicação está rodando"
  type        = list(string)
}

variable "db_username" {
  description = "Nome de usuário para o banco de dados"
  type        = string
  default     = "postgres"
  sensitive   = true
}

variable "db_password" {
  description = "Senha para o banco de dados"
  type        = string
  sensitive   = true
}