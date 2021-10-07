FROM ubuntu:latest as build

RUN apt-get update && apt-get -y install simpleproxy

FROM gcr.io/distroless/base-debian10
COPY --from=build /usr/bin/simpleproxy /usr/bin/simpleproxy

ENTRYPOINT [ "/usr/bin/simpleproxy" ]
