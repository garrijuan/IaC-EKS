module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0" #~> significa que este en la ultima version pero solo en la 19, es decir, que no salte a la 20

  cluster_name    = "jgl-eks"
  cluster_version = "1.28"      #version k8s

  vpc_id                          = module.vpc.vpc_id
  subnet_ids                      = module.vpc.private_subnets #buena practica, mis nodos no estan expuestos a internet
  cluster_endpoint_public_access  = true                       #mala practica, en prod deberia estar en false, expongo la API k8s en internet
  cluster_endpoint_private_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
      #resolve_conflict = "OVERWRITE"
    }
    vpc-cni = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    #csi = {
    #  most_recent = true
    #}
  }

  manage_aws_auth_configmap = true

  eks_managed_node_group_defaults = {
    node-group = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instace_types    = ["t3.medium"]
      capacity_type    = "SPOT"
      #disk_size= 20
      #subnets = "module.vpc.private_subnets"

      tags = {
        Enviroment = "staging"
      }

    }
  }

  tags = {
    terraform  = "true"
    Enviroment = "staging"
  }
}