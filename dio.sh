#!/bin/bash
echo "0 0 * * * reboot >/dev/null 2>&1" >> /etc/crontab

touch dionaea.service

echo "[Unit]
Description=Dionaea service
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
User=root
ExecStart=/opt/dionaea/bin/dionaea

[Install]
WantedBy=multi-user.target" >> dionaea.service

mv dionaea.service /etc/systemd/system/

systemctl enable dionaea.service
