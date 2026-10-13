resource "aws_instance" "ec2_dmz" {
  ami           = var.linux_ami
  instance_type = var.instance_type

  subnet_id                   = aws_subnet.subnet_dmz.id
  vpc_security_group_ids      = [aws_security_group.sg_dmz.id]
  associate_public_ip_address = true

  tags = {
    Name = "ec2_dmz_linux"
  }
}

resource "aws_instance" "ec2_app_linux" {
  ami           = var.linux_ami
  instance_type = var.instance_type

  subnet_id              = aws_subnet.subnet_app.id
  vpc_security_group_ids = [aws_security_group.sg_app.id]

  tags = {
    Name = "ec2_app_linux"
  }
}

resource "aws_instance" "ec2_app_windows" {
  ami           = var.windows_ami
  instance_type = var.instance_type

  subnet_id              = aws_subnet.subnet_app.id
  vpc_security_group_ids = [aws_security_group.sg_app.id]

  tags = {
    Name = "ec2_app_windows"
  }
}

resource "aws_instance" "ec2_bd_linux" {
  ami           = var.linux_ami
  instance_type = var.instance_type

  subnet_id              = aws_subnet.subnet_bd.id
  vpc_security_group_ids = [aws_security_group.sg_bd.id]

  tags = {
    Name = "ec2_bd_linux"
  }
}

