FROM python:3.11-alpine

WORKDIR /app

# Install system dependencies
RUN apk add --no-cache \
    gcc \
    musl-dev \
    postgresql-dev \
    chromium \
    chromium-chromedriver

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Create directories for services
RUN mkdir -p /app/scraper /app/processor

# Set environment variables
ENV PYTHONPATH=/app
ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROMEDRIVER_PATH=/usr/bin/chromedriver

# Default command (can be overridden)
CMD ["python", "scraper/main.py"] 