module "vpc" {
  source                  = "terraform-aws-modules/vpc/aws"
  version                 = "5.7.0"
  name                    = "jenkins-server-vpc"
  cidr                    = "10.20.0.0/16"
  map_public_ip_on_launch = true
  azs                     = ["us-east-2a", "us-east-2b", "us-east-2c"]
  // Custom private subnets
  private_subnets = ["10.20.101.0/24", "10.20.102.0/24", "10.20.103.0/24"]

  // Custom public subnets
  public_subnets = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]

  enable_nat_gateway = true # this will launch 1 nat for each az. this for prod env
  single_nat_gateway = true # this will launch only 1 nat for all your infrastructure. if both are true single nat will prime

  public_subnet_tags = {
    "kubernetes.io/role/elb"                    = 1
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"           = 1
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  tags = {
    name        = "jenkins-server-vpc"
    Terraform   = "true"
    Environment = "dev"
    owner       = "danniella"

  }
}