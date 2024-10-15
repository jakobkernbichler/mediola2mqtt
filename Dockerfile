FROM python:3.9-slim

ENV LANG C.UTF-8

# Install necessary packages
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --no-cache-dir paho-mqtt requests PyYAML

# Copy application files
COPY mediola2mqtt.py /
COPY run.sh /

# Ensure run.sh is executable
RUN chmod a+x /run.sh

# Set the default command
CMD ["/run.sh"]


