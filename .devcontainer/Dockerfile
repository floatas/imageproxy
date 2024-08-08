# Use the DevContainers base image as a parent image
FROM mcr.microsoft.com/devcontainers/base:ubuntu

RUN apt-get update && apt-get install -y wget tar gcc build-essential

# Install Go 1.21
RUN apt-get update && apt-get install -y wget \
    && wget https://go.dev/dl/go1.21.12.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.21.12.linux-amd64.tar.gz \
    && rm go1.21.12.linux-amd64.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"

# Set the Current Working Directory inside the container
WORKDIR /workspace

# Copy the contents of the project into the working directory
COPY . /workspace

# Set up Go environment variables
ENV PATH=/usr/local/go/bin:$PATH
ENV GOPATH=/workspace/go
ENV GOBIN=/workspace/go/bin

# Expose necessary ports (e.g., if your Go app runs on port 8080)
# EXPOSE 8080

# Command to run the application
# CMD ["go", "run", "main.go"]

# GOOS=linux GOARCH=arm64 go build -v ./cmd/imageproxy
# http://localhost:8080/x300/https://media.powersport.eu/4822619/apsauga-krepsinio-stovui-insportline-standy.jpg