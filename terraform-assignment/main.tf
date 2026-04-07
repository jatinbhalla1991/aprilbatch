resource "aws_ecr_repository" "ecr_repository" {
  name = "example-ecr-repository"
  tags = {
    "Name" = "ExampleECRRepository"
  }
}

resource "aws_iam_role" "eks_role" {
  name = "example-eks-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "eks_role_attachment" {
  name       = "example-eks-role-attachment"
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_eks_cluster" "eks_cluster" {
  name     = "example-eks-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = data.aws_subnet_ids.default.ids
  }

  depends_on = [ aws_iam_policy_attachment.eks_role_attachment ]
  tags = {
    "Name" = "ExampleEKSCluster"
  }

}
