FROM alpine:latest

RUN apk --no-cache --update add xvfb x11vnc openbox font-terminus xterm supervisor sudo; \
    addgroup alpine; \
    adduser  -G alpine -s /bin/sh -D alpine; \
    echo "alpine:alpine" | /usr/sbin/chpasswd; \
    echo "alpine    ALL=(ALL) ALL" >> /etc/sudoers; \

USER alpine

ADD etc /etc
WORKDIR /home/alpine
EXPOSE 5900
USER alpine
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]
