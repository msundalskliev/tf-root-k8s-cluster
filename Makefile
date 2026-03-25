.PHONY: fmt lint validate pre-commit clean

fmt:
	terraform fmt -recursive

lint:
	terraform fmt -check -diff -recursive

validate:
	terraform init -backend=false && terraform validate

pre-commit:
	pre-commit run --all-files

clean:
	rm -rf .terraform
