output "private_ip" {
  value = "${aws_subnet.private.id}"
}

output "default_security_group" {
  value = "${aws_security_group.default.id}"
}

output "key_name" {
  value = "${aws_key_pair.deployer.key_name}"
}

output "web_security_group" {
  value = "${aws_security_group.web.id}"
}

output "public_ip" {
  value = "${aws_subnet.public.id}"
}

output "nat.ip" {
  value = "${aws_instance.nat.public_ip}"
}
