# Incident runbook: compromised dependency or image

## 1. Contain

- Stop promotion of the affected release.
- Revoke or quarantine the affected artifact where appropriate.
- Freeze automated deployment if compromise is suspected.

## 2. Identify

- Record package/image name, version, digest, CVE/advisory, and first known affected build.
- Compare SBOMs and provenance between known-good and affected releases.
- Determine whether the malicious artifact reached a runtime environment.

## 3. Eradicate

- Upgrade or replace the dependency.
- Rebuild from a clean source revision.
- Generate a fresh SBOM.
- Scan and sign the rebuilt image.

## 4. Recover

- Deploy only the verified digest.
- Rotate affected credentials if there is evidence of exposure.
- Monitor error rates, suspicious outbound traffic, and workload identity activity.

## 5. Learn

- Publish a blameless postmortem.
- Add a regression test/policy.
- Review whether the detection gate or trust boundary needs strengthening.
