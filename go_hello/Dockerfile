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

EXPOSE 8888

ENTRYPOINT ["/app/main"]
