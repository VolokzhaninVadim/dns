# Docker (Ubuntu)
```
# Install packages for work with net
sudo apt install net-tools
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
# Install docker and docker-compose
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-compose
# Add user in docker group, that do not launch docker with sudo
sudo usermod -aG docker ${USER}
```

# [PiHole](https://pi-hole.net/)
![PiHole](https://wp-cdn.pi-hole.net/wp-content/uploads/2016/12/Vortex-R.png)
## Instasll additional soft:
```
# Instasll additional soft
sudo apt-get install network-manager
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
```

## Router
DHCP Server settings (TP-Link Archer A6):

![DHCP Server](https://beebom.com/wp-content/uploads/2021/05/dScreenshot-2021-05-17-18.56.40.jpg)

Set IPv4 server with pihole on router:

![IPv4](https://beebom.com/wp-content/uploads/2021/05/abc-1.jpg)
![IPv4](https://beebom.com/wp-content/uploads/2021/05/Screenshot-2021-05-17-18.56.58.jpg)

## Server settings
Switch off systemd-resolved:
```
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
```

Edit `NetworkManager.conf`:
```
sudo nano /etc/NetworkManager/NetworkManager.conf
```

Add `dns=default` in `[main]`:
```
[main]
plugins=ifupdown,keyfile
dns=default
```
This parameter inform `NetworkManager` that not necessary manage `/etc/resolv.conf`. After that: `sudo systemctl restart NetworkManager`.

Edit`/etc/resolv.conf`:
```
# Backup resolv.conf
sudo mv /etc/resolv.conf /etc/resolv.conf.bak
# Reload network-manager
sudo service network-manager restart
```

## Fix error `Temporary failure in name resolution [Errno -3]` with Docker
Edit config DNS: `sudo nano /etc/docker/daemon.json`:
```
{
    "dns": ["8.8.8.8", "8.8.4.4"]
}
```
After that: `sudo service docker restart`

## Smartphone
1. Install [Connect for Pi-hole](https://play.google.com/store/apps/details?id=com.tien.piholeconnect&hl=ru).
1. Forwarding ports on router.
1. Scan QRCode.

## Backup
For backup use [backup.sh](./dns_backup.sh) and [unzip.sh](./unzip.sh).
[Yandex s3](https://cloud.yandex.ru/docs/storage/tools/s3fs).

# [Duck DNS](https://www.duckdns.org)
![DuckDNS](https://www.duckdns.org/img/ducky_icon.png)
1. Register on [https://www.duckdns.org](https://www.duckdns.org).
2. Set variables on [docker-compose.yml](./docker-compose.yml).

Check IP: [https://digwebinterface.com](https://digwebinterface.com).
