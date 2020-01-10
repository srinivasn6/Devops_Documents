output "instance_ip_addr" {
  value = aws_instance.webserver.public_ip
}

output "instance_public_dns" {
  value = aws_instance.webserver.public_dns
}