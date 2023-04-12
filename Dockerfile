# Use the official Python image as a parent image
FROM python:3.8-slim-buster

# Set environment variable
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY poetry.lock pyproject.toml ./

# Install Poetry
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir poetry

# Install project dependencies using Poetry
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Copy the rest of the application code
COPY . .

# Install vim (optional)
RUN apt-get -y update \
    && apt-get -y install vim

# Expose the port the app runs on
EXPOSE 8000

# Define the command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "config.wsgi:application"]