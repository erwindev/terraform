provider "aws" {
  access_key  = "${var.access_key}"
  secret_key  = "${var.secret_key}"
  region      = "${var.region}"
}

module "vpc" {
  source = "../../../modules/services/vpc"

  region              = "${var.region}"
  vpc_name            = "erwindev_vpc_dev"
  nat_name            = "erwindev_nat_dev"
  key_name            = "erwindev-deployer-dev"
  web_security_group  = "erwindev_web_sg_dev"
  nat_name            = "erwindev_nat_dev"
  nat_security_name   = "erwindev_nat_sec_dev"
  private_subnet_name = "erwindev_private_dev"
  availability_zone   = "us-east-1a"
}

module "jenkins" {
  source = "../../../modules/services/jenkins"

  region                 = "${var.region}"
  private_ip             = "${module.vpc.private_ip}"
  default_security_group = "${module.vpc.default_security_group}"
  key_name               = "${module.vpc.key_name}"
  public_ip              = "${module.vpc.public_ip}"
  web_security_group     = "${module.vpc.web_security_group}"
}

module "appserver" {
  source = "../../../modules/services/appserver"

  region                 = "${var.region}"
  private_ip             = "${module.vpc.private_ip}"
  default_security_group = "${module.vpc.default_security_group}"
  key_name               = "${module.vpc.key_name}"
  public_ip              = "${module.vpc.public_ip}"
  web_security_group     = "${module.vpc.web_security_group}"
}
