resource "aws_eks_cluster" "main" {
  name     = "microservices-demo"
  role_arn = aws_iam_role.eks_cluster.arn

  version = "1.34"


  access_config {
    authentication_mode = "API"
  }

  vpc_config {
    subnet_ids = [
      data.terraform_remote_state.vpc.outputs.public_subnet_1_id,
      data.terraform_remote_state.vpc.outputs.public_subnet_2_id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_policy
  ]
}
