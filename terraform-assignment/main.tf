resource "aws_ecr_repository" "ecr_repository" {
  name = "example-ecr-repository"
  tags = {
    "Name" = "ExampleECRRepository"
  }
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "example-eks-cluster"
  role_arn = "arn:aws:iam::980637429038:role/AmazonEKSAutoNodeRole"

  vpc_config {
    subnet_ids = ["subnet-0ef199d7f17c4e3f2"]
  }

  tags = {
    "Name" = "ExampleEKSCluster"
  }

}
