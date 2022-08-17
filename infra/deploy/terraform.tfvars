aws_region = "us-east-1"
namespace  = "terraform"
# Keep this off till you are ready to provision
bastion_enabled = false
# Supply a VPC where you can test the bastion
bastion_private_subnet_ids = ["subnet-01a2fa9c4ef8da8da"]
bastion_vpc_id             = "vpc-06d64452a7bd4c834"
# We use these tags in our bootstrap policies to constrain IAM actions where we
# can
tags = { "owner" = "max-devops" }
