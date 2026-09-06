package main

deny contains msg if {
  input.kind == "Deployment"
  some c in input.spec.template.spec.containers
  c.securityContext.privileged == true
  msg := "privileged containers are forbidden"
}

deny contains msg if {
  input.kind == "Deployment"
  some c in input.spec.template.spec.containers
  endswith(c.image, ":latest")
  msg := "latest image tags are forbidden"
}

deny contains msg if {
  input.kind == "Deployment"
  not input.spec.template.spec.securityContext.runAsNonRoot
  msg := "workloads must explicitly require non-root execution"
}
