FROM ghcr.io/ublue-os/aurora-dx:latest

COPY 99-ds3-controllers.rules /etc/udev/rules.d/99-ds3-controllers.rules

RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    dnf5 install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm && \
    dnf5 copr enable -y scottames/ghostty && \
    dnf5 install -y ghostty && \
    dnf5 swap -y mesa-va-drivers mesa-va-drivers-freeworld

# fw-fanctrl: i don't have a framework laptop lol
# input-remapper: seems to slow down paring by bt mouse
RUN --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    dnf5 remove -y fw-fanctrl input-remapper

RUN bootc container lint
