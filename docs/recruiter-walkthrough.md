# Recruiter / Interview Walkthrough

This page highlights the security engineering evidence in this repository.

## 5-minute review path

1. Read `README.md` for the end-to-end secure delivery flow.
2. Inspect `.github/` for CI security gates and release automation.
3. Inspect policy files for admission and policy-as-code controls.
4. Inspect container/IaC scanning configuration for layered security checks.
5. Inspect SBOM, signing and provenance patterns for supply-chain integrity.
6. Review runbooks or remediation guidance for operational response.

## What this project proves

This project demonstrates DevSecOps as an engineering system, not a collection of scanners. Security controls are placed at multiple points from source to runtime so that risk is detected early and deployment boundaries can enforce evidence.

Key themes:

- secret and dependency scanning
- infrastructure-as-code scanning
- container vulnerability scanning
- SBOM and provenance generation
- keyless signing with short-lived identity patterns
- digest-based verification
- Kubernetes admission policy
- OPA/Conftest-style policy as code
- severity-based remediation expectations

## Interview discussion points

### Why defense in depth?
No individual scanner or policy catches every failure mode. Layering source, build, artifact and runtime controls limits the chance that one missed issue becomes an unrestricted production deployment.

### Why keyless signing?
Short-lived workload identity reduces reliance on long-lived signing credentials. The important property is still verifiable provenance and an enforceable trust policy at deployment time.

### Why verify by digest?
Tags can be mutable. A digest identifies the exact artifact that was scanned, signed and approved, reducing ambiguity between build and deployment.

### What would productionization add?
A production system would integrate an approved OCI registry, organization identity, centralized vulnerability management, exception workflows, admission enforcement, SIEM/audit pipelines and formal ownership/remediation SLAs.

## Validation

```bash
make test
make security
make build
```

Use CI as the authoritative automated path when the required security tools are not installed locally.

## Scope and integrity

This is a portfolio/reference implementation. It demonstrates practical software supply-chain security patterns without claiming a live production registry or enterprise security program that is not explicitly evidenced here.
