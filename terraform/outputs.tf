output "instance_ip" {
  description = "Публічна IP-адреса створеного сервера"
  value       = aws_instance.devops_server.public_ip
}

output "instance_id" {
  description = "ID створеного інстансу"
  value       = aws_instance.devops_server.id
}
