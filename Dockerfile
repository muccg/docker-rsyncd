FROM alpine:3.4
MAINTAINER https://github.com/muccg/

RUN env | sort

RUN apk add --no-cache \
    bash \
    rsync

RUN addgroup -g 1000 ccg-user \
    && adduser -D -h /data -H -S -u 1000 -G ccg-user ccg-user \
    && mkdir /data \
    && chown ccg-user:ccg-user /data

EXPOSE 873

COPY rootfs/ /

# don't drop privs, rsyncd will after binding to privileged port
ENV HOME /data
WORKDIR /data

# entrypoint shell script that by default starts uwsgi
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["rsyncd"]
