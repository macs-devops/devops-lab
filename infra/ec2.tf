resource "aws_instance" "pin2022" {

  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"

  user_data = file("userdata.sh")

  vpc_security_group_ids = [aws_security_group.pin.id]

  tags = {
    Terraform   = "true"
    Environment = "terraform"
  }
}

