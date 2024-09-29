# Use a base image with Python
FROM python:3.8-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file first to leverage Docker caching
COPY requirements.txt .

# Install virtualenv package
RUN pip install virtualenv

# Create a virtual environment inside the container
RUN virtualenv venv

# Upgrade pip inside the virtual environment
RUN source venv/bin/activate && pip install --upgrade pip

# Install the necessary dependencies inside the virtual environment
RUN source venv/bin/activate && pip install -r requirements.txt

# Copy all the project files into the container
COPY . .

# Expose port 8000 for the application (assuming your app runs on port 8000)
EXPOSE 8000

# Command to run the application within the virtual environment
CMD ["sh", "-c", "source venv/bin/activate && python app.py"]
