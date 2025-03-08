output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.portfolio_server.public_ip
}

output "instance_private_ip" {
  description = "Private IP of the EC2 instance"
  value       = aws_instance.portfolio_server.private_ip
}

output "instance_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.portfolio_server.public_dns
}

output "portfolio_public_ip" {
  value = aws_eip.portfolio_eip.public_ip
}

