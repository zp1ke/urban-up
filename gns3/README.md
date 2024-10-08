# GNS3 design

Using [Debian 12](https://www.debian.org/distrib/) appliance from [GNS3 marketplace](https://docs.gns3.com/docs/using-gns3/beginners/install-from-marketplace/).

## Subnets ip range

Using [calculator](https://calculator.boson.com/calculator).

## Debian network

Edit config in file `/etc/network/interfaces` and restart networking service:
```console
sudo /etc/init.d/networking restart
```

Check:
```console
ip a
```

### Routers

Enable ipv4 forward in file `/etc/sysctl.conf`:
```properties
net.ipv4.ip_forward=1
```

Install `iptables-persistent`:
```console
sudo apt install iptables-persistent
```

Set iptables rules:
```console
sudo iptables -t nat -A POSTROUTING -o <OUT_DEV> -j MASQUERADE
sudo iptables -A FORWARD -i <IN_DEV> -o <OUT_DEV> -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i <IN_DEV> -o <OUT_DEV> -j ACCEPT
```

Save iptables rules:
```console
sudo iptables-save > /etc/iptables/rules.v4
```

Restart ;|

### DHCP

DHCP server:
```console
sudo apt install isc-dhcp-server
```

Configure DHCP in file `/etc/dhcp/dhcpd.conf`:
```cfg
subnet <IP_ADDRESS> netmask <NET_MASK> {
  range <IP_ADDRESS_FROM> <IP_ADDRESS_TO>;
  option routers <ROUTER_IP_ADDRESS>;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
  default-lease-time 600;
  max-lease-time 7200;
}
```

Specify the network interface in file `/etc/default/isc-dhcp-server`:
```properties
INTERFACESv4="<NET_DEV>"
```

Start the DHCP service and enable it to run on boot:
```console
sudo systemctl start isc-dhcp-server
sudo systemctl enable isc-dhcp-server
sudo systemctl status isc-dhcp-server
```
