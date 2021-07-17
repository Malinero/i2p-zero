FROM debian:buster as builder

RUN apt-get update && apt-get -y install git wget zip unzip
WORKDIR /src
COPY . .
ARG TARGETS="linux"
RUN bash bin/build-all-and-zip.sh

FROM debian:buster

COPY --from=builder /src/dist/linux/router /opt/router
RUN useradd -ms /bin/bash i2p
USER i2p
ENV PATH /opt/router/bin:${PATH}
VOLUME /home/i2p/.i2p-zero
EXPOSE 12345
CMD i2p-zero --i2np.ntcp.port=12345 --i2np.udp.port=12345 --i2np.udp.internalPort=12345
