# Use a specific Python version image
FROM python:3.11.4

ENV PYTHONUNBUFFERED True

# Expose port 8080
EXPOSE 8080

# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt ./

RUN pip install --upgrade pip

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code
COPY . .

# Run your main script
CMD ["gunicorn","--bind","0.0.0.0:8080","--workers","2","--threads","8","--timeout","0","app:create_app()" ]