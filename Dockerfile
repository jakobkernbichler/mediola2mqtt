ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install Python 3, pip, and build tools
RUN apk add --no-cache python3 py3-pip build-base

# Install Python packages
RUN pip3 install --no-cache-dir paho-mqtt requests PyYAML

# Copy application files
COPY mediola2mqtt.py /
COPY run.sh /

# Ensure run.sh is executable
RUN chmod a+x /run.sh

# Set the default command
CMD ["/run.sh"]

