FROM golang:1.21.11-alpine as builder

WORKDIR /app/hello-api
COPY . /app/hello-api

WORKDIR /app/hello-api

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o ./build/hello-api .

FROM alpine:latest as runner

RUN apk update && apk add --no-cache tzdata

WORKDIR /hello-api

COPY --from=builder /app/hello-api/build/hello-api /usr/bin/hello-api

EXPOSE 8080

CMD [ "hello-api"]
