# syntax=docker/dockerfile:1.4

FROM cgr.dev/chainguard/wolfi-base as build
LABEL maintainer="Will Norris <will@willnorris.com>"

RUN apk update && apk add build-base git openssh go-1.21

WORKDIR /app

# Copy go mod files first for better caching
COPY go.mod go.sum ./
RUN go mod download

# Copy source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 go build -v ./cmd/imageproxy

# Final stage - minimal runtime image
FROM cgr.dev/chainguard/static:latest

# Copy binary from build stage
COPY --from=build /app/imageproxy /app/imageproxy

EXPOSE 8080

ENTRYPOINT ["/app/imageproxy"]
CMD ["-addr", "0.0.0.0:8080", "-cacheDir", "/cache"]