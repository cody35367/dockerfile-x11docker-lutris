FROM x11docker/xfce

RUN \
apt-get update && \
apt-get dist-upgrade -y && \
apt-get install gnupg wget -y && \
dpkg --add-architecture i386 && \
wget -q https://dl.winehq.org/wine-builds/winehq.key -O- | apt-key add - && \
wget -q https://download.opensuse.org/repositories/home:/strycore/Debian_9.0/Release.key -O- | apt-key add - && \
echo "deb https://dl.winehq.org/wine-builds/debian/ buster main" > /etc/apt/sources.list.d/winehq.list && \
echo "deb http://download.opensuse.org/repositories/home:/strycore/Debian_9.0/ ./" > /etc/apt/sources.list.d/lutris.list && \
apt-get update && \
apt-get install --install-recommends winehq-stable -y && \
apt-get install lutris -y && \
rm -rf /var/lib/apt/lists/*

CMD ["lutris"]