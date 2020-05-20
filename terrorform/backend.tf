terraform {
  backend "s3" {
    bucket = "hithere-handy-interview"
    key    = "tfstate"
    region = "us-east-1"
  }
}
