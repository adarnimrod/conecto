FROM adarnimrod/elementaryos
RUN apt-get update && \
    apt-get install -y \
        debhelper \
        libebook1.2-dev \
        libedataserver1.2-dev \
        libghc-gnutls-dev \
        libnotify-dev \
        libsqlite3-dev \
        libunity-dev \
    && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/* /var/cache/apt/archives/*
ENV DESTDIR=/usr \
    MESON_INSTALL_PREFIX=/usr
VOLUME /conecto
WORKDIR /conecto
USER 1000
ENTRYPOINT ["sh", "-c"]
CMD ["meson build --buildtype=release && ninja -C build && glib-compile-schemas ./data/"]
