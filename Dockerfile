# Use a pinned Python base image (Dependabot will watch this)
FROM python:3.13-slim

# Set working dir
WORKDIR /app

# Install pip & setuptools in a controlled way
RUN pip install --no-cache-dir --upgrade pip==24.0 setuptools==70.0

# Copy dependency definitions
COPY requirements.txt requirements-dev.txt ./

# Install app dependencies
RUN pip install --no-cache-dir -r requirements.txt -r requirements-dev.txt

# Copy app code
COPY . .

# Run the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
