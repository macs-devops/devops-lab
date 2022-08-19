module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = "ami-052efd3df9dad4825"
  instance_type          = "t2.micro"
  key_name               = "pin-2022"
  monitoring             = true
  vpc_security_group_ids = ["sg-08f8123a6bcb15ef2"]
  subnet_id              = "subnet-0382a2bd272f58b0a"

  tags = {
    Terraform   = "true"
    Environment = "terraform"
  }
}
