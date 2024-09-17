#!/usr/bin/env bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
##@Version           :  202409171124-git
# @@Author           :  CasjaysDev
# @@Contact          :  CasjaysDev <docker-admin@casjaysdev.pro>
# @@License          :  MIT
# @@ReadME           :
# @@Copyright        :  Copyright 2023 CasjaysDev
# @@Created          :  Mon Aug 28 06:48:42 PM EDT 2023
# @@File             :  init.sh
# @@Description      :  script to initialize coolify
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# shellcheck shell=bash
# shellcheck disable=SC2016
# shellcheck disable=SC2031
# shellcheck disable=SC2120
# shellcheck disable=SC2155
# shellcheck disable=SC2199
# shellcheck disable=SC2317
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set bash options
set -o pipefail
[ "$DEBUGGER" = "on" ] && echo "Enabling debugging" && set -x$DEBUGGER_OPTIONS
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set env variables
exitCode=0

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Predifined actions
if [ ! -f "/data/coolify/source/.env" ]; then
  [ -d "/data/coolify/source" ] || mkdir -p /data/coolify/source
  cat <<HERE >"/data/coolify/source/.env"
APP_NAME=\${APP_NAME:-Coolify}
APP_ID=\${APP_ID:-$(openssl rand -hex 16)}
APP_KEY=base64:\${APP_KEY:-$(openssl rand -base64 32)}
AUTOUPDATE=\${AUTOUPDATE:-false}

# PostgreSQL Database Configuration
DB_USERNAME=\${DB_USERNAME:-coolify}
DB_PASSWORD=\${DB_PASSWORD:-$(openssl rand -base64 32)}

# Redis Configuration
REDIS_PASSWORD=\${REDIS_PASSWORD:-$(openssl rand -base64 32)}

# Pusher Configuration
PUSHER_APP_ID=\${PUSHER_APP_ID:-$(openssl rand -hex 32)}
PUSHER_APP_KEY=\${PUSHER_APP_KEY:-$(openssl rand -hex 32)}
PUSHER_APP_SECRET=\${PUSHER_APP_SECRET:-$(openssl rand -hex 32)}

HERE
fi
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
[ "$COOLIFY_INIT" != "yes" ] || curl -fsSL https://cdn.coollabs.io/coolify/install.sh | bash
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Main script

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Set the exit code
exitCode=$?
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
exit $exitCode
