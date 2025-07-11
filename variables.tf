variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS CLI profile"
  type        = string
  default     = "enerbit"
}

variable "cluster_name" {
  description = "Name of EKS cluster"
  type        = string
  default     = "demo-eks-cluster"
}

variable "cluster_version" {
  description = "EKS version"
  type        = string
  default     = "1.29"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "instance_types" {
  description = "Instance types for EKS node group"
  type        = list(string)
  default     = ["t3.small"]
}

variable "desired_size" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}