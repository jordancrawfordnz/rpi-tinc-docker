[View on Docker Hub](https://hub.docker.com/r/jordancrawford/rpi-tinc/)

[View on GitHub](https://github.com/jordancrawfordnz/rpi-tinc-docker)

---

# tinc for RPi
A Dockerfile for tinc on the Raspberry Pi.

This image was based off [jenserat/tinc](https://hub.docker.com/r/jenserat/tinc/) and the old [vimagick/tinc-arm](https://github.com/vimagick/dockerfiles/blob/4953ba1837b55c7e173e1c95100eff6250b7d1b1/tinc/Dockerfile).

### [Using this container as part of a Raspberry Pi home server without portforwarding](https://jordancrawford.kiwi/home-server-without-portforward/)

## Building
Run ``docker build -t jordancrawford/rpi-tinc .``

## Running
First, follow a tinc tutorial to setup your tinc config. [This DigitalOcean tutorial is a good start.](https://www.digitalocean.com/community/tutorials/how-to-install-tinc-and-set-up-a-basic-vpn-on-ubuntu-14-04).

You need a tinc configuration folder that you can point to ``/etc/tinc`` in the image.

No ``netname`` folder is necessary, the configuration (e.g.: tinc.conf, tinc-up, tinc-down, etc) should all be at the root directory of your configuration.

Run the container like:
``docker run -d --net=host --cap-add NET_ADMIN --device=/dev/net/tun -v [your tinc config path]:/etc/tinc --name tinc jordancrawford/rpi-tinc``

Take note, this requires ``--cap-add NET_ADMIN`` and ``--device=/dev/net/tun`` to work!

If you need a x86 tinc image to talk to, [jenserat/tinc](https://hub.docker.com/r/jenserat/tinc/) is my personal favorite.
