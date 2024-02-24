# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Install yt-dlp
RUN pip install --no-cache-dir yt-dlp

# Copy the script into the container
COPY download_stream.sh .

# Make the script executable
RUN chmod +x download_stream.sh

# Command to run the script
CMD ["./download_stream.sh"]
