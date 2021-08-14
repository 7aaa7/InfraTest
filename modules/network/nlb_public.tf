resource "aws_security_group" "prod-web-servers-sg" {  
  name_prefix = "${var.config.name}-prod-web-servers-sg"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    "Name"        = "${var.config.name}-prod-web-servers-sg"
    "Description" = "Allow traffic into public load balancer"
  }
}

# allow incoming traffic from port 80
resource "aws_security_group_rule" "nlb_public_in_80" {  
  type              = "ingress"
  security_group_id = aws_security_group.prod-web-servers-sg.id

  protocol    = "tcp"
  from_port   = 80
  to_port     = 80
  cidr_blocks = ["0.0.0.0/0"]
}

# allow incoming traffic from port 443
resource "aws_security_group_rule" "nlb_public_in_443" {  
  type              = "ingress"
  security_group_id = aws_security_group.prod-web-servers-sg.id

  protocol    = "tcp"
  from_port   = 443
  to_port     = 443
  cidr_blocks = ["0.0.0.0/0"]
}

# allow outgoing traffic within the VPC
resource "aws_security_group_rule" "nlb_public_out" {  
  type              = "egress"
  security_group_id = aws_security_group.prod-web-servers-sg.id

  protocol    = "tcp"
  from_port   = 0
  to_port     = 65535
  cidr_blocks = [var.vpc_cidr_block]
}


resource "aws_lb" "nlb_public" {  
  name            = "${var.config.name}-nlb-public"
  internal        = false  
  load_balancer_type = "network"  
  subnets         = compact(concat(aws_subnet.subnet_public_1a[*].id, [""]))

  access_logs {
    enabled = var.public_nlb_enable_access_logs
    bucket  = var.public_nlb_access_logs_bucket
    prefix  = var.public_nlb_access_logs_bucket_prefix
  }

  tags = {
    "Name" = "${var.config.name}-nlb-public"
  }
}
