# Supply-chain controls

### Source
- Branch protection and review for release paths
- Minimal GitHub Actions permissions
- Secret scanning

### Build
- Reproducible Docker build context
- Dependency audit
- SBOM generated for the build
- Container vulnerability scan

### Artifact
- OCI image referenced by immutable digest
- Keyless Cosign signature
- GitHub OIDC identity binds the artifact to its workflow
- Build provenance is enabled in the release action

### Deploy
- Kyverno rejects unsafe image references
- Pod Security Standards labels use `restricted`
- Network policy starts from default deny
- Runtime containers drop Linux capabilities and cannot escalate privileges

### Evidence

The CI system produces test results, security findings, SBOMs, and signed artifacts as evidence of the release decision.
