FROM base/archlinux:2017.06.01

LABEL maintainer "dino.hensen@gmail.com"

# "Freezing" the mirrorlist to the date of creating this dockerfile
RUN echo 'Server=https://archive.archlinux.org/repos/2017/06/12/$repo/os/$arch' > /etc/pacman.d/mirrorlist

# Install dependencies
RUN pacman -Sy --noconfirm base-devel qt5-base zlib

# Add all sources
ADD . /ckb-next

# Execute dockerinstall, which is a stripped version of quickinstall
RUN cd /ckb-next && ls -sla && ./dockerinstall

ENTRYPOINT exec /usr/bin/ckb-daemon
