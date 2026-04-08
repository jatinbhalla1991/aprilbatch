module "aws_ecr" {
  source = "./modules/aws_ecr"
  name = "example-ecr-repository"
  tags = {
    "Name" = "ExampleECRRepository"
  }
}

module "aws_iam" {
  source = "./modules/aws_iam"
  name = "example-eks-role"
  role_policy = {
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
  }
  policy_name = "example-eks-role-attachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  policy_roles = [aws_iam_role.eks_role.name]
}


module "aws_eks" {
  source = "./modules/aws_eks"
  name = "example-eks-cluster"
  role_arn = aws_iam_role.eks_role.arn
  vpc_config = {
    subnet_ids = data.aws_subnets.default.ids
  }
  tags = {
    "Name" = "ExampleEKSCluster"
  }
  dependency = aws_iam_policy_attachment.eks_role_attachment
}
