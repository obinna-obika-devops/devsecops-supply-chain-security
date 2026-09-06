.PHONY: test security build

test:
	python -m pytest -q

security:
	python scripts/security_gate.py

build:
	docker build -t secure-demo:local app
