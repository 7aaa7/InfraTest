# terraformTest
` NOTE: Terraform apply has to run from "Terraform/infra" directory, Terraform state would be stored on local directory, there is no remote state storage`

```
 ➜ cd Terraform/ 
 ➜ cd infra  

 ➜ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # data.aws_lb.nlb-public will be read during apply
  # (config refers to values not yet known)
 <= data "aws_lb" "nlb-public"  {
      + access_logs                = (known after apply)
      + arn                        = (known after apply)
      + arn_suffix                 = (known after apply)
      + customer_owned_ipv4_pool   = (known after apply)
      + dns_name                   = (known after apply)
      + drop_invalid_header_fields = (known after apply)
      + enable_deletion_protection = (known after apply)
      + enable_http2               = (known after apply)
      + id                         = (known after apply)
      + idle_timeout               = (known after apply)
      + internal                   = (known after apply)
      + ip_address_type            = (known after apply)
      + load_balancer_type         = (known after apply)
      + name                       = "terraform-test-nlb-public"
      + security_groups            = (known after apply)
      + subnet_mapping             = (known after apply)
      + subnets                    = (known after apply)
      + tags                       = (known after apply)
      + vpc_id                     = (known after apply)
      + zone_id                    = (known after apply)
    }

  # data.aws_security_group.web-servers will be read during apply
  # (config refers to values not yet known)
 <= data "aws_security_group" "web-servers"  {
      + arn         = (known after apply)
      + description = (known after apply)
      + id          = (known after apply)
      + name        = (known after apply)
      + tags        = {
          + "Name" = "terraform-test-prod-web-servers-sg"
        }
      + vpc_id      = (known after apply)
    }

  # data.aws_subnet.subnet-backend-1a will be read during apply
  # (config refers to values not yet known)
 <= data "aws_subnet" "subnet-backend-1a"  {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = (known after apply)
      + availability_zone               = (known after apply)
      + availability_zone_id            = (known after apply)
      + available_ip_address_count      = (known after apply)
      + cidr_block                      = (known after apply)
      + customer_owned_ipv4_pool        = (known after apply)
      + default_for_az                  = (known after apply)
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_customer_owned_ip_on_launch = (known after apply)
      + map_public_ip_on_launch         = (known after apply)
      + outpost_arn                     = (known after apply)
      + owner_id                        = (known after apply)
      + state                           = (known after apply)
      + tags                            = {
          + "Name" = "terraform-test-subnet-backend-1a"
        }
      + vpc_id                          = (known after apply)
    }

  # data.aws_vpc.vpc will be read during apply
  # (config refers to values not yet known)
 <= data "aws_vpc" "vpc"  {
      + arn                     = (known after apply)
      + cidr_block              = (known after apply)
      + cidr_block_associations = (known after apply)
      + default                 = (known after apply)
      + dhcp_options_id         = (known after apply)
      + enable_dns_hostnames    = (known after apply)
      + enable_dns_support      = (known after apply)
      + id                      = (known after apply)
      + instance_tenancy        = (known after apply)
      + ipv6_association_id     = (known after apply)
      + ipv6_cidr_block         = (known after apply)
      + main_route_table_id     = (known after apply)
      + owner_id                = (known after apply)
      + state                   = (known after apply)
      + tags                    = {
          + "Name" = "terraform-test-vpc"
        }
    }

  # aws_instance.prod-web-servers[0] will be created
  + resource "aws_instance" "prod-web-servers" {
      + ami                                  = "ami-0443fb07ed652c341"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "r5.large"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "webserver-public-key"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "prod-web-server-0"
          + "Tier" = "Private"
          + "Type" = "Backend"
        }
      + tags_all                             = {
          + "Name" = "prod-web-server-0"
          + "Tier" = "Private"
          + "Type" = "Backend"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_instance.prod-web-servers[1] will be created
  + resource "aws_instance" "prod-web-servers" {
      + ami                                  = "ami-0443fb07ed652c341"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "r5.large"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "webserver-public-key"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Name" = "prod-web-server-1"
          + "Tier" = "Private"
          + "Type" = "Backend"
        }
      + tags_all                             = {
          + "Name" = "prod-web-server-1"
          + "Tier" = "Private"
          + "Type" = "Backend"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification {
          + capacity_reservation_preference = (known after apply)

          + capacity_reservation_target {
              + capacity_reservation_id = (known after apply)
            }
        }

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + enclave_options {
          + enabled = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + metadata_options {
          + http_endpoint               = (known after apply)
          + http_put_response_hop_limit = (known after apply)
          + http_tokens                 = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + tags                  = (known after apply)
          + throughput            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_key_pair.webserver-public-key will be created
  + resource "aws_key_pair" "webserver-public-key" {
      + arn         = (known after apply)
      + fingerprint = (known after apply)
      + id          = (known after apply)
      + key_name    = "webserver-public-key"
      + key_pair_id = (known after apply)
      + public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD+F+ERRZaCwaHOXPklPuM06JOpdBn3Bse6N8wJrtHOHlPxuLROE5V79Gvrp6rUBVthvPXDGEsEl6SJNyj1LuE7EgJs5icz2PBNPJKU/Z1Lde+2OFRxXN9Tnesy24Ovrm4W4v9zauUatBumcr+0t2dtM05gCI1nKUBuOg3PRTc+X4AQ1pGv+J7Wl3kwYP1AHPu6hoj/4ABbkHWURe/LRF5h4DAfCayMcm1QxpiqZlPlzRUKhpU0buP2UzGJ2Q4eRoL2wCg1SBm6NfipER97XDXUxWhi4kNtqGMSTrranCgYn7B1hBKcgEdKWJialCnPqkGFdpggc1q0acGX0wer+jNP"
      + tags_all    = (known after apply)
    }

  # aws_lb_listener.web-service-http will be created
  + resource "aws_lb_listener" "web-service-http" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + load_balancer_arn = (known after apply)
      + port              = 80
      + protocol          = "TCP"
      + ssl_policy        = (known after apply)
      + tags_all          = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }
    }

  # aws_lb_listener.web-service-https will be created
  + resource "aws_lb_listener" "web-service-https" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + load_balancer_arn = (known after apply)
      + port              = 443
      + protocol          = "TCP"
      + ssl_policy        = (known after apply)
      + tags_all          = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }
    }

  # aws_lb_target_group.web-servers-http will be created
  + resource "aws_lb_target_group" "web-servers-http" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + deregistration_delay               = 300
      + id                                 = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancing_algorithm_type      = (known after apply)
      + name                               = "terraform-test-web-servers-http"
      + port                               = 80
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "TCP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + slow_start                         = 0
      + tags_all                           = (known after apply)
      + target_type                        = "instance"
      + vpc_id                             = (known after apply)

      + health_check {
          + enabled             = (known after apply)
          + healthy_threshold   = (known after apply)
          + interval            = (known after apply)
          + matcher             = (known after apply)
          + path                = (known after apply)
          + port                = (known after apply)
          + protocol            = (known after apply)
          + timeout             = (known after apply)
          + unhealthy_threshold = (known after apply)
        }

      + stickiness {
          + cookie_duration = (known after apply)
          + cookie_name     = (known after apply)
          + enabled         = (known after apply)
          + type            = (known after apply)
        }
    }

  # aws_lb_target_group.web-servers-https will be created
  + resource "aws_lb_target_group" "web-servers-https" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + deregistration_delay               = 300
      + id                                 = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancing_algorithm_type      = (known after apply)
      + name                               = "terraform-test-web-servers-https"
      + port                               = 443
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "TCP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + slow_start                         = 0
      + tags_all                           = (known after apply)
      + target_type                        = "instance"
      + vpc_id                             = (known after apply)

      + health_check {
          + enabled             = (known after apply)
          + healthy_threshold   = (known after apply)
          + interval            = (known after apply)
          + matcher             = (known after apply)
          + path                = (known after apply)
          + port                = (known after apply)
          + protocol            = (known after apply)
          + timeout             = (known after apply)
          + unhealthy_threshold = (known after apply)
        }

      + stickiness {
          + cookie_duration = (known after apply)
          + cookie_name     = (known after apply)
          + enabled         = (known after apply)
          + type            = (known after apply)
        }
    }

  # aws_lb_target_group_attachment.web-servers-attachment-http[0] will be created
  + resource "aws_lb_target_group_attachment" "web-servers-attachment-http" {
      + id               = (known after apply)
      + port             = 80
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # aws_lb_target_group_attachment.web-servers-attachment-http[1] will be created
  + resource "aws_lb_target_group_attachment" "web-servers-attachment-http" {
      + id               = (known after apply)
      + port             = 80
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # aws_lb_target_group_attachment.web-servers-attachment-https[0] will be created
  + resource "aws_lb_target_group_attachment" "web-servers-attachment-https" {
      + id               = (known after apply)
      + port             = 443
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # aws_lb_target_group_attachment.web-servers-attachment-https[1] will be created
  + resource "aws_lb_target_group_attachment" "web-servers-attachment-https" {
      + id               = (known after apply)
      + port             = 443
      + target_group_arn = (known after apply)
      + target_id        = (known after apply)
    }

  # module.network.aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "terraform-test-igw"
        }
      + tags_all = {
          + "Name" = "terraform-test-igw"
        }
      + vpc_id   = (known after apply)
    }

  # module.network.aws_lb.nlb_public will be created
  + resource "aws_lb" "nlb_public" {
      + arn                              = (known after apply)
      + arn_suffix                       = (known after apply)
      + dns_name                         = (known after apply)
      + enable_cross_zone_load_balancing = false
      + enable_deletion_protection       = false
      + id                               = (known after apply)
      + internal                         = false
      + ip_address_type                  = (known after apply)
      + load_balancer_type               = "network"
      + name                             = "terraform-test-nlb-public"
      + security_groups                  = (known after apply)
      + subnets                          = (known after apply)
      + tags                             = {
          + "Name" = "terraform-test-nlb-public"
        }
      + tags_all                         = {
          + "Name" = "terraform-test-nlb-public"
        }
      + vpc_id                           = (known after apply)
      + zone_id                          = (known after apply)

      + access_logs {
          + enabled = false
        }

      + subnet_mapping {
          + allocation_id        = (known after apply)
          + ipv6_address         = (known after apply)
          + outpost_id           = (known after apply)
          + private_ipv4_address = (known after apply)
          + subnet_id            = (known after apply)
        }
    }

  # module.network.aws_security_group.prod-web-servers-sg will be created
  + resource "aws_security_group" "prod-web-servers-sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "terraform-test-prod-web-servers-sg"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Description" = "Allow traffic into public load balancer"
          + "Name"        = "terraform-test-prod-web-servers-sg"
        }
      + tags_all               = {
          + "Description" = "Allow traffic into public load balancer"
          + "Name"        = "terraform-test-prod-web-servers-sg"
        }
      + vpc_id                 = (known after apply)
    }

  # module.network.aws_security_group_rule.public_in_443 will be created
  + resource "aws_security_group_rule" "public_in_443" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 443
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 443
      + type                     = "ingress"
    }

  # module.network.aws_security_group_rule.public_in_80 will be created
  + resource "aws_security_group_rule" "public_in_80" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 80
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 80
      + type                     = "ingress"
    }

  # module.network.aws_security_group_rule.public_out will be created
  + resource "aws_security_group_rule" "public_out" {
      + cidr_blocks              = [
          + "10.0.0.0/16",
        ]
      + from_port                = 0
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 65535
      + type                     = "egress"
    }

  # module.network.aws_subnet.subnet_backend_1a will be created
  + resource "aws_subnet" "subnet_backend_1a" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-south-1a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.0.0/19"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = false
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name" = "terraform-test-subnet-backend-1a"
          + "Tier" = "Private"
          + "Type" = "Backend"
        }
      + tags_all                        = {
          + "Name" = "terraform-test-subnet-backend-1a"
          + "Tier" = "Private"
          + "Type" = "Backend"
        }
      + vpc_id                          = (known after apply)
    }

  # module.network.aws_subnet.subnet_public_1a will be created
  + resource "aws_subnet" "subnet_public_1a" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "ap-south-1a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "10.0.176.0/22"
      + id                              = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "Name" = "terraform-test-subnet-public-1a"
          + "Tier" = "Public"
        }
      + tags_all                        = {
          + "Name" = "terraform-test-subnet-public-1a"
          + "Tier" = "Public"
        }
      + vpc_id                          = (known after apply)
    }

  # module.network.aws_vpc.vpc will be created
  + resource "aws_vpc" "vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.0.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "CreatedBy" = "Terraform"
          + "Name"      = "terraform-test-vpc"
          + "Team"      = "Test"
        }
      + tags_all                         = {
          + "CreatedBy" = "Terraform"
          + "Name"      = "terraform-test-vpc"
          + "Team"      = "Test"
        }
    }

Plan: 20 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.network.aws_vpc.vpc: Creating...
aws_key_pair.webserver-public-key: Creating...
aws_key_pair.webserver-public-key: Creation complete after 0s [id=webserver-public-key]
module.network.aws_vpc.vpc: Still creating... [10s elapsed]
module.network.aws_vpc.vpc: Creation complete after 12s [id=vpc-07f82473dd24853d7]
module.network.aws_internet_gateway.igw: Creating...
module.network.aws_subnet.subnet_public_1a: Creating...
module.network.aws_subnet.subnet_backend_1a: Creating...
module.network.aws_security_group.prod-web-servers-sg: Creating...
module.network.aws_subnet.subnet_backend_1a: Creation complete after 1s [id=subnet-09cdf20652acae779]
module.network.aws_internet_gateway.igw: Creation complete after 1s [id=igw-03f5d48130853c7df]
module.network.aws_security_group.prod-web-servers-sg: Creation complete after 1s [id=sg-08edb6407ac0b6f5a]
module.network.aws_security_group_rule.public_in_443: Creating...
module.network.aws_security_group_rule.public_in_80: Creating...
module.network.aws_security_group_rule.public_out: Creating...
module.network.aws_security_group_rule.public_in_443: Creation complete after 1s [id=sgrule-2337406845]
module.network.aws_security_group_rule.public_out: Creation complete after 1s [id=sgrule-1849098247]
module.network.aws_security_group_rule.public_in_80: Creation complete after 2s [id=sgrule-418803717]
module.network.aws_subnet.subnet_public_1a: Still creating... [10s elapsed]
module.network.aws_subnet.subnet_public_1a: Creation complete after 11s [id=subnet-0fbb69dd3a3f565c8]
module.network.aws_lb.nlb_public: Creating...
module.network.aws_lb.nlb_public: Still creating... [10s elapsed]
module.network.aws_lb.nlb_public: Still creating... [20s elapsed]
module.network.aws_lb.nlb_public: Still creating... [30s elapsed]
module.network.aws_lb.nlb_public: Still creating... [40s elapsed]
^[module.network.aws_lb.nlb_public: Still creating... [50s elapsed]
module.network.aws_lb.nlb_public: Still creating... [1m0s elapsed]
module.network.aws_lb.nlb_public: Still creating... [1m10s elapsed]
module.network.aws_lb.nlb_public: Still creating... [1m20s elapsed]
module.network.aws_lb.nlb_public: Still creating... [1m30s elapsed]
module.network.aws_lb.nlb_public: Still creating... [1m40s elapsed]
module.network.aws_lb.nlb_public: Still creating... [1m50s elapsed]
module.network.aws_lb.nlb_public: Still creating... [2m0s elapsed]
module.network.aws_lb.nlb_public: Still creating... [2m10s elapsed]
module.network.aws_lb.nlb_public: Still creating... [2m20s elapsed]
module.network.aws_lb.nlb_public: Still creating... [2m30s elapsed]
module.network.aws_lb.nlb_public: Still creating... [2m40s elapsed]
module.network.aws_lb.nlb_public: Creation complete after 2m42s [id=arn:aws:elasticloadbalancing:ap-south-1:507781131554:loadbalancer/net/terraform-test-nlb-public/a2ab8958adacce21]
data.aws_subnet.subnet-backend-1a: Reading...
data.aws_lb.nlb-public: Reading...
data.aws_vpc.vpc: Reading...
data.aws_subnet.subnet-backend-1a: Read complete after 1s [id=subnet-09cdf20652acae779]
data.aws_lb.nlb-public: Read complete after 1s [id=arn:aws:elasticloadbalancing:ap-south-1:507781131554:loadbalancer/net/terraform-test-nlb-public/a2ab8958adacce21]
data.aws_vpc.vpc: Read complete after 1s [id=vpc-07f82473dd24853d7]
data.aws_security_group.web-servers: Reading...
aws_lb_target_group.web-servers-https: Creating...
aws_lb_target_group.web-servers-http: Creating...
data.aws_security_group.web-servers: Read complete after 0s [id=sg-08edb6407ac0b6f5a]
aws_instance.prod-web-servers[1]: Creating...
aws_instance.prod-web-servers[0]: Creating...
aws_lb_target_group.web-servers-https: Creation complete after 1s [id=arn:aws:elasticloadbalancing:ap-south-1:507781131554:targetgroup/terraform-test-web-servers-https/623e3289268a4b61]
aws_lb_listener.web-service-https: Creating...
aws_lb_target_group.web-servers-http: Creation complete after 1s [id=arn:aws:elasticloadbalancing:ap-south-1:507781131554:targetgroup/terraform-test-web-servers-http/ec449f7f3ce0ba0f]
aws_lb_listener.web-service-http: Creating...
aws_lb_listener.web-service-https: Creation complete after 0s [id=arn:aws:elasticloadbalancing:ap-south-1:507781131554:listener/net/terraform-test-nlb-public/a2ab8958adacce21/3f4119f813b0505f]
aws_lb_listener.web-service-http: Creation complete after 0s [id=arn:aws:elasticloadbalancing:ap-south-1:507781131554:listener/net/terraform-test-nlb-public/a2ab8958adacce21/84fec6e2c1819b17]
aws_instance.prod-web-servers[1]: Still creating... [10s elapsed]
aws_instance.prod-web-servers[0]: Still creating... [10s elapsed]
aws_instance.prod-web-servers[1]: Creation complete after 13s [id=i-0db9460615c2351a0]
aws_instance.prod-web-servers[0]: Creation complete after 13s [id=i-07c334207011ee920]
aws_lb_target_group_attachment.web-servers-attachment-http[1]: Creating...
aws_lb_target_group_attachment.web-servers-attachment-http[0]: Creating...
aws_lb_target_group_attachment.web-servers-attachment-https[0]: Creating...
aws_lb_target_group_attachment.web-servers-attachment-https[1]: Creating...
aws_lb_target_group_attachment.web-servers-attachment-http[1]: Creation complete after 0s [id=arn:aws:elasticloadbalancing:ap-south-1:507781131554:targetgroup/terraform-test-web-servers-http/ec449f7f3ce0ba0f-20210814180103351400000002]
aws_lb_target_group_attachment.web-servers-attachment-https[0]: Creation complete after 0s [id=arn:aws:elasticloadbalancing:ap-south-1:507781131554:targetgroup/terraform-test-web-servers-https/623e3289268a4b61-20210814180103404800000003]
aws_lb_target_group_attachment.web-servers-attachment-http[0]: Creation complete after 1s [id=arn:aws:elasticloadbalancing:ap-south-1:507781131554:targetgroup/terraform-test-web-servers-http/ec449f7f3ce0ba0f-20210814180103664600000004]
aws_lb_target_group_attachment.web-servers-attachment-https[1]: Creation complete after 1s [id=arn:aws:elasticloadbalancing:ap-south-1:507781131554:targetgroup/terraform-test-web-servers-https/623e3289268a4b61-20210814180103789200000005]

Apply complete! Resources: 20 added, 0 changed, 0 destroyed.

 ➜ 

 ```