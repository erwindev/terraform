output "app.0.ip" {
  value = "${aws_instance.app.0.private_ip}"
}

output "elb.hostname" {
  value = "${aws_elb.app.dns_name}"
}
