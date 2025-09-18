resource "aws_ecr_repository" "this" {
  name         = "flask-app-ecr"
  force_delete = true
}