module "eks" {
  source       = "/mnt/c/Users/brmonj10/Gran_Cursos_Online/Repos/Pessoal/k8s_with_terraform/"
  cidr_block   = "10.34.0.0/16"
  project_name = "eks"
  cluster_name = "eks"
}