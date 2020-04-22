FROM golang:1.13 AS builder

RUN apt update && apt install git

WORKDIR $GOPATH/src/http-go-server/
COPY . .

RUN go build -o /bin/http-go-server internal/main.go

############################

FROM scratch

COPY --from=builder /bin/http-go-server /bin/http-go-server

ENTRYPOINT ["/bin/http-go-server"]
