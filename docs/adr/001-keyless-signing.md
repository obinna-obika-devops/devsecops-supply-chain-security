# ADR-001: Keyless artifact signing

## Status
Accepted

## Decision
Use Cosign keyless signing with GitHub Actions OIDC for release images instead of storing a long-lived private signing key in the repository or CI secrets.

## Rationale

- Reduces secret-management burden.
- Binds signatures to an ephemeral CI identity.
- Makes the signing workflow auditable.
- Supports verification at the Kubernetes deployment boundary.

## Consequence

The release workflow requires GitHub Actions OIDC and an OCI registry. Local development can build and scan images without signing them.
