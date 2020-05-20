resource "aws_iam_role" "hithere" {
  name = "hithere"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "hithere-cluster" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.hithere.name
}

resource "aws_iam_role_policy_attachment" "hithere-service" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.hithere.name
}

resource "aws_iam_policy" "interview2" {
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement" : {
    "Action": "sts:AssumeRole",
    "Effect": "Allow",
    "Resource": "${aws_iam_role.hithere.arn}"
  }
}
EOF
}

resource "aws_iam_user_policy_attachment" "interview2" {
  user       = "interview2"
  policy_arn = aws_iam_policy.interview2.arn
}
