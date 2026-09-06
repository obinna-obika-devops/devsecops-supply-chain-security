# SBOM and provenance

SBOMs answer **what is inside the artifact**. Provenance answers **how and where it was built**. Signatures provide cryptographic evidence that the artifact reference was signed by the expected workflow identity.

## CI evidence chain

```text
source commit
    -> GitHub Actions workflow
    -> dependency resolution
    -> container build
    -> SBOM + provenance
    -> vulnerability gate
    -> OCI digest
    -> Cosign signature
    -> admission verification
```

The repository deliberately avoids committing generated SBOMs from every build because they become stale. CI generates them as build evidence instead.
