terraform {
  backend "s3" {
    bucket       = "microservices-demo-bucket-657830185735"
    key          = "github-actions/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
