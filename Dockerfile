# Use Ubuntu 20.04 as the base image
FROM jammy:latest

# Create a user named "peter" with the desired password
RUN useradd -m -s /bin/bash peter
RUN echo 'peter:guiltyspark' | chpasswd

# Add "peter" to the sudo group
RUN usermod -aG sudo peter

# Update the package lists and install Python 3
RUN apt-get update && apt-get install -y python3

# Update the package lists and install libpng
RUN apt-get update && apt-get install -y libpng-dev

# (Optional) Set a working directory
WORKDIR /app

# COPY convert.sh /app/
COPY hgt2png /app/

# Your further Dockerfile instructions (if any) go here

# Command to run when the container starts
CMD ["./hgt2png"]