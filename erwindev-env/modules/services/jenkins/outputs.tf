output "jenkins-master.0.ip" {
  value = "${aws_instance.jenkins-master.0.private_ip}"
}
