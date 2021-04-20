FROM debian:stretch

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt-get -yq install libvpb1 libvpb-dev
RUN apt-get -yq install wget subversion libsystemd-dev build-essential dh-make
COPY debian /opt/debian
COPY build.sh /opt/build.sh
RUN chmod +x /opt/build.sh
CMD /opt/build.sh