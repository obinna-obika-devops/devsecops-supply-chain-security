#!/usr/bin/env python3
import subprocess
import sys

checks = [
    ["python", "-m", "pytest", "-q"],
    ["trivy", "fs", "--exit-code", "1", "--severity", "HIGH,CRITICAL", "."],
]

for command in checks:
    print("+", " ".join(command))
    result = subprocess.run(command)
    if result.returncode != 0:
        print("Security gate failed:", command[0])
        sys.exit(result.returncode)
print("Security gates passed")
