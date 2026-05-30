data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "microservices-demo-bucket-657830185735"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}


