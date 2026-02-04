FROM debian:trixie-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    xvfb \
    x11vnc \
    icewm \
    xterm \
    xrdp \
    fonts-dejavu

COPY daemon.sh entry.sh /
RUN chmod +x /daemon.sh /entry.sh

COPY xrdp.ini /etc/xrdp/xrdp.ini

ENV DISPLAY=:0

EXPOSE 3389

ENTRYPOINT ["/entry.sh"]
