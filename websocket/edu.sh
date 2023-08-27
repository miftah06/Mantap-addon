#!/bin/bash
# Proxy For Edukasi & Imclass
# SL
# ==========================================

# Link Hosting Kalian
akbarvpn="raw.githubusercontent.com/miftah06/Mantap-addon/master/websocket"

# Getting Proxy Template
wget -q -O /usr/local/bin/ws-nontls https://${akbarvpn}/websocket.py
chmod +x /usr/local/bin/ws-nontls

#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition 1.0
# Auther  : givpn
# (C) Copyright 2023
# =========================================
clear
echo Installing Websocket-SSH Python
sleep 1
echo Please wait...
sleep 2
# shellcheck disable=SC2164
cd

# // GIT USER
# shellcheck disable=SC2034
GitUser="givpn"

# // SYSTEM WEBSOCKET HTTPS 443
cat <<EOF> /etc/systemd/system/ws-https.service
[Unit]
Description=Python Proxy
Documentation=https://github.com/givpn/
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
Restart=on-failure
ExecStart=/usr/bin/python -O /usr/local/bin/ws-https

[Install]
WantedBy=multi-user.target
EOF

# // SYSTEM WEBSOCKET HTTP 80
cat <<EOF> /etc/systemd/system/ws-http.service
[Unit]
Description=Python Proxy
Documentation=https://github.com/givpn/
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-http
Restart=on-failure
[Install]
WantedBy=multi-user.target
EOF

# // SYSTEM WEBSOCKET OVPN
cat <<EOF> /etc/systemd/system/ws-ovpn.service
[Unit]
Description=Python Proxy
Documentation=https://github.com/givpn/
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /usr/local/bin/ws-ovpn 2097
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF

# // PYTHON WEBSOCKET TLS && NONE
wget -q -O /usr/local/bin/ws-https raw.githubusercontent.com/miftah06/Mantap-addon/websocket/ws-https; chmod +x /usr/local/bin/ws-https

# // PYTHON WEBSOCKET DROPBEAR
wget -q -O /usr/local/bin/ws-http raw.githubusercontent.com/miftah06/Mantap-addon/websocket/ws-http; chmod +x /usr/local/bin/ws-http

# // PYTHON WEBSOCKET OVPN
wget -q -O /usr/local/bin/ws-ovpn raw.githubusercontent.com/miftah06/Mantap-addon/websocket/ws-ovpn; chmod +x /usr/local/bin/ws-ovpn

# // RESTART && ENABLE SSHVPN WEBSOCKET TLS 
systemctl daemon-reload
systemctl enable ws-https
systemctl restart ws-https
systemctl enable ws-http
systemctl restart ws-http
systemctl enable ws-ovpn
systemctl restart ws-ovpn

izin permision
chmod +x /usr/local/bin/edu-proxy
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/edu-proxyovpn


#System Direcly dropbear Websocket-SSH Python
wget -O /etc/systemd/system/edu-proxy.service https://gitlab.com/hidessh/baru/-/raw/main/websocket-python/baru/http.service && chmod +x /etc/systemd/system/edu-proxy.service
#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/kanghory/VPN/main/Insshws/service-wsdropbear.txt && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/kanghory/VPN/main/Insshws/ws-stunnel.service.txt && chmod +x /etc/systemd/system/ws-stunnel.service

##System Websocket-OpenVPN Python
wget -O /etc/systemd/system/edu-proxyovpn.service https://gitlab.com/hidessh/baru/-/raw/main/websocket-python/baru/ovpn.service && chmod +x /etc/systemd/system/edu-proxyovpn.service

#restart service
#
systemctl daemon-reload

#Enable & Start & Restart directly dropbear
systemctl daemon-reload
systemctl enable edu-proxy.service
systemctl start edu-proxy.service
systemctl restart edu-proxy.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

systemctl daemon-reload
systemctl enable edu-proxyovpn.service
systemctl start edu-proxyovpn.service
systemctl restart edu-proxyovpn.service
clear
