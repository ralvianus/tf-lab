resource "aws_instance" "web_server" {
  count = var.instance_count
  ami   = "ami-09f238ada65bd0563"
  instance_type = "t3.micro"

  # the VPC subnet
  subnet_id = aws_subnet.public[count.index].id

  # the security group
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]

  # the public SSH key
  key_name = var.key_pair_name

  tags = {
    Name = "${var.name_prefix}-web-${count.index}"
  }
}