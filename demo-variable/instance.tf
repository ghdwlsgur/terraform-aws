resource "aws_instance" "example" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
}

# lookup(map, key, default)
/*
loopup() retrieves the value of a single element from a map, given its key. 
If the given key does not exist, the given default value is returened instead.

즉, 위 lookup()는 map 타입의 변수 AMIS에 키 값으로 AWS_REGION 변수 값을 전달하여 
반환받은 value 값으로 ami에 할당한다.
*/

