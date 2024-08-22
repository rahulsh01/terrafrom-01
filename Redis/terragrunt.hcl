terraform {
  source = "./redis"
}

inputs = {
  environment = "dev"
  vpc_id      = "vpc-005747842ce0bedc6"
  subnet_ids  = ["subnet-0231cd57ec4a98e2e", "subnet-00e3770d4dcd7eeb3"]
  ami_id      = "ami-0a0e5d9c7acc336f1"
  instance_type = "t2.micro"
}
