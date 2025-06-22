#!/bin/bash

echo "📦 Installing TikTok US Node Proxy..."

apt update && apt install -y curl wget unzip

echo "📥 Downloading Clash Meta for Linux..."
wget -O clash.meta.gz https://github.com/MetaCubeX/mihomo/releases/download/v1.19.0/mihomo-linux-amd64-v1.19.0.gz
gunzip clash.meta.gz

chmod +x clash.meta
mv clash.meta /usr/local/bin/clash

echo "📁 Setting up config directory..."
mkdir -p /root/.config/clash

cat <<EOF > /root/.config/clash/config.yaml
port: 7890
socks-port: 7891
allow-lan: true
mode: rule
log-level: info
external-controller: 127.0.0.1:9090
secret: ""
proxies: []
proxy-groups: []
rules: []
EOF

echo "✅ Setup complete! Edit your config at /root/.config/clash/config.yaml"
