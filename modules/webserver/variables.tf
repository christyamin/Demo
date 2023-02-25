variable "vpc_cidr_block" {
  description = "vpc cidr block"
  default     = "10.0.0.0/16"
}

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
variable "instance_type" {
  description = "name of instance type"
  default     = "t2.micro"
}
variable "public_key_location" {
  description = "name of public key"
  default     = "C:/Users/USER/.ssh/id_rsa.pub"
}
variable "my_ip" {
  description = "name of ip address"
  default     = "80.89.77.167/32"
}
variable "vpc_id" {
  description = "name of vpc id"
  default = "vpc_id"
}
variable "subnet_id" {
  description = "name of subnet id"
  default = "subnet_id"
}
variable "default_security_group_id" {
  description = "name of security group"
  default = "myapp-security-group"
}
variable "key_name" {
  description = "name of key"
  default = "server_key"
}

