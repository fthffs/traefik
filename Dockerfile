FROM alpine:3.20
ARG TRAEFIK_VERSION=v3.2.0
RUN apk --no-cache add ca-certificates tzdata
RUN set -ex; \
  apkArch="$(apk --print-arch)"; \
  case "$apkArch" in \
  armhf) arch='armv6' ;; \
  aarch64) arch='arm64' ;; \
  x86_64) arch='amd64' ;; \
  riscv64) arch='riscv64' ;; \
  s390x) arch='s390x' ;; \
  ppc64le) arch='ppc64le' ;; \
  *) echo >&2 "error: unsupported architecture: $apkArch"; exit 1 ;; \
  esac; \
  wget --quiet -O /tmp/traefik.tar.gz "https://github.com/traefik/traefik/releases/download/${TRAEFIK_VERSION}/traefik_${TRAEFIK_VERSION}_linux_$arch.tar.gz"; \
  tar xzvf /tmp/traefik.tar.gz -C /usr/local/bin traefik; \
  rm -f /tmp/traefik.tar.gz; \
  chmod +x /usr/local/bin/traefik

RUN set -ex; \
  addgroup --gid 2000 -S traefik; \
  adduser --uid 2000 -D -S -h / -s /sbin/nologin -G traefik traefik

COPY --chmod=755 entrypoint.sh /
USER traefik
ENTRYPOINT ["/entrypoint.sh"]
CMD ["traefik"]

# Metadata
LABEL org.opencontainers.image.vendor="fthffs" \
  org.opencontainers.image.url="https://traefik.io" \
  org.opencontainers.image.source="https://github.com/fthffs/traefik" \
  org.opencontainers.image.title="Traefik rootless" \
  org.opencontainers.image.description="A rootless modern reverse-proxy" \
  org.opencontainers.image.documentation="https://docs.traefik.io" \
  org.opencontainers.image.version="v3.2.0"
