output "jenkins-master.0.ip" {
  value = "${module.jenkins.jenkins-master.0.ip}"
}

output "app-server.0.ip" {
  value = "${module.appserver.app-server.0.ip}"
}

output "nat.ip" {
  value = "${module.vpc.nat.ip}"
}
