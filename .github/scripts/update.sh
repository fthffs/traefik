#!/usr/bin/env bash

traefik() {
  traefik_url="https://api.github.com/repos/traefik/traefik/releases/latest"
  new_version="$(curl -sSL ${traefik_url} | jq -r '.tag_name')"

  if [ "${new_version}" ]; then
    sed -i "s/TRAEFIK_VERSION=.*/TRAEFIK_VERSION=${new_version}/" Dockerfile
    sed -i "s/org.opencontainers.image.version=.*/org.opencontainers.image.version=\"${new_version}\"/" Dockerfile
  fi

  if output=$(git status --porcelain) && [ -z "$output" ]; then
    # working directory clean
    echo "no new traefik version available!"
  else
    # uncommitted changes
    git commit -a -m "updated traefik to version: ${new_version}"
    git push
  fi
}

traefik
