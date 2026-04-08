resource "aws_eks_cluster" "eks_cluster" {
  name     = var.name
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.vpc_config.subnet_ids
  }

  tags = var.tags

}
