#!/bin/bash

apt-get update
apt install apache2 -y
cd /tmp 
curl -s https://api.github.com/repos/Lusitaniae/apache_exporter/releases/latest   | grep browser_download_url   | grep linux-amd64 | cut -d '"' -f 4 | wget -qi -
tar -xzvf apache_exporter-*.linux-amd64.tar.gz
cp -ivr  apache_exporter-*.linux-amd64/apache_exporter /usr/local/bin
chmod +x /usr/local/bin/apache_exporter
apache_exporter --version

# Seguramente diga que ya esta creado

groupadd --system prometheus
useradd  -s /sbin/nologin --system -g prometheus prometheus

cat <<EOF >>/etc/systemd/system/apache_exporter.service
[Unit]
Description=Prometheus
Documentation=https://github.com/Lusitaniae/apache_exporter
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=prometheus
Group=prometheus
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/local/bin/apache_exporter 
  --insecure 
  --scrape_uri=http://localhost/server-status/?auto 
  --telemetry.address=0.0.0.0:9117 
  --telemetry.endpoint=/metrics

SyslogIdentifier=apache_exporter
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start apache_exporter.service
systemctl enable apache_exporter.service

cat <<EOF >>/etc/prometheus/prometheus.yml
# Apache Servers
 - job_name: apache-web-server
   static_configs:
   - targets: ['localhost:9117']
     labels:
       alias: server-apache
EOF

systemctl restart prometheus
apt install figlet -y
figlet "ID 3894"