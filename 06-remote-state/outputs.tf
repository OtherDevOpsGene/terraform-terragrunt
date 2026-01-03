output "instance_private_ip" {
  description = "Private IP address of the instance."
  value       = aws_instance.webserver.private_ip
}

output "instance_ami_name" {
  description = "The name of the AMI that the instance is using."
  value       = data.aws_ami.ubuntu_noble.name
}
