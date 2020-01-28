FROM alpine:3.2 as BUILD

MAINTAINER Loïc Mahieu <mahieuloic@gmail.com>

ENV NGINX_VERSION nginx-1.9.12

RUN apk --update add openssl-dev pcre-dev zlib-dev wget build-base && \
    mkdir -p /tmp/src && \
    cd /tmp/src && \
    wget http://nginx.org/download/${NGINX_VERSION}.tar.gz && \
    tar -zxvf ${NGINX_VERSION}.tar.gz && \
    cd /tmp/src/${NGINX_VERSION} && \
    ./configure \
        --with-http_ssl_module \
        --with-http_gzip_static_module \
        --prefix=/etc/nginx \
        --http-log-path=/var/log/nginx/access.log \
        --error-log-path=/var/log/nginx/error.log \
        --sbin-path=/usr/local/sbin/nginx && \
    make && \
    make install && \
    apk del build-base && \
    rm -rf /tmp/src && \
    rm -rf /var/cache/apk/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/log/nginx"]



FROM alpine:3.2 AS APP

COPY --from=BUILD /usr/local/sbin/nginx /usr/local/nginx/sbin/nginx

RUN apk update && apk upgrade && apk add bash curl openssl-dev pcre-dev zlib-dev wget build-base

RUN mkdir /nginx_utils && echo $'#!/bin/bash\n \
	  /usr/local/nginx/sbin/nginx\n \
	  echo **********nginx running....***********\n \
	  tail -f /dev/null' >> /nginx_utils/docker-entrypoint.sh

RUN chmod +x /nginx_utils/docker-entrypoint.sh

RUN addgroup -S nginx_group && adduser -S nginx  -D -G nginx_group

USER nginx

CMD ["/nginx_utils/docker-entrypoint.sh"]
