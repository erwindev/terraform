/* App servers */
resource "aws_ebs_volume" "ebs-volume-appserver" {
  availability_zone = "us-east-1a"
  size = 500
  type = "st1"
  tags {
      Name = "App Server EBS volume"
  }
}

resource "aws_instance" "app-server" {
  count = 1
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${var.private_ip}"
  vpc_security_group_ids = ["${var.default_security_group}"]
  key_name = "${var.key_name}"
  source_dest_check = false
  user_data = "${file("../../cloud-config/app-server.yml")}"
  tags = {
    Name = "appserver-${count.index}"
  }
}

resource "aws_volume_attachment" "ebs-appserver-attachment" {
  device_name = "/dev/sdf"
  volume_id = "${aws_ebs_volume.ebs-volume-appserver.id}"
  instance_id = "${aws_instance.app-server.id}"
}

/* Load balancer */
/*
resource "aws_elb" "appserver" {
  name = "appserver-elb"
  subnets = ["${var.public_ip}"]
  vpc_security_group_ids = ["${var.default_security_group}", "${var.web_security_group}"]
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  instances = ["${aws_instance.appserver.*.id}"]
}
*/
