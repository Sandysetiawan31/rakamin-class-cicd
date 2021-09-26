FROM golang:alpine AS builder
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN go build -v -o main .

FROM alpine:latest
RUN mkdir /app
WORKDIR /app
COPY --from=builder /app/main /app/
CMD ["/app/main"]