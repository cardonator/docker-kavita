FROM ghcr.io/linuxserver/baseimage-alpine:3.17

RUN \
  echo "**** install packages ****" && \
  apk add -U --upgrade --no-cache \
    icu-libs \
    sqlite-libs && \
  echo "**** install sonarr ****" && \
  mkdir -p /app/kavita/bin && \
  curl -o \
    /tmp/kavita.tar.gz -L \
    "https://github.com/Kareadita/Kavita/releases/latest/download/kavita-linux-musl-x64.tar.gz" && \
  tar xzf \
    /tmp/kavita.tar.gz -C \
    /app/kavita/bin --strip-components=1 && \
  chmod +x /app/kavita/bin/Kavita && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/* \
    /app/kavita/bin/config && \
  ln -s /config /app/kavita/bin/config

# add local files
COPY root/ /

# ports and volumes
EXPOSE 5000
VOLUME /config
