module "eks" {
  source       = "https://github.com/JohnMonteir0/k8s_with_terraform.git"
  cidr_block   = "10.34.0.0/16"
  project_name = "eks"
  cluster_name = "eks"
}