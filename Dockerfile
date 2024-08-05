FROM golang:1.22.5 AS builder

ENV CGO_ENABLED=0 \
    GOOS=linux

WORKDIR /go/src/speedtest_exporter

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o ./speedtest_exporter ./cmd/speedtest_exporter/main.go

FROM debian:12.1-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates

COPY --from=builder /go/src/speedtest_exporter/speedtest_exporter .

ENTRYPOINT ["./speedtest_exporter"]
