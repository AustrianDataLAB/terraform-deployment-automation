# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /usr/src

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install Terraform
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget unzip && \
    wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_amd64.zip && \
    unzip terraform_1.1.7_linux_amd64.zip -d /usr/local/bin && \
    rm -f terraform_1.1.7_linux_amd64.zip && \
    apt-get purge -y --auto-remove wget unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Define environment variable
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run app.py when the container launches
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]


