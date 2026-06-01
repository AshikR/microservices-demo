resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "microservices-demo-workers"

  node_role_arn = aws_iam_role.eks_nodes.arn

  subnet_ids = [
    data.terraform_remote_state.vpc.outputs.public_subnet_1_id,
    data.terraform_remote_state.vpc.outputs.public_subnet_2_id
  ]

  instance_types = ["t3.small"]

  scaling_config {
    desired_size = 3
    min_size     = 1
    max_size     = 3
  }

  depends_on = [
    aws_iam_role_policy_attachment.worker_nodes,
    aws_iam_role_policy_attachment.cni,
    aws_iam_role_policy_attachment.ecr
  ]
}
