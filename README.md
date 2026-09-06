# DevSecOps Supply Chain Security Platform

A practical secure software delivery platform demonstrating defense-in-depth controls across source, dependencies, infrastructure, containers, Kubernetes, artifacts, and releases.

## What this demonstrates

- Secure CI with tests, dependency review, secret scanning, SAST-style checks, IaC scanning, and container scanning
- SBOM generation with Syft and vulnerability analysis with Trivy/Grype
- Keyless container signing and verification with Cosign using GitHub OIDC
- Kubernetes admission control with Kyverno
- Terraform security controls with Checkov
- OPA/Conftest policy-as-code
- Release provenance and immutable image references
- Threat modeling and incident response for compromised dependencies/images
- Security remediation SLAs and auditable release gates

## Architecture

```text
Developer -> GitHub -> CI security gates -> Build image -> SBOM
                              |                    |
                              v                    v
                     Tests / secrets / IaC   Vulnerability gate
                                                   |
                                                   v
                                          Sign + attest artifact
                                                   |
                                                   v
                                          Registry / release
                                                   |
                                                   v
                                      Kubernetes admission
                                      (Kyverno policies)
                                                   |
                                                   v
                                               Runtime
```

## Security gates

| Layer | Control |
|---|---|
| Source | secret scanning, dependency review, protected workflow permissions |
| Code | unit tests and basic static checks |
| IaC | Checkov |
| Container | Trivy / Grype |
| Supply chain | SBOM, provenance, Cosign signing |
| Kubernetes | Kyverno admission policies, NetworkPolicy |
| Policy | OPA/Conftest |
| Operations | vulnerability SLA and incident runbooks |

## Run locally

```bash
make test
make security
make build
```

The local security target intentionally runs tools only when installed; CI uses pinned action/tool versions where practical.

## Keyless signing

The release workflow contains a real-world GitHub OIDC/Cosign pattern. It is designed to run in GitHub Actions with an OCI registry and does not store long-lived signing keys in the repository. Verification uses the image digest rather than a mutable tag.

## Scope

This is a portfolio/reference implementation. It does not claim that production infrastructure or a live registry is currently deployed. Secrets and credentials are never committed.

## Engineering principles

1. Fail closed on high-confidence security gates.
2. Prefer short-lived identity over static credentials.
3. Generate evidence (SBOM, provenance, signatures) as part of delivery.
4. Verify artifacts at deployment boundaries.
5. Treat policy as versioned code and test it.
6. Make remediation measurable with severity-based SLAs.

## Recruiter signal

This repository is intentionally different from a generic CI/CD demo: it shows how a platform engineer can secure the complete software supply chain while preserving developer self-service.
