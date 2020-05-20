resource "aws_ecr_repository" "hithere" {
  name = "hithere"
}

output "url" {
  value = aws_ecr_repository.hithere.repository_url
}
