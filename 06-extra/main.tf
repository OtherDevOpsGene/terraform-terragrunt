module "www" {
  source = "./modules/webserver"

  instance_type = "t4g.nano"

  tags = {
    Name   = var.server_name
    Owner  = var.owner_email
    Class  = var.class_name
    Lesson = "lesson-06"
  }
}

output "private_ip" {
  description = "Private IP address for the webserver instance."
  value       = module.www.webserver_private_ip
}

