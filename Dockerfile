FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
	libxcb1-dev \
	libxcb-keysyms1-dev \
	libpango1.0-dev \
	libxcb-util0-dev \
	libxcb-icccm4-dev \
	libyajl-dev \
	libstartup-notification0-dev \
	libxcb-randr0-dev \
	libev-dev \
	libxcb-cursor-dev \
	libxcb-xinerama0-dev \
	libxcb-xkb-dev \
	libxkbcommon-dev \
	libxkbcommon-x11-dev \
	autoconf \
	libxcb-xrm0 \
	libxcb-xrm-dev \
	automake \
  devscripts dpkg-dev \
  dh-autoreconf \
  git

RUN apt-get build-dep -y i3-wm

RUN git clone -b gaps https://www.github.com/Airblader/i3  /opt/i3

WORKDIR /opt/i3

ARG DEBEMAIL

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
