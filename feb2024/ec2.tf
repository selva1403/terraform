resource "aws_instance" "web" {
  ami             = "ami-0bfa008430b845cbc"
  instance_type   = "t2.micro"
  key_name        = "jan2024"
  security_groups = ["venus-sg"]

  tags = {
    Name = "appserver"

  }
}

resource "aws_ebs_volume" "example_volume" {
  size             = 1
  availability_zone = aws_instance.web.availability_zone

  tags = {
    Name = "test-volume"
  }
}
resource "aws_volume_attachment" "example_attachment" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.example_volume.id
  instance_id = aws_instance.web.id
}


