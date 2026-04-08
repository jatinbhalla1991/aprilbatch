variable "name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "role_arn" {
  type        = string
  description = "role arn"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the EKS cluster"
}

variable "vpc_config" {
  type = object({
    subnet_ids = list(string)
  })
  description = "VPC configuration for the EKS cluster"
}
