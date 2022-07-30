FROM golang:alpine AS builder


WORKDIR /opt
COPY hello.go /opt

RUN go build hello.go


FROM scratch

COPY --from=builder /opt/hello /opt/hello
#CMD ["go", "build", "hello.go"]
ENTRYPOINT [ "/opt/hello" ]