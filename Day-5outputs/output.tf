output "az" {
    value = aws_instance.prod.availability_zone
  
}

output "ip" {
    value = aws_instance.prod.public_ip
  
}

output "privateIp" {
    value = aws_instance.prod.private_ip
    sensitive = true
  
}