FROM alpine:latest
COPY server /bin/server
COPY public /bin/public
EXPOSE 8080
WORKDIR /bin
ENTRYPOINT ["/bin/server"]
