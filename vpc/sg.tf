resource "aws_security_group" "public" {
  name        = "public-sg"
  description = "Allow web traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "public-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.public.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
