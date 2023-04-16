#!/usr/bin/env sh

if [ ! -x "$HOME/.docker/cli-plugins/docker-compose" ]; then
  echo "Installing Docker Compose CLI plugin."
  if [ ! -d ~/.docker/cli-plugins/ ]; then
    sudo mkdir -p "$HOME/.docker/cli-plugins"
  fi
  if [ "$ARCH" = 'arm64' ]; then
    sudo curl --silent -SL "https://cdn.coollabs.io/bin/linux/arm64/docker-compose-linux-2.6.1" -o "$HOME/.docker/cli-plugins/docker-compose"
    sudo chmod +x "$HOME/.docker/cli-plugins/docker-compose"
  fi
  if [ "$ARCH" = 'aarch64' ]; then
    sudo curl --silent -SL "https://cdn.coollabs.io/bin/linux/aarch64/docker-compose-linux-2.6.1" -o "$HOME/.docker/cli-plugins/docker-compose"
    sudo chmod +x "$HOME/.docker/cli-plugins/docker-compose"
  fi
  if [ "$ARCH" = 'amd64' ]; then
    sudo curl --silent -SL "https://cdn.coollabs.io/bin/linux/amd64/docker-compose-linux-2.6.1" -o "$HOME/.docker/cli-plugins/docker-compose"
    sudo chmod +x "$HOME/.docker/cli-plugins/docker-compose"
  fi
fi
mkdir -p "/etc/docker/" "/var/snap/docker/current/config/"
cat <<EOF | tee "/etc/docker/daemon.json" "/var/snap/docker/current/config/daemon.json" >/dev/null
{
    "experimental": true,
    "log-driver": "json-file",
    "log-opts": {
      "max-size": "10m",
      "max-file": "1"
    },
    "features": {
        "buildkit": true
    },
    "live-restore": true,
    "default-address-pools" : [
    {
      "base" : "172.17.0.0/12",
      "size" : 20
    },
    {
      "base" : "192.168.0.0/16",
      "size" : 24
    }
  ]
}
EOF
