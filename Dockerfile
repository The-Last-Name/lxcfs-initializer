FROM golang:1.10 AS build
COPY main.go build.sh /go/src/github.com/denverdino/lxcfs-initializer/
COPY vendor /go/src/github.com/denverdino/lxcfs-initializer/vendor
RUN cd /go/src/github.com/denverdino/lxcfs-initializer/ && ./build.sh

FROM scratch
COPY --from=build /go/src/github.com/denverdino/lxcfs-initializer/lxcfs-initializer /lxcfs-initializer
ENTRYPOINT ["/lxcfs-initializer"]
