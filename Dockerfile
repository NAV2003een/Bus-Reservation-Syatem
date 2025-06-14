# Use official Python image
FROM python:3.7-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev gcc python3-dev \
    && pip install --upgrade pip

# Copy project files
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Copy the rest of the code
COPY . /code/

# ✅ Create static files directory
RUN mkdir -p /code/static

# Collect static files
# RUN python manage.py collectstatic --noinput

# Run migrations (optional for dev)
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
