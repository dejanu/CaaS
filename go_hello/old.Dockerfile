# set go runtime version
FROM golang:1.16-alpine
LABEL org.opencontainers.image.authors="dejanualex@gmail.com"
WORKDIR /app
COPY . /app
RUN go build -o main .
EXPOSE 8080
CMD ["/app/main"]
