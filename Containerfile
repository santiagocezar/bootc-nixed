FROM ghcr.io/ublue-os/aurora-dx:latest

RUN mkdir -p /nix && \
    sudo dnf5 install https://github.com/OpenTabletDriver/OpenTabletDriver/releases/latest/download/opentabletdriver-0.6.5.1-1.x86_64.rpm && \
    ostree container commit

RUN bootc container lint
