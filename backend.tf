terraform {
  backend "s3" {
    bucket         = "demo-terraform-state-s3-bucket-hrv"
    key            = "statefiles/devops-state.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "stateLockDb"
  }
}