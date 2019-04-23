FROM debian

WORKDIR /shadowsocksr

COPY shadowsocks-libev . 
COPY config.json /etc/shadowsocksr.json
RUN apt update && apt install zlib1g-dev build-essential autoconf libtool libssl-dev \
    gawk debhelper dh-systemd init-system-helpers pkg-config asciidoc xmlto -y
RUN ./autogen.sh && ./configure && make && make install

ENTRYPOINT [ "ss-server" , "-c /etc/shadowsocks.json" ]