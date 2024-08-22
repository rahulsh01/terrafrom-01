provider "aws" {
  region = var.region
}

resource "aws_instance" "redis_server" {
  ami           = "ami-0a0e5d9c7acc336f1"  # Replace with an appropriate AMI ID for Redis
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, 0)

  tags = {
    Name = "Redis-Server-${var.environment}"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y redis${var.redis_version}
              systemctl start redis
              systemctl enable redis
              EOF
}

output "redis_public_ip" {
  value = aws_instance.redis_server.public_ip
}
