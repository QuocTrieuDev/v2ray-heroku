FROM alpine:latest

ADD run /opt/run
ADD v2ray-core /etc/v2ray-core

RUN apk add --no-cache --virtual .build-deps ca-certificates curl
RUN chmod +x /opt/run/entrypoint.sh /opt/run/vless.sh /opt/run/vmess.sh /etc/v2ray-core/v2ctl /etc/v2ray-core/v2ray

RUN install -m 755 /etc/v2ray-core/v2ray /usr/bin

ENTRYPOINT ["env", "RUNDIR=/opt/run", "sh", "-c", "/opt/run/entrypoint.sh"]
