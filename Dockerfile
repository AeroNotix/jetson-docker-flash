FROM node:8-stretch

RUN apt-get update && apt-get install -y git curl build-essential python sudo

RUN git clone https://github.com/resin-os/jetson-flash.git

WORKDIR jetson-flash

RUN npm install && mkdir -p /workdir/jetson-flash-artifacts /cache
ADD Linux_for_Tegra.tar.gz  /cache/
COPY Linux_for_Tegra.stamp  /cache/
COPY start.sh /start.sh
ENTRYPOINT ["/start.sh"]
