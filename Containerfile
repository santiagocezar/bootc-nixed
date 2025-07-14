FROM ghcr.io/ublue-os/aurora-dx:latest

COPY 99-ds3-controllers.rules /etc/udev/rules.d/99-ds3-controllers.rules

RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    dnf5 copr enable scottames/ghostty && dnf5 install ghostty

RUN bootc container lint
