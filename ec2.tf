resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.main.id
  private_ips = ["10.0.1.8"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "test-ec2" {
  ami           = "ami-0d75513e7706cf2d9" # us-west-2
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.foo.id
    device_index         = 0
  }

}

