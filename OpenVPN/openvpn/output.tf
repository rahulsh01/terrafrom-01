output "openvpn_server_ip" {
  value = aws_instance.openvpn_server.public_ip
}
