### aws instance_profile에 역할 부착

aws ec2 associate-iam-instance-profile --iam-instance-profile Name=ec2_profile --instance-id i-0ddeeec6b77524b33

### aws instance id check

aws-run ec2 describe-instances \
--query 'Reservations[].Instances[].InstanceId' | jq ".[]" | tr -d '"' | pbcopy

### aws_profile arn check

- ec2에 적용된 profile과 생성된 프로필 비교
  aws ec2 describe-iam-instance-profile-associations --filters Name=instance-id,Values=i-0ddeeec6b77524b33 --query 'IamInstanceProfileAssociations[].IamInstanceProfile.Arn' | jq ".[]" | tr -d '"' | awk -F/ '{print $2}'
