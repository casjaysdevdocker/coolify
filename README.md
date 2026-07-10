## 👋 Welcome to coolify 🚀  

coolify README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update coolify
```
  
## Install and run container
  
```shell
dockerHome="/srv/$USER/docker/casjaysdevdocker/coolify/coolify/latest/rootfs"
mkdir -p "/srv/$USER/docker/coolify/rootfs"
git clone "https://github.com/dockermgr/coolify" "$HOME/.local/share/CasjaysDev/dockermgr/coolify"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/coolify/rootfs/." "$dockerHome/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-coolify-latest \
--hostname coolify \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$dockerHome/data:/data:z" \
-v "$dockerHome/config:/config:z" \
-p 80:80 \
casjaysdevdocker/coolify:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/coolify
    container_name: casjaysdevdocker-coolify
    environment:
      - TZ=America/New_York
      - HOSTNAME=coolify
    volumes:
      - "/srv/$USER/docker/casjaysdevdocker/coolify/coolify/latest/rootfs/data:/data:z"
      - "/srv/$USER/docker/casjaysdevdocker/coolify/coolify/latest/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/coolify
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/coolify" "$HOME/Projects/github/casjaysdevdocker/coolify"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/coolify"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
