## Docker & Docker Compose INSTALL
```aiignore
sudo dnf install docker -y
sudo systemctl start docker
sudo curl -L "https://github.com/docker/compose/releases/download/v2.29.7/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
```