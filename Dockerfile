FROM golang:1.23 as build


COPY . /app
WORKDIR /app/pkg
RUN mv ./entrypoint.sh /app/entrypoint.sh \
    && chmod 555 /app/entrypoint.sh \
    && go build -o /app/simulation-exporter

#############################################
# FINAL IMAGE
#############################################
FROM alpine
RUN apk add --no-cache \
        libc6-compat \
    	ca-certificates
WORKDIR /app
COPY --from=build /app/ /app/
USER 1000
ENTRYPOINT ["/app/entrypoint.sh"]
