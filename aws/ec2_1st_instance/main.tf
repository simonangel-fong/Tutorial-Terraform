# Specify resource type
resource "aws_instance" "my_vm" {
  ami           = "ami-0a7d80731ae1b2435" //Ubuntu AMI
  instance_type = "t2.micro"

  tags = {
    Name = "My EC2 instance",
  }
}
