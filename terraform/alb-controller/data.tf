data "aws_eks_cluster" "main" {
  name = "microservices-demo"
}

data "tls_certificate" "eks" {
  url = data.aws_eks_cluster.main.identity[0].oidc[0].issuer
}
