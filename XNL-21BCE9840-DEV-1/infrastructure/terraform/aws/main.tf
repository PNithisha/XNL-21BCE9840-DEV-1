provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "eks_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "eks_subnet" {
  count             = 2
  vpc_id           = aws_vpc.eks_vpc.id
  cidr_block       = "10.0.${count.index}.0/24"
  availability_zone = element(["us-east-1a", "us-east-1b"], count.index)
}

resource "aws_eks_cluster" "eks" {
  name     = "multi-cloud-eks"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = aws_subnet.eks_subnet[*].id
  }
}

resource "aws_iam_role" "eks_role" {
  name = "eksClusterRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "eks.amazonaws.com" }
    }]
  })
}
