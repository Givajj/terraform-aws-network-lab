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