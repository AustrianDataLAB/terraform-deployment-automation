# Use an official Python runtime as a parent image
FROM python:3.12-alpine

# Update necessary packages
RUN apk update && \
    apk upgrade expat && \
    rm -rf /var/cache/apk/*

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . /usr/src/app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run unittests
RUN python -m unittest test_app.py

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Comment out one of these CMD based on your preference
# CMD ["flask", "run"]
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]

# Download the installer script:
RUN wget https://get.opentofu.org/install-opentofu.sh -O install-opentofu.sh

# Give it execution permissions:
RUN chmod +x install-opentofu.sh

# Please inspect the downloaded script

# Run the installer:
RUN ./install-opentofu.sh --install-method apk

# Remove the installer:
RUN rm install-opentofu.sh
