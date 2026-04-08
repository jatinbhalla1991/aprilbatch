resource "aws_iam_role" "eks_role" {
  name = var.name

  assume_role_policy = jsonencode(var.role_policy)
  #   assume_role_policy = jsonencode({
  #     Version = "2012-10-17"
  #     Statement = [
  #       {
  #         Effect = "Allow"
  #         Principal = {
  #           Service = "eks.amazonaws.com"
  #         }
  #         Action = "sts:AssumeRole"
  #       }
  #     ]
  #   })
}

resource "aws_iam_policy_attachment" "eks_role_attachment" {
  name       = var.policy_name
  roles      = [aws_iam_role.eks_role.name]
  policy_arn = var.policy_arn
}
