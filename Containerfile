FROM ghcr.io/ublue-os/aurora-dx:latest

COPY 99-ds3-controllers.rules /etc/udev/rules.d/99-ds3-controllers.rules

RUN mkdir -p /nix && ostree container commit

RUN bootc container lint
