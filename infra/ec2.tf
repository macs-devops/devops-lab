resource "aws_instance" "web" {
  ami           = "ami-08ae71fd7f1449df1"
  instance_type = "t2.micro"

  tags = {
    Name = "ec2-pin2022"
  }
}
