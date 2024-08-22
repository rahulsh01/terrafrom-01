provider "aws" {
  region = var.region
}

resource "aws_instance" "openvpn_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, 0)

  tags = {
    Name = "OpenVPN-Server-${var.environment}"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y openvpn
              EOF
}
