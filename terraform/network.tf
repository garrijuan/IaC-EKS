module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "jgl-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  create_igw         = true
  enable_nat_gateway = true
  single_nat_gateway = true #en prod lo ideal es tener una nat por cada subnet privada(poner en false), por si se cae una az tener las otras para salir a internet 
                            ##true: crea un solo nat y comparte con todas las subnet, false: crea un nat por cada subnet

  tags = {
    terraform  = "true"
    Enviroment = "staging"

  }
}