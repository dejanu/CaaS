# Stage 1: Build the Go application
FROM golang:1.16-alpine AS build

LABEL org.opencontainers.image.authors="dejanualex@gmail.com"
WORKDIR /app
COPY . /app
RUN go build -o main .

# Stage 2: Create a minimal runtime image
FROM alpine:3.14

WORKDIR /app
COPY --from=build /app/main /app/main

EXPOSE 8080
CMD ["/app/main"]