FROM debian:stable-slim

COPY entrypoint.sh ./

RUN apt update && apt install --no-install-recommends -y cloud-init && apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/entrypoint.sh"]