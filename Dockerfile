FROM alpine

RUN apk add --no-cache musl-dev go git \
    && go get -u github.com/b4rti/digota \
    && cp /root/go/bin/digota /bin/digota \
    && apk del musl-dev go git \
    && rm -rf /root/go \
    && rm -rf /var/cache/*

ADD digota.yml /etc/digota/digota.yml

ENTRYPOINT [ "digota", "--addr", "0.0.0.0:8080", "--config", "/etc/digota/digota.yml" ]