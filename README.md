# Rootless Traefik image

- Based on [Traefik's Alpine dockerfile](https://github.com/traefik/traefik-library-image/blob/05f8054703253e2b20c802fc69d24a31ca769a43/v3.2/alpine/Dockerfile)
- [crowdsec-bouncer-traefik-plugin](https://github.com/maxlerebourg/crowdsec-bouncer-traefik-plugin) included.
  - Follow the [setup instructions](https://plugins.traefik.io/plugins/6335346ca4caa9ddeffda116/crowdsec-bouncer-traefik-plugin)
- Runs as the user `traefik`

  - UID=2000
  - GID=2000

- Make sure to `chown 2000:2000 fileConfig.yml traefik.yml acme.json`

- A bare minimum config is included in this repo, it needs to be adjusted to be of any use though.

- A new image will be built every night if a new [Traefik release](https://github.com/traefik/traefik/releases) is detected.
