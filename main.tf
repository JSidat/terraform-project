provider "aws" {
  region                  = "eu-west-2"
  alias = "London"
  shared_credentials_file = "C:/Users/Junaid/.aws/credentials"
}

provider "aws" {
  region                  = "eu-west-3"
  alias = "Paris"
  shared_credentials_file = "C:/Users/Junaid/.aws/credentials"
}

provider "aws" {
  region                  = "ap-south-1"
  alias = "Mumbai"
  shared_credentials_file = "C:/Users/Junaid/.aws/credentials"
}

module "aws_    vpc" {
  source = "./VPC"
}

module "aws_sg" {
  source = "./SG"
  vpc_id = module.aws_vpc.vpc_1
}

module "ec2" {
  source                 = "./EC2"
  public_subnet_id       = module.aws_vpc.subnet_London_id
  vpc_security_group_ids = module.aws_sg.aws_sg_id
}

