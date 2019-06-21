FROM golang:alpine as builder

WORKDIR /go

ENV GOOS=linux
ENV CGO_ENABLED=0
ENV appdir=/go

COPY hello.go /go

RUN go build -a hello.go

FROM scratch
COPY --from=builder /go/hello .
CMD ["./hello"]