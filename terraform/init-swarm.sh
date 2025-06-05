#!/bin/bash
apt-get update -y
apt-get install -y docker.io nginx git ufw

systemctl enable docker
systemctl start docker

# Docker Swarm Init
docker swarm init

# UFW rules (optional if using security groups)
ufw allow 'Nginx Full'
ufw allow 2377
ufw allow 7946
ufw allow 4789
ufw allow OpenSSH
ufw --force enable

# NGINX Reverse Proxy Placeholder
cat > /etc/nginx/sites-available/yii2 <<EOF
server {
    listen 80;
    server_name _;
    
    location / {
        proxy_pass http://localhost:8080; # Docker container listens on 8080
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF

ln -s /etc/nginx/sites-available/yii2 /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default
systemctl reload nginx
