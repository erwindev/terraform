output "app.0.ip" {
  value = "${module.jenkins.app.0.ip}"
}

output "nat.ip" {
  value = "${module.vpc.nat.ip}"
}
