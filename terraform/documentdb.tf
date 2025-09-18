resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "flask-app"
  engine                  = "docdb"
  master_username         = "restapi"
  master_password         = "xF08sDg9N0j5"
  backup_retention_period = 1
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true

  db_subnet_group_name   = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [aws_security_group.allow_eks_cluster.id]
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count                = 2
  identifier           = "docdb-${count.index}"
  cluster_identifier   = aws_docdb_cluster.docdb.id
  instance_class       = "db.t4g.medium"
}

resource "aws_security_group" "allow_eks_cluster" {
  name   = "MongoDB access from EKS node group"
  vpc_id = module.vpc.vpc_id

  ingress {
    description = "MongoDB access from EKS cluster sg"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    security_groups = [
      module.eks_bottlerocket.node_security_group_id
    ]
  }
}