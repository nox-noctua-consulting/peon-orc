# Base image debian bullseye slim
FROM python:3.9-slim-bullseye
# Install python requirements
COPY ./requirements.txt /app/requirements.txt
# Update pip and install required python modules
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip3 install --no-cache-dir --upgrade -r /app/requirements.txt
# Install required tools
RUN apt-get update && apt-get -y install ssh
# TEMP: Install debug tools
RUN apt-get update && apt-get -y install procps iputils-ping dnsutils
# Copy application files into container
COPY ./app /app
# Set docker host IP
ENV DOCKER_HOST ssh://172.20.0.1:22222
# Start the app called api
CMD ["python3", "/app/orchestrator.py"]