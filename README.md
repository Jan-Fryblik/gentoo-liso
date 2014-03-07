

### IKE (http://www.shrew.net)

Ebuild is based on http://data.gpo.zugaina.org/smithdanea/net-misc/ike/ike-2.2.0_alpha_rc9.ebuild

###### How to:

1. After Instalation run communication daemon as root

```
iked
```

2. as user run 

```
qikea

```

###### Tips: 

Before instalation is recommended to check kernel settings. I'm not sure if ebuild checks all kernel configurations needed by IKE. In kernel 
*Networking support -> Networking options* I need to enable 
  
  * IP: ARP daemon support
  * IP: TCP suncookie support
  * IP: AH transformation
  * IP: ESP tranformation
  * IP: IPComp transformation
  * IP: IPsec transport mode 
  * IP: IPsec tunnel mode
  * IP: IPsec BEET mode

