#!/bin/bash

# Recupera informações de conexão do banco de dados usando Terraform output
DB_ENDPOINT=$(terraform output -raw db_instance_endpoint)
DB_USER=$(terraform output -raw db_username)

# Solicita a senha (para não armazenar em variáveis de ambiente ou no script)
echo "Digite a senha do banco de dados:"
read -s DB_PASSWORD

# Conecta ao banco de dados
PGPASSWORD=$DB_PASSWORD psql -h $DB_ENDPOINT -U $DB_USER -d postgres