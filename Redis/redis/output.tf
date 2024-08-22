output "redis_server_ip" {
  value = aws_instance.redis_server.public_ip
}
