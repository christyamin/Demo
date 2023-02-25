variable "subnet_cidr_block" {
  description = "subnet cidr block"
  default     = "10.0.10.0/24"
}

variable "availability_zone" {
  description = "name of availability zone"
  default     = "us-east-1a"
}

variable "env_prefix" {
  description = "name of environment"
  default     = "dev"
}
variable "my_ip" {
  description = "name of ip address"
  default     = "80.89.77.167/32"
}
variable "vpc_id" {
    description = "name of vpc_id"
}
variable "default_route_table_id" {
    description = "name of route table"
}