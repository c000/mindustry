from busybox as mindustry

RUN wget https://github.com/Anuken/Mindustry/releases/download/v146/server-release.jar

from openjdk:23-slim-bullseye

RUN apt-get update \
 && apt-get install -y apt-utils curl \
 && curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.noarmor.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null \
 && curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.tailscale-keyring.list | tee /etc/apt/sources.list.d/tailscale.list \
 && apt-get update \
 && apt-get install -y tailscale

COPY --from=mindustry server-release.jar ./

CMD ["tailscaled", "--tun=userspace-networking"]
