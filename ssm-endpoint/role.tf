resource "aws_iam_role" "ec2_ssm_role" {
  name = "ec2_ssm_role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : {
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "ec2.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }
  })
}

resource "aws_iam_role_policy_attachment" "ssm_role_attach" {
  role       = aws_iam_role.ec2_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "SSM_Endpoint_Bridge"
  role = aws_iam_role.ec2_ssm_role.name
}
