data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_key_pair" "webserver-public-key" {
  key_name   = "webserver-public-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD+F+ERRZaCwaHOXPklPuM06JOpdBn3Bse6N8wJrtHOHlPxuLROE5V79Gvrp6rUBVthvPXDGEsEl6SJNyj1LuE7EgJs5icz2PBNPJKU/Z1Lde+2OFRxXN9Tnesy24Ovrm4W4v9zauUatBumcr+0t2dtM05gCI1nKUBuOg3PRTc+X4AQ1pGv+J7Wl3kwYP1AHPu6hoj/4ABbkHWURe/LRF5h4DAfCayMcm1QxpiqZlPlzRUKhpU0buP2UzGJ2Q4eRoL2wCg1SBm6NfipER97XDXUxWhi4kNtqGMSTrranCgYn7B1hBKcgEdKWJialCnPqkGFdpggc1q0acGX0wer+jNP"
}

resource "aws_instance" "prod-web-servers" {
  count = local.config.servers_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = "r5.large"
  subnet_id = data.aws_subnet.subnet-backend-1a.id
  vpc_security_group_ids = [ data.aws_security_group.web-servers.id ]
  key_name = aws_key_pair.webserver-public-key.key_name  
  tags = {
    Name = "prod-web-server-${count.index}"
    Tier = "Private"
    Type = "Backend"
  }
}

resource "aws_lb_target_group" "web-servers-http" {
  name     = "${local.config.name}-web-servers-http"
  port     = 80
  protocol = "TCP"
  vpc_id   = data.aws_vpc.vpc.id
}

resource "aws_lb_target_group" "web-servers-https" {
  name     = "${local.config.name}-web-servers-https"
  port     = 443
  protocol = "TCP"
  vpc_id   = data.aws_vpc.vpc.id
}


resource "aws_lb_target_group_attachment" "web-servers-attachment-http" {
  count = local.config.servers_count
  target_group_arn = aws_lb_target_group.web-servers-http.arn
  target_id        = aws_instance.prod-web-servers[count.index].id
  port             = 80
}

resource "aws_lb_target_group_attachment" "web-servers-attachment-https" {
  count = local.config.servers_count
  target_group_arn = aws_lb_target_group.web-servers-https.arn
  target_id        = aws_instance.prod-web-servers[count.index].id
  port             = 443
}

resource "aws_lb_listener" "web-service-https" {
  load_balancer_arn = data.aws_lb.nlb-public.arn
  port              = "443"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-servers-https.arn
  }
}

resource "aws_lb_listener" "web-service-http" {
  load_balancer_arn = data.aws_lb.nlb-public.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-servers-http.arn
  }
}