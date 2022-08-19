module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-052efd3df9dad4825"
  instance_type          = "t2.micro"
  key_name               = "pin2022"
  monitoring             = true
  vpc_security_group_ids = ["sg-0fd5214d272e690d6"]
  subnet_id              = "subnet-00874fe6cd236e4b2"

  tags = {
    Terraform   = "true"
    Environment = "terraform"
  }
}
