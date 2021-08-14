variable "vpc_cidr_block" {
  description = "IPv4 CIDR Address Block for the VPC"
  type        = string
}

variable "vpc_enable_ipv6" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block."
  type        = bool
  default     = false
}

variable "config" {}

variable "subnet_public_1a_cidr" {
  description = "IPv4 CIDR Address Block for subnet-public-1a"
  type        = string
  default     = ""
}

variable "subnet_backend_1a_cidr" {
  description = "IPv4 CIDR Address Block for subnet-backend-1a"
  type        = string
  default     = ""
}

variable "cidr_allow_private" {
  description = "CIDR ranges from which internal traffic is allowed. This should be a private range."
  type        = list(string)
  default     = ["10.0.0.0/8"]
}