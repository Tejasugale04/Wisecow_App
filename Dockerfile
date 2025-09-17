FROM alpine:3.16

# Enable community and edge/testing repositories
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.16/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Update package index and install required packages
RUN apk update && \
    apk add --no-cache bash fortune cowsay netcat-openbsd

WORKDIR /app
COPY wisecow.sh .
RUN chmod +x wisecow.sh

EXPOSE 4499
ENTRYPOINT ["/app/wisecow.sh"]
