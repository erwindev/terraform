variable "region"     {
  description = "AWS region to host your network"
}

/* Ubuntu 14.04 amis by region */
variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    us-west-1 = "ami-049d8641"
    us-east-1 = "ami-a6b8e7ce"
  }
}

variable "private_ip" {
  description = "Private Subnet IP"
}

variable "default_security_group" {
  description = "Default Security Group"
}

variable "key_name" {
  description = "Key Name"
}

variable "web_security_group" {
  description = "Web Security Group"
}

variable "public_ip" {
  description = "Public Subnet IP"
}
