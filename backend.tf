
terraform {
  backend "s3" {
    bucket = "terraform-backend-altaidevops"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
