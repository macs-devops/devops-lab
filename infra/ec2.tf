resource "aws_instance" "pin2022" {

  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"

  tags = {
    Terraform   = "true"
    Environment = "terraform"
  }
}

