# How to make a raspberry pi a wifi router

```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y hostapd isc-dhcp-server
```
```
sudo cp /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.default
sudo nano /etc/dhcp/dhcpd.conf
```
to comment 
```
option domain-name "example.org";
option domain-name-servers ns1.example.org, ns2.example.org;
```
to un-comment
```
#authoritative;
```
to append
```
subnet 10.0.1.0 netmask 255.255.255.0 {
    range 10.0.1.10 10.0.1.50;
    option broadcast-address 10.0.1.255;
    option routers 10.0.1.1;
    default-lease-time 600;
    max-lease-time 7200;
    option domain-name "local";
    option domain-name-servers 8.8.8.8, 8.8.4.4;
}
```

```
sudo nano /etc/default/isc-dhcp-server
```
to modify
```
INTERFACEv4="wlan0"
```

```
sudo ifconfig wlan0 down
sudo cp /etc/network/interfaces /etc/network/interfaces.backup
sudo nano /etc/network/interfaces
```
to append
```

auto lo
iface lo inet loopback

auto eth0
allow-hotplug eth0
iface eth0 inet manual

allow-hotplug wlan0
iface wlan0 inet static
  address 10.0.1.1
  netmask 255.255.255.0
  post-up iw dev $IFACE set power_save off
```

```
sudo ifconfig wlan0 10.0.1.1
```

```
sudo nano /etc/hostapd/hostapd.conf
```
to append
```
WiFi authen
interface=wlan0
ssid=WiPi
hw_mode=g
channel=6
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
wpa=2
wpa_passphrase=xyz
wpa_key_mgmt=WPA-PSK
wpa_pairwise=TKIP
rsn_pairwise=CCMP
```
```
basename $( readlink /sys/class/net/wlan0/device/driver )
```

```
sudo cp /etc/sysctl.conf /etc/sysctl.conf.backup
sudo nano /etc/sysctl.conf
```
to un-commet
```
net.ipv4.ip_forward=1
```
```
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
```
```
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
```
```
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
```
```
sudo nano /etc/network/interfaces
```
to append
```
up iptables-restore < /etc/iptables.ipv4.nat
```
```
sudo nano /etc/default/hostapd
```
to modify
```
DAEMON_CONF="/etc/hostapd/hostapd.conf"
```

to test
```
sudo /usr/sbin/hostapd /etc/hostapd/hostapd.conf
```
to start
```
sudo service hostapd start
sudo service isc-dhcp-server start
```

