FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git

WORKDIR $GOPATH/src/package/http-go-server/
COPY . .

RUN go build -o /go/bin/http-go-server internal/main.go

############################

FROM scratch

COPY --from=builder /go/bin/http-go-server /bin/http-go-server

ENTRYPOINT ["/bin/http-go-server"]
