# [PiHole](https://pi-hole.net/)
![PiHole](https://wp-cdn.pi-hole.net/wp-content/uploads/2016/12/Vortex-R.webp)
## Установка дополнительного программного обеспечения

Для работы с сетью: 
```
sudo apt-get install network-manager
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager
```

## Роутер 
Настройка DHCP Server (TP-Link Archer A6): 

![DHCP Server](https://beebom.com/wp-content/uploads/2021/05/dScreenshot-2021-05-17-18.56.40.jpg)

Закрепляем IPv4 адрес Raspberry Pi:

![IPv4](https://beebom.com/wp-content/uploads/2021/05/abc-1.jpg)

Проставляем IPv4 адрес Raspberry Pi:

![IPv4](https://beebom.com/wp-content/uploads/2021/05/Screenshot-2021-05-17-18.56.58.jpg)

## Настройка Raspberry Pi
Открываем конфигурацию диспетчера сети:
```
sudo nano /etc/NetworkManager/NetworkManager.conf
```

Добавляем `dns=default` в `[main]`:
```
[main]
plugins=ifupdown,keyfile
dns=default
```
Этот параметр сообщит `NetworkManager`, что нет необходимости управлять содержимым файла `/etc/resolv.conf`
Выполняем: `sudo systemctl restart NetworkManager`. Редактируем `/etc/resolv.conf`:
```
nameserver ip-контейнера
```

## Исправление ошибки `Temporary failure in name resolution [Errno -3]` with Docker
Редкатирую конфиг DNS: `sudo nano /etc/docker/daemon.json`:
```
{
    "dns": ["8.8.8.8", "8.8.4.4"]
}
```
После выполняем: `sudo service docker restart`

## Смартфон 
1. Устанавливаем [Connect for Pi-hole](https://play.google.com/store/apps/details?id=com.tien.piholeconnect&hl=ru). 
1. Пробрасываем порты через роутер.   
1. Выполняем: 
```
# Смотрим запущенный контейнеры 
docker ps 

# Заходим в контейнер 
dicker exec -it container_id bash

# Устанавливаем пароль 
pihole -a -p YOUR_PASSWORD
```
4. Сканируем через [Connect for Pi-hole](https://play.google.com/store/apps/details?id=com.tien.piholeconnect&hl=ru) QRCode. 

## Блокировка yotube рекламы 
Берем список : 
* https://github.com/kboghdady/youTube_ads_4_pi-hole.
* https://github.com/nickspaargaren/no-google

Для ежечасного обновления списков прописываем в `crontab -e`: 
```
# update gravity
@hourly docker exec pihole pihole updateGravity
```
