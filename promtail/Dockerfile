ARG BUILD_FROM
# hadolint ignore=DL3006
FROM $BUILD_FROM

# Setup base system
ARG BUILD_ARCH=amd64

# tzdata required for the timestamp stage to work
# Backports repo required to get a libsystemd version 246 or newer which is required to handle journal +ZSTD compression
RUN echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list
RUN set -eux; \
  apt-get update; \
  apt-get install -qy tzdata ca-certificates unzip; \
  apt-get install -t buster-backports -qy libsystemd-dev; \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;

# https://github.com/grafana/loki/releases
ENV LOKI_VERSION 2.1.0

# Add Promtail
RUN set -eux; \
  case "$BUILD_ARCH" in \
    amd64)  BINARCH='amd64' ;; \
    armhf)   BINARCH='arm' ;; \
    armv7)   BINARCH='arm' ;; \
    aarch64) BINARCH='arm64' ;; \
    *) echo >&2 "error: unsupported architecture ($BUILD_ARCH)"; exit 1 ;;\
  esac; \
  curl -J -L -o /tmp/promtail.zip "https://github.com/grafana/loki/releases/download/v${LOKI_VERSION}/promtail-linux-${BINARCH}.zip"; \
  unzip /tmp/promtail.zip -d /usr/bin; \
  mv /usr/bin/promtail-linux-${BINARCH} /usr/bin/promtail; \
  chmod a+x /usr/bin/promtail; \
  rm -rf /tmp/*; \
  promtail -version;

# https://github.com/mikefarah/yq/releases
ENV YQ_VERSION 4.6.1

# Add yq (and its dependency, jq)
RUN set -eux; \
  apt-get install jq; \
  case "$BUILD_ARCH" in \
    amd64)  BINARCH='amd64' ;; \
    armhf)   BINARCH='arm' ;; \
    armv7)   BINARCH='arm' ;; \
    aarch64) BINARCH='arm64' ;; \
    *) echo >&2 "error: unsupported architecture ($BUILD_ARCH)"; exit 1 ;;\
  esac; \
  curl -J -L -o /tmp/yq.tar.gz "https://github.com/mikefarah/yq/releases/download/v${YQ_VERSION}/yq_linux_${BINARCH}.tar.gz"; \
  tar -xf /tmp/yq.tar.gz -C /usr/bin; \
  mv /usr/bin/yq_linux_${BINARCH} /usr/bin/yq; \
  chmod a+x /usr/bin/yq; \
  rm -rf /tmp/*; \
  yq -V;


COPY rootfs /
RUN mkdir -p /data/promtail
WORKDIR /data/promtail