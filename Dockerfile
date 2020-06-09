FROM node:10.11-stretch

RUN apt-get update && apt-get install -y git curl build-essential python sudo

RUN git clone https://github.com/balena-os/jetson-flash.git

WORKDIR jetson-flash

RUN git checkout v0.3.0 && npm install && mkdir -p /workdir/jetson-flash-artifacts /cache
ADD Linux_for_Tegra.tar.gz  /cache/
COPY hash.js hash.js
COPY start.sh /start.sh
ENTRYPOINT ["/start.sh"]
