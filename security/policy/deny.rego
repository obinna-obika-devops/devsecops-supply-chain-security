package main

deny contains msg if {
  input.kind == "Deployment"
  some c
  c := input.spec.template.spec.containers[_]
  c.securityContext.privileged == true
  msg := "privileged containers are forbidden"
}

deny contains msg if {
  input.kind == "Deployment"
  some c
  c := input.spec.template.spec.containers[_]
  endswith(c.image, ":latest")
  msg := "latest image tags are forbidden"
}

deny contains msg if {
  input.kind == "Deployment"
  not input.spec.template.spec.securityContext.runAsNonRoot
  msg := "workloads must explicitly require non-root execution"
}
