FROM docker.io/debian:12 as build

RUN apt-get update && apt-get -y install simpleproxy

FROM gcr.io/distroless/base-debian12
COPY --from=build /usr/bin/simpleproxy /usr/bin/simpleproxy

ENTRYPOINT [ "/usr/bin/simpleproxy" ]
