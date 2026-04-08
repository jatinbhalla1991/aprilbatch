variable "name" {
  type        = string
  description = "Name of iam role"
}

variable "role_policy" {
  type        = any
  description = "Policy attached to the IAM role"
}

variable "policy_name" {
  type        = string
  description = "Name of the policy"
}

variable "policy_arn" {
  type        = string
  description = "ARN of the policy to attach to the IAM role"
}
