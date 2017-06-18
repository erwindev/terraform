/* App servers */
resource "aws_instance" "jenkins-master" {
  count = 1
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${var.private_ip}"
  vpc_security_group_ids = ["${var.default_security_group}"]
  key_name = "${var.key_name}"
  source_dest_check = false
  user_data = "${file("../../cloud-config/jenkins.yml")}"
  tags = {
    Name = "jenkins-${count.index}"
  }
}

resource "aws_instance" "jenkin-slave" {
  count = 1
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${var.private_ip}"
  vpc_security_group_ids = ["${var.default_security_group}"]
  key_name = "${var.key_name}"
  source_dest_check = false
  user_data = "${file("../../cloud-config/jenkins-slave.yml")}"
  tags = {
    Name = "jenkins-slave-${count.index}"
  }
}

/* Load balancer */
/*
resource "aws_elb" "app" {
  name = "jenkins-elb"
  subnets = ["${var.public_ip}"]
  vpc_security_group_ids = ["${var.default_security_group}", "${var.web_security_group}"]
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  instances = ["${aws_instance.app.*.id}"]
}
*/
