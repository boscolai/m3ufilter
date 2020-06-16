FROM golang:1.14-alpine as builder

WORKDIR /go/src/github.com/hoshsadiq/m3ufilter

COPY . .

WORKDIR /go/src/github.com/hoshsadiq/m3ufilter/cmd/m3u-filter

RUN go build -o /go/bin/m3u-filter



FROM alpine

ADD ci/assets/passwd.nobody /etc/passwd

USER nobody

ENTRYPOINT ["/usr/local/bin/m3u-filter"]

COPY --from=builder /go/bin/m3u-filter /usr/local/bin/m3u-filter
