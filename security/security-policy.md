# Security policy

## Release gates

- CRITICAL vulnerabilities: block release when a fix exists.
- HIGH vulnerabilities: block release for runtime dependencies/images when a fix exists.
- Secrets: always block.
- IaC high-risk findings: block unless explicitly reviewed and documented.
- Kubernetes workloads: must be non-root, drop capabilities, and avoid privileged mode.
- Images: pin by digest for deployment.
- Release artifacts: sign with short-lived OIDC identity.

## Exceptions

Every exception must identify the finding, owner, business justification, expiration date, and compensating control. Permanent exceptions are prohibited.

## Identity

Prefer GitHub OIDC and cloud workload identity over long-lived access keys. CI tokens receive only the permissions required by each job.
