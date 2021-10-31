#!/bin/sh

# Write V2Ray configuration
CONFIG_DIR="/etc/v2ray-config"
mkdir -p ${CONFIG_DIR}

cat << EOF > /etc/config/vless.json
{
    "inbounds": [{
        "port": ${PORT:-3000},
        "protocol": "vless",
        "settings": {
            "clients": [
                {
                    "id": "${ID:-dd71329d-accd-476f-beef-167f625cf19a}"
                }
            ],
            "decryption": "none"
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path": "${PATH:-/}"
            }
        }
    }],
    "outbounds": [{
        "protocol": "freedom"
    }]
}
EOF

/etc/v2ray-core/v2ctl config "${CONFIG_DIR}/vless.json" > "${CONFIG_DIR}/vless.pb"
/usr/bin/v2ray -config="${CONFIG_DIR}/vless.pb"