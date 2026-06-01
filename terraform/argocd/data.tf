data "aws_eks_cluster" "main" {
  name = "microservices-demo"
}

data "aws_eks_cluster_auth" "main" {
  name = "microservices-demo"
}
