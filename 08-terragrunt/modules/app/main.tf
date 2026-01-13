resource "aws_instance" "app" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t3.micro"
  count         = var.instance_count

  tags = {
    Name        = "${var.environment}-app"
    Environment = var.environment
  }
}
