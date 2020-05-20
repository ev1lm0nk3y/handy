resource "aws_cloudwatch_log_group" "hithere" {
  name              = "/aws/eks/hithere/cluster"
  retention_in_days = 1
}
