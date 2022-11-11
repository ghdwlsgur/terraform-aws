### instance-profile be attacheed to EC2

aws ec2 associate-iam-instance-profile --iam-instance-profile Name=SSM_Endpoint_Bridge --instance-id i-01717de37ec3f1d43

aws ec2 associate-iam-instance-profile --iam-instance-profile Name=SSM_Endpoint_Bridge --instance-id $(aws-run ec2 describe-instances \
--query 'Reservations[].Instances[].InstanceId' \
--filters Name=instance-state-code,Values=16 | jq ".[]" | tr -d '"')

### vpc's cidr block of instance check

aws ec2 describe-vpcs \
--vpc-ids vpc-0d45f4c15f9739f50 \
--query 'Vpcs[].CidrBlock' | jq ".[]" | tr -d '"'

aws-run ec2 describe-instances \
--query 'Reservations[].Instances[].InstanceId' \
--filters Name=instance-state-code,Values=16 | jq ".[]" | tr -d '"'

### aws instance id check

aws-run ec2 describe-instances \
--query 'Reservations[].Instances[].InstanceId' | jq ".[]" | tr -d '"' | pbcopy

### aws instance vpc_id check

aws-run ec2 describe-instances \
--query 'Reservations[].Instances[].NetworkInterfaces[].VpcId' | jq ".[]" | tr -d '"'

### aws instance subnet_id check

aws-run ec2 describe-instances \--query 'Reservations[].Instances[].NetworkInterfaces[].SubnetId' | jq ".[]" | tr -d '"'

### aws_profile arn check

- ec2에 적용된 profile과 생성된 프로필 비교
  aws ec2 describe-iam-instance-profile-associations --filters Name=instance-id,Values=i-0ddeeec6b77524b33 --query 'IamInstanceProfileAssociations[].IamInstanceProfile.Arn' | jq ".[]" | tr -d '"' | awk -F/ '{print $2}'

### environment variable check

env

### export variable

export TF_VAR_vpc_id=$(aws-run ec2 describe-instances \
--query 'Reservations[].Instances[].NetworkInterfaces[].VpcId' | jq ".[]" | tr -d '"')

export TF_VAR_subnet_id=$(aws-run ec2 describe-instances \--query 'Reservations[].Instances[].NetworkInterfaces[].SubnetId' | jq ".[]" | tr -d '"')
export TF_VAR_aws_region=ap-northeast-2

export TF_VAR_vpc_cidr=$(aws ec2 describe-vpcs \
--vpc-ids $(aws-run ec2 describe-instances \
--query 'Reservations[].Instances[].NetworkInterfaces[].VpcId' | jq ".[]" | tr -d '"') \
--query 'Vpcs[].CidrBlock' | jq ".[]" | tr -d '"')
