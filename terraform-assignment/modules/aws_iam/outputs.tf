output "role_arn" {
  value       = aws_iam_role.eks_role.arn
  description = "ARN of the IAM role created for the EKS cluster"
}
