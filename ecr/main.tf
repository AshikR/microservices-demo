resource "aws_ecr_repository" "client" {
  name = "microservices-demo-client"
}

resource "aws_ecr_repository" "posts" {
  name = "microservices-demo-posts"
}

resource "aws_ecr_repository" "comments" {
  name = "microservices-demo-comments"
}

resource "aws_ecr_repository" "query" {
  name = "microservices-demo-query"
}

resource "aws_ecr_repository" "moderation" {
  name = "microservices-demo-moderation"
}

resource "aws_ecr_repository" "event_bus" {
  name = "microservices-demo-event-bus"
}
