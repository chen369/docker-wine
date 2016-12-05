FROM ubuntu
MAINTAINER Chen Lee Chiu  <chen@blitzcorp.org>
# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8



RUN dpkg --add-architecture i386

RUN apt-get update -y
RUN apt-get install -y software-properties-common && add-apt-repository -y ppa:ubuntu-wine/ppa
RUN apt-get update -y

RUN apt-get install -y x11vnc xvfb  wine1.8 winetricks xvfb

ENV WINEPREFIX /root/prefix32
ENV WINEARCH win32
ENV DISPLAY :0

RUN	mkdir ~/.vnc
RUN	x11vnc -storepasswd 1234 ~/.vnc/passwd
RUN apt-get purge -y software-properties-common
RUN apt-get autoclean -y


# Expose Port
EXPOSE 5900

CMD ["x11vnc -forever -usepw -create"]

