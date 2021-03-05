terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

// Provisioning Application Server
module "ec2_cluster" {
  source                     = "terraform-aws-modules/ec2-instance/aws"
  
  name                       = var.project_name
  ami                        = "ami-0ecd34837cf9fa094"
  instance_type              = var.instance_type
  key_name                   = "project"
  monitoring                 = var.monitoring
  vpc_security_group_ids     = [module.ec2_sg.this_security_group_id]
  subnet_id                  = "subnet-bc4dd3da"
  user_data                  = local.userdata

}

module "ec2_sg" {
  source                     = "terraform-aws-modules/security-group/aws"  
  
  name                       = join("", [var.project_name, "-", "sg"])
  description                = join("", [var.project_name, "-", "sg"])
  ingress_with_cidr_blocks   = var.ingress_with_cidr_blocks
  egress_with_cidr_blocks    = var.egress_with_cidr_blocks
  vpc_id                     = "vpc-d3bb11ae"
}


output "this_security_group_id" {
  description = "The ID of the security group"
  value = module.ec2_sg.this_security_group_id
}