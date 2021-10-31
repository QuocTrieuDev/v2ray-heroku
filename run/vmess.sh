#!/bin/sh

# Write V2Ray configuration
CONFIG_DIR="/etc/v2ray-config"
mkdir -p ${CONFIG_DIR}
cat << EOF > ${CONFIG_DIR}/vmess.json
{
    "inbounds": [{
        "port": ${PORT:-3000},
        "protocol": "vmess",
        "settings": {
            "clients": [
                {
                    "id": "${ID:-dd71329d-accd-476f-beef-167f625cf19a}",
                    "alterId": ${AID:-64}
                }
            ],
            "decryption": "none"
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path": "${WSPATH:-/}"
            }
        }
    }],
    "outbounds": [{
        "protocol": "freedom"
    }]
}
EOF

/etc/v2ray-core/v2ctl config "${CONFIG_DIR}/vmess.json" > "${CONFIG_DIR}/vmess.pb"
/usr/bin/v2ray -config="${CONFIG_DIR}/vmess.pb"