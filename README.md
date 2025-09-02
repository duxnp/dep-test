# dependabot-test

pip-compile requirements.in --output-file=requirements.txt
pip-compile requirements-dev.in --output-file=requirements-dev.txt

pip-compile pyproject.toml --output-file=requirements.txt
pip-compile pyproject.toml --extra=dev --output-file=requirements-dev.txt

## 📦 Dependency Management

This project uses **[pip-tools](https://github.com/jazzband/pip-tools)** and **[Dependabot](https://docs.github.com/en/code-security/dependabot)** to keep dependencies up to date and consistent across environments.

### How it works

1. **requirements.in files**

   - We declare our top-level dependencies in `requirements.in` (for production) and `requirements-dev.in` (for development).
   - These files are **human-maintained** and list only the direct packages we care about.

   Example (`requirements.in`):

   ```txt
   fastapi[standard]==0.115.0
   sqlalchemy==2.0.41
   ```

2. pip-tools compiles pinned requirements

We run pip-compile to generate requirements.txt and requirements-dev.txt.

These contain fully pinned versions (including transitive dependencies) to guarantee reproducible installs.

Example (requirements.txt):

3. Installing dependencies
   Use pip-sync to install exactly what’s in the compiled files:

4. Dependabot automation

Dependabot runs weekly and checks for new releases of our dependencies.

It creates pull requests to update the .in files, and recompiles with pip-compile.
