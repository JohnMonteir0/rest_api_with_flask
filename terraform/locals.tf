locals {
  name   = "eks-cluster"
  region = "us-east-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Cluster    = local.name
    GithubRepo = "terraform-aws-eks"
    GithubOrg  = "terraform-aws-modules"
  }
}

locals {
  pod_cidr     = "100.64.0.0/16"
  az_index_map = { for idx, az in local.azs : az => idx }
}