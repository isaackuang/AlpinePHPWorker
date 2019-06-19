FROM isaackuang/swoole

RUN apk add --update curl ca-certificates && \
    curl https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub -o /etc/apk/keys/php-alpine.rsa.pub && \
    echo "@php https://dl.bintray.com/php-alpine/v3.8/php-7.2" >> /etc/apk/repositories && \
    apk --no-cache --progress add \
    php7@php php7-cli@php php7-curl@php php7-openssl@php php7-posix@php php7-pcntl@php \
    php7-json@php php7-iconv@php php7-mbstring@php php7-tokenizer@php \
    php7-ctype@php php7-dom@php php7-yaml@php && \
    rm /var/cache/apk/*

WORKDIR /var/www/html

COPY config /
