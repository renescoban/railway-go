# Build stage
FROM golang:1.21-alpine AS builder

WORKDIR /app

# Copy go mod files
COPY go.mod go.sum ./

# Download dependencies (with timeout handling)
RUN apk add --no-cache git ca-certificates && \
    go mod download

# Copy source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -a -installsuffix cgo -o main .

# Runtime stage with minimal image
FROM alpine:3.18

# Install ca-certificates only (minimal setup)
RUN apk add --no-cache ca-certificates

WORKDIR /app

# Copy the binary from builder stage
COPY --from=builder /app/main .

# Make sure the binary is executable
RUN chmod +x main

# Expose port
EXPOSE 8080

# Command to run
CMD ["./main"]
