### 기본 VPC 없을 경우 에러 발생

### 기본 VPC 생성
```bash
aws ec2 create-default-vpc --region [리전명]
```

### 기본 서브넷만 생성
```bash
aws ec2 craete-default-subnet --availability-zone [가용영역명]
```