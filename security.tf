#Security Groups e regras de acesso
resource "aws_security_group" "sg_dmz" {
  name        = "dmz_sg"
  description = "Security group DMZ"
  vpc_id      = aws_vpc.vpc_lab.id
  tags = {
    Name = "dmz_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_dmz_ssh" {
  security_group_id = aws_security_group.sg_dmz.id
  cidr_ipv4         = "0.0.0.0/16"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_security_group" "sg_app" {
  name        = "app_sg"
  description = "Security group APP"
  vpc_id      = aws_vpc.vpc_lab.id
  tags = {
    Name = "app_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_app_ssh" {
  security_group_id            = aws_security_group.sg_app.id
  referenced_security_group_id = aws_security_group.sg_dmz.id

  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "sg_app_rdp" {
  security_group_id            = aws_security_group.sg_app.id
  referenced_security_group_id = aws_security_group.sg_dmz.id

  from_port   = 3389
  to_port     = 3389
  ip_protocol = "tcp"
}

resource "aws_security_group" "sg_bd" {
  name        = "bd_sg"
  description = "Security group BD"
  vpc_id      = aws_vpc.vpc_lab.id
  tags = {
    Name = "bd_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_bd_12555" {
  security_group_id            = aws_security_group.sg_bd
  referenced_security_group_id = aws_security_group.sg_app.id

  from_port   = 12555
  to_port     = 12555
  ip_protocol = "tcp"
}


#Regras de saída dos Security Groups para acesso externo
resource "aws_vpc_security_group_egress_rule" "sg_dmz_egress" {
  security_group_id = aws_security_group.sg_dmz.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "sg_app_egress" {
  security_group_id = aws_security_group.sg_app.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_egress_rule" "sg_bd_egress" {
  security_group_id = aws_security_group.sg_bd.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}