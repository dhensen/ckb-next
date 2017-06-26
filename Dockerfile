FROM base/archlinux:2017.06.01

LABEL maintainer "dino.hensen@gmail.com"

# "Freezing" the mirrorlist to the date of creating this dockerfile
RUN echo 'Server=https://archive.archlinux.org/repos/2017/06/12/$repo/os/$arch' > /etc/pacman.d/mirrorlist

# Install dependencies
RUN pacman -Sy --noconfirm base-devel qt5-base zlib

# Add all sources
COPY src /ckb-next/src
COPY qmake-auto /ckb-next/qmake-auto
COPY dockerinstall /ckb-next/dockerinstall
COPY VERSION /ckb-next/VERSION
COPY FIRMWARE /ckb-next/FIRMWARE
COPY ckb.pro /ckb-next/ckb.pro

# Execute dockerinstall, which is a stripped version of quickinstall
RUN cd /ckb-next && ls -sla && ./dockerinstall

# replace this later with gosu
RUN groupadd -g 1000 ckb \
    && useradd -m -g ckb -u 1000 -G video ckb
RUN pacman -S --noconfirm \
    strace \
    libva-mesa-driver \
    libxcursor \
    xcursor-themes \
    ttf-liberation

WORKDIR /usr/bin

VOLUME "/home/ckb/.config/ckb"

CMD ["/usr/bin/ckb-daemon"]
