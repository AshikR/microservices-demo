data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "alb_assume_role" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity"
    ]

    effect = "Allow"

    principals {
      type = "Federated"

      identifiers = [
        aws_iam_openid_connect_provider.eks.arn
      ]
    }

    condition {
      test = "StringEquals"

      variable = "${replace(
        aws_iam_openid_connect_provider.eks.url,
        "https://",
        ""
      )}:sub"

      values = [
        "system:serviceaccount:kube-system:aws-load-balancer-controller"
      ]
    }
  }
}


resource "aws_iam_policy" "alb_controller" {
  name   = "microservices-demo-alb-controller-policy"
  policy = file("${path.module}/iam_policy.json")
}

resource "aws_iam_role" "alb_controller" {
  name = "microservices-demo-alb-controller-role"

  assume_role_policy = data.aws_iam_policy_document.alb_assume_role.json
}

resource "aws_iam_role_policy_attachment" "alb_controller" {
  role       = aws_iam_role.alb_controller.name
  policy_arn = aws_iam_policy.alb_controller.arn
}
