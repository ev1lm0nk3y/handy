resource "aws_eks_cluster" "hithere" {
  name     = "hithere"
  role_arn = aws_iam_role.hithere.arn

  enabled_cluster_log_types = ["api", "audit"]

  vpc_config {
    subnet_ids = [
      aws_subnet.hithere-a.id,
      aws_subnet.hithere-b.id,
    ]
  }

  depends_on = [
    aws_cloudwatch_log_group.hithere,
    aws_iam_role_policy_attachment.hithere-cluster,
    aws_iam_role_policy_attachment.hithere-service,
  ]
}
