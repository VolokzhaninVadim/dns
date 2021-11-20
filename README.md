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

Закрепляем IPv4 адрес Raspberry Pi :
IPv4 адрес Raspberry Pi :

![IPv4](https://beebom.com/wp-content/uploads/2021/05/abc-1.jpg)

Проставляем IPv4 адрес Raspberry Pi :

![IPv4](https://beebom.com/wp-content/uploads/2021/05/Screenshot-2021-05-17-18.56.58.jpg)

## Настройка ПК
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
Выполняем: `sudo systemctl restart NetworkManager`
Редактируем `/etc/resolv.conf`:
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
