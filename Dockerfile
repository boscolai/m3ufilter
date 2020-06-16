FROM golang:1.14 as builder

ARG ARCH=amd64

WORKDIR /go/src/github.com/hoshsadiq/m3ufilter

COPY . .

WORKDIR /go/src/github.com/hoshsadiq/m3ufilter/cmd/m3u-filter

RUN go build -o ../../build/m3u-filter_linux_${ARCH}



FROM scratch

ADD ci/assets/passwd.nobody /etc/passwd

USER nobody

ENTRYPOINT ["/m3u-filter"]

ARG ARCH=amd64

COPY --from=builder /go/src/github.com/hoshsadiq/m3ufilter/build/m3u-filter_linux_${ARCH} /m3u-filter
