/* Jenkins servers */
resource "aws_ebs_volume" "ebs-volume-jenkins" {
  availability_zone = "us-east-1a"
  size = 500
  type = "st1"
  tags {
      Name = "Jenkins EBS volume"
  }
}

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

resource "aws_volume_attachment" "ebs-jenkins-attachment" {
  device_name = "/dev/sdf"
  volume_id = "${aws_ebs_volume.ebs-volume-jenkins.id}"
  instance_id = "${aws_instance.jenkins-master.id}"
}
