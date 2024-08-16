# GNS3 design

Using Debian appliance.

## Debian network

Enable ipv4 forward in file `/etc/sysctl.conf`:
```conf
net.ipv4.ip_forward=1
```

Install `iptables-persistent`:
```shell
sudo apt install iptables-persistent
```

Set iptables rules:
```shell
sudo iptables -A FORWARD -i ens5 -o ens4 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i ens5 -o ens4 -j ACCEPT
```

Save iptables rules:
```shell
sudo iptables-restore < /etc/iptables/rules.v4
```
