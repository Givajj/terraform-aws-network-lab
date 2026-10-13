# Terraform AWS Network Lab

Projeto criado para praticar Terraform e provisionamento de infraestrutura na AWS.

A topologia possui:

- VPC
- Subnet DMZ pública
- Subnets APP e BD privadas
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Instâncias EC2 Linux e Windows

## Estrutura do projeto

- `terraform.tf` - configuração do Terraform e provider AWS
- `variables.tf` - variáveis utilizadas no projeto
- `network.tf` - recursos de rede
- `security.tf` - Security Groups e regras de acesso
- `compute.tf` - instâncias EC2
- `outputs.tf` - valores exibidos após a criação da infraestrutura

Os arquivos foram separados por responsabilidade para facilitar a organização e o estudo do código.
