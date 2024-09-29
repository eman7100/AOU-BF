# Use a base image with Python
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all the project files into the container
COPY . .

# Install the necessary dependencies
RUN pip install -r requirements.txt

# Expose port 8000 for the application (assuming your app runs on port 8000)
EXPOSE 8000

# Command to run the application
CMD ["python", "app.py"]
