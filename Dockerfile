FROM gcr.io/distroless/static-debian12

ENTRYPOINT ["/speedtest_exporter"]

COPY speedtest_exporter /
