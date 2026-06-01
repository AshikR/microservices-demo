resource "aws_eks_access_entry" "terraform_admin" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = "arn:aws:iam::657830185735:user/svc-terraform"

  type = "STANDARD"
}

resource "aws_eks_access_policy_association" "terraform_admin" {
  cluster_name  = aws_eks_cluster.main.name
  principal_arn = aws_eks_access_entry.terraform_admin.principal_arn

  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }
}
