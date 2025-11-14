## Rootless Traefik Image 🚀

- Based on the official Alpine-based [Traefik Dockerfile](https://github.com/traefik/traefik-library-image/blob/05f8054703253e2b20c802fc69d24a31ca769a43/v3.2/alpine/Dockerfile).

## Setup Instructions 📝

- Please follow the setup instructions to get started. This README provides a brief overview, but you'll need to adjust the configuration files to suit your needs 🔧.
  - [Traefik setup](https://doc.traefik.io/traefik/getting-started/quick-start/)

## Image Details 🎉

- Runs as the unprivileged user traefik (UID=2000, GID=2000)
- A bare minimum configuration is included in this repository, which you'll need to customize 👍

## Important Configuration Files 🔒

Before running the image, ensure that:

- File permissions are set correctly: chown 2000:2000 on fileConfig.yml, traefik.yml, and acme.json

**Note** : A new image will be built every night if a new [Traefik release](https://github.com/traefik/traefik/releases) is detected. This ensures you always have access to the latest version of Traefik 🔥.
