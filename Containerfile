FROM ghcr.io/ublue-os/aurora-dx:latest

RUN mkdir -p /nix && ostree container commit

RUN bootc container lint
