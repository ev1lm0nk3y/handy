FROM golang:1.13-alpine3.10

COPY * /go/src/hithere/
WORKDIR /go/src/hithere

EXPOSE 8080
ENTRYPOINT ["go", "run", "main.go"]
