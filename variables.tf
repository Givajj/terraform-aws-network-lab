variable "region_lab" {
  type        = string
  description = "Region on VPC-LAB"
  default     = "us-east-1"
}

variable "cidr_lab" {
  type        = string
  description = "CIDR on VPC"
  default     = "10.0.0.0/16"
}

variable "instance_type" {
  type        = string
  description = "Tipo das instâncias EC2"
  default     = "t3.micro"
}

variable "linux_ami" {
  type        = string
  description = "AMI Linux usada"
  default     = "ami-097855b862d5b1eb2"
}

variable "windows_ami" {
  type        = string
  description = "AMI Windows usada"
  default     = "ami-00d8aa800578d8b12"

}