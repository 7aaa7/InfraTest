resource "aws_security_group" "nlb_public" {  
  name_prefix = "${var.config.name}-sg-public-nlb"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    "Name"        = "${var.config.name}-sg-public-alb"
    "Description" = "Allow traffic into public load balancer"
  }
}

# allow incoming traffic from port 80
resource "aws_security_group_rule" "nlb_public_in_80" {  
  type              = "ingress"
  security_group_id = aws_security_group.nlb_public.id

  protocol    = "tcp"
  from_port   = 80
  to_port     = 80
  cidr_blocks = ["0.0.0.0/0"]
}

# allow incoming traffic from port 443
resource "aws_security_group_rule" "nlb_public_in_443" {  
  type              = "ingress"
  security_group_id = aws_security_group.nlb_public.id

  protocol    = "tcp"
  from_port   = 443
  to_port     = 443
  cidr_blocks = ["0.0.0.0/0"]
}

# allow outgoing traffic within the VPC
resource "aws_security_group_rule" "alb_public_out" {  
  type              = "egress"
  security_group_id = aws_security_group.nlb_public.id

  protocol    = "tcp"
  from_port   = 0
  to_port     = 65535
  cidr_blocks = [var.vpc_cidr_block]
}