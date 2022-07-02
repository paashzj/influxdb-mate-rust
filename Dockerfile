FROM ttbb/compile:rust AS build
COPY . /opt/sh/compile
WORKDIR /opt/sh/compile
RUN /root/.cargo/bin/cargo build


FROM ttbb/influxdb:nake

COPY docker-build /opt/sh/influxdb/mate

COPY --from=build /opt/sh/compile/target/debug/influxdb-mate-rust /opt/sh/influxdb/mate/influxdb-mate

WORKDIR /opt/sh/influxdb

CMD ["/usr/bin/dumb-init", "bash", "-vx", "/opt/sh/influxdb/mate/scripts/start.sh"]
