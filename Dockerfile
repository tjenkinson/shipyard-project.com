FROM google/golang-runtime
MAINTAINER Evan Hazlett "<ejhazlett@gmail.com>"
WORKDIR /gopath/src/app
ADD . /gopath/src/app
RUN go get app
RUN curl -s -L -o /tmp/hugo.tar.gz https://github.com/spf13/hugo/releases/download/v0.11/hugo_0.11_linux_amd64.tar.gz && \
    tar xzf /tmp/hugo.tar.gz --strip-components=1 -C /bin
RUN (ln -s /bin/hugo_0.11_linux_amd64 /bin/hugo)
RUN (cd /gopath/src/app/site && hugo -v)
CMD []
ENTRYPOINT ["/gopath/bin/app"]

