# Supply-chain threat model

## Assets

- Source code and Git history
- CI runner identity
- Dependencies and package metadata
- Container image and registry
- SBOM and provenance attestations
- Kubernetes deployment manifests
- Production workload identity

## Threats

| Threat | Example | Primary control |
|---|---|---|
| Secret theft | leaked cloud token | Gitleaks + OIDC |
| Dependency confusion | malicious package with trusted name | lockfiles, dependency audit, review |
| Compromised dependency | vulnerable upstream library | pip-audit + Trivy + SLA |
| Image tampering | altered registry image | digest pinning + Cosign |
| CI compromise | workflow abuse | least-privilege permissions |
| Manifest injection | unsafe deployment change | Conftest + Kyverno |
| Build impersonation | forged artifact | provenance + OIDC signing |

## Trust boundaries

1. Developer workstation -> GitHub repository
2. GitHub repository -> hosted CI runner
3. CI runner -> package registries
4. CI runner -> OCI registry
5. OCI registry -> Kubernetes admission
6. Admission -> runtime

## Security objective

A deployable artifact must be traceable to reviewed source, have machine-readable dependency evidence, pass vulnerability policy, and be verifiable at the deployment boundary.
