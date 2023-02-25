resource "aws_vpc" "myapp-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name : "${var.env_prefix}-vpc"
  }
}

module "myapp-subnet" {
  source                 = "./modules/subnet"
  subnet_cidr_block      = var.subnet_cidr_block
  availability_zone      = var.availability_zone
  env_prefix             = var.env_prefix
  my_ip                  = var.my_ip
  vpc_id                 = aws_vpc.myapp-vpc.id
  default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id
}
module "myapp-security-group" {
  source     = "./modules/security_group"
  env_prefix = var.env_prefix
  my_ip      = var.my_ip
  vpc_id     = aws_vpc.myapp-vpc.id
}
module "myapp-server_1" {
  source                    = "./modules/webserver"
  availability_zone         = var.availability_zone
  env_prefix                = var.env_prefix
  my_ip                     = var.my_ip
  instance_type             = var.instance_type
  vpc_id                    = aws_vpc.myapp-vpc.id
  subnet_id                 = module.myapp-subnet.subnet.id
  public_key_location       = var.public_key_location
  default_security_group_id = module.myapp-security-group.security_group.id
  key_name                  = var.key_name_1
}

module "myapp-server_2" {
  source                    = "./modules/webserver"
  availability_zone         = var.availability_zone
  env_prefix                = var.env_prefix
  my_ip                     = var.my_ip
  instance_type             = var.instance_type
  vpc_id                    = aws_vpc.myapp-vpc.id
  subnet_id                 = module.myapp-subnet.subnet.id
  public_key_location       = var.public_key_location
  default_security_group_id = module.myapp-security-group.security_group.id
  key_name                  = var.key_name_2
}
