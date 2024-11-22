# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set environment variables to ensure Python outputs everything to the console
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy only the requirements.txt file to the container
COPY requirements.txt /app

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code to the container
COPY . /app

# Expose the port that the app will run on
EXPOSE 8050

# Run the app with gunicorn (instead of the default Flask server)
CMD ["gunicorn", "app:server", "-b", "0.0.0.0:8050"]

