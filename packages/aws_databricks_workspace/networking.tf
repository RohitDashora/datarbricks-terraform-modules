# Import the AWS provider
provider "aws" {
  version = "~> 2.0"
}

# Create a VPC module
module "vpc" {
  source = "./vpc"

  vpc_cidr_block = "10.0.0.0/16"
}

# Create a public subnet module
module "public_subnet" {
  source = "./public_subnet"

  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

# Create a private subnet module
module "private_subnet" {
  source = "./private_subnet"

  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1a"
}

# Create a security group module
module "security_group" {
  source = "./security_group"

  vpc_id = module.vpc.vpc_id
}
