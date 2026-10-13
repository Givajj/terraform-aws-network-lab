variable "region_lab" {
  type        = string
  description = "Regiao AWS usada no laboratorio"
  default     = "us-east-1"
}

variable "cidr_lab" {
  type        = string
  description = "CIDR principal da VPC do laboratorio"
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  type        = string
  description = "Tipo das instancias EC2 do laboratorio"
  default     = "t3.micro"
}

variable "linux_ami" {
  type        = string
  description = "AMI Linux usada nas instancias EC2"
  default     = "ami-097855b862d5b1eb2"
}

variable "windows_ami" {
  type        = string
  description = "AMI Windows usada na instancia APP"
  default     = "ami-00d8aa800578d8b12"
}