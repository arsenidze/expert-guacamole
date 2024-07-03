FROM golang:1.22.5-alpine as builder
WORKDIR /src
COPY src go.mod ./
RUN CGO_ENABLED=0 go build -o app

FROM scratch
ADD ./static /static
COPY --from=builder /src/app .

ENTRYPOINT [ "/app" ]
EXPOSE 8080
