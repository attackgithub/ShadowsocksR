FROM debian:stretch

WORKDIR /shadowsocksr

COPY shadowsocks-libev . 
RUN apt update && apt install zlib1g-dev build-essential autoconf libtool libssl-dev \
    gawk libpcre++-dev -y
RUN ./autogen.sh && ./configure --disable-documentation && make && make install

ENTRYPOINT [ "ss-server" , "-c","/etc/shadowsocksr.json" ]
