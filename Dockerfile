# Based off https://hub.docker.com/r/jenserat/tinc/~/dockerfile/ and https://github.com/vimagick/dockerfiles/blob/4953ba1837b55c7e173e1c95100eff6250b7d1b1/tinc/Dockerfile

FROM hypriot/rpi-alpine-scratch

RUN set -xe && apk add -U tinc && rm -rf /var/cache/apk/*

EXPOSE 655/tcp 655/udp
VOLUME /etc/tinc

ENTRYPOINT ["tincd"]
CMD ["--no-detach"]
