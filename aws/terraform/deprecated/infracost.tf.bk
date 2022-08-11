resource "aws_instance" "web_app" {
  ami           = "ami-052efd3df9dad4825"
  instance_type = "t2.micro"

  root_block_device {
    volume_size = 20
  }
}

resource "aws_s3_bucket" "bucket-infracost" {
  bucket = "max-devops-infracost"

  tags = {
    Name = "max-devops"
  }
}
