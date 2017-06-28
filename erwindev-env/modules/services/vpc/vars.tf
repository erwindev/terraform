variable "region"     {
  description = "AWS region to host your network"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.128.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "10.128.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "10.128.1.0/24"
}

/* Ubuntu 14.04 amis by region */
variable "amis-1404" {
  description = "Base AMI to launch the instances with"
  default = {
    us-west-1 = "ami-049d8641"
    us-east-1 = "ami-a6b8e7ce"
  }
}

/* Ubuntu 16.04 amis by region */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-west-1 = "ami-73f7da13"
    us-east-1 = "ami-d15a75c7"
  }
}

variable "vpc_name" {
  description = "VPC name"
}

variable "nat_security_name" {
  description = "NAT security name"
}

variable "key_name" {
  description = "Key name"
}

variable "web_security_group" {
  description = "Web security group"
}

variable "nat_name" {
  description = "NAT name"
}

variable "private_subnet_name" {
  description = "Private subnet name"
}

variable "availability_zone" {
  description = "Availability zone"
}
