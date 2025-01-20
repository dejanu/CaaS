
# Stage 1: Build the Go application
FROM golang:1.21 AS build

LABEL org.opencontainers.image.authors="dejanualex@gmail.com"
WORKDIR /app

COPY main.go /app
# don't copy mod files to avoid cache invalidation
RUN go mod init github.com/dejanualex/go_hello && go mod tidy
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Stage 2: Create a minimal runtime image
FROM alpine:3.14

# Install necessary dependencies for Build
RUN apk add --no-cache ca-certificates

WORKDIR /app
COPY --from=build /app/main /app/main
# copy static dir
COPY static /app/static

# Optional:
# To bind to a TCP port, runtime parameters must be supplied to the docker command.
# But we can document in the Dockerfile what ports
# the application is going to listen on by default.
# https://docs.docker.com/reference/dockerfile/#expose
EXPOSE 8888

ENTRYPOINT ["/app/main"]
