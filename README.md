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
```bash
# Add
nameserver ip-контейнера
```

Execute:
```
# Backup resolv.conf
sudo mv /etc/resolv.conf /etc/resolv.conf.bak
# Reload network-manager
sudo systemctl restart systemd-networkd
```

## Fix error `Temporary failure in name resolution [Errno -3]` with Docker
Edit config DNS: `sudo nano /etc/docker/daemon.json`:
```
{
    "dns": ["8.8.8.8", "8.8.4.4"]
}
```
After that: `sudo service docker restart`

Enter: 'ip:port/admin/'

## Smartphone
1. Install [Connect for Pi-hole](https://play.google.com/store/apps/details?id=com.tien.piholeconnect&hl=ru).
1. Forwarding ports on router.
1. Scan QRCode.

# [Duck DNS](https://www.duckdns.org)
![DuckDNS](https://www.duckdns.org/img/ducky_icon.png)
1. Register on [https://www.duckdns.org](https://www.duckdns.org).
2. Set variables on [docker-compose.yml](./docker-compose.yml).

Check IP: [https://digwebinterface.com](https://digwebinterface.com).
