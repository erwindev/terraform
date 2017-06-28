output "app-server.0.ip" {
  value = "${aws_instance.app-server.0.private_ip}"
}
