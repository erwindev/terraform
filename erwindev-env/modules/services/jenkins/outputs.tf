output "app.0.ip" {
  value = "${aws_instance.app.0.private_ip}"
}
