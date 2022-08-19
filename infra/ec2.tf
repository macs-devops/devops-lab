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

resource "aws_security_group" "pin" {
  name = "pin2022"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

