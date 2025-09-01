# dependabot-test

pip-compile requirements.in --output-file=requirements.txt

pip-compile pyproject.toml --output-file=requirements.txt

pip-compile pyproject.toml --extra=dev --output-file=requirements-dev.txt
