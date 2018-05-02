# Puppet net

Manages ip routes/rules and make them persisent (load on boot).

## Requirements
* A distro with ifupdown support

## Usage

To install custom routes and rules:

```puppet
  net::route { '1.1.1.1 via 192.0.2.1': }

  net::route { '2606:4700:4700::1111 via 2001:f00:bad::1':
    family => 'inet6',
  }
```

Or:

```puppet
  net::route { 'alt-route':
    iproute => '1.1.1.1 via 192.0.2.1',
  }

  net::route { 'alt-route6':
    iproute => '2606:4700:4700::1111 via 2001:f00:bad::1',
    family  => 'inet6',
  }
```

To install custom rules:

```puppet
  net::rule { 'from 2001:f00:bad::/64 iif eth0 lookup isp-b':
    family => 'inet6',
  }
```
Or:

```puppet
  net::rule { 'isp-b':
    iprule => 'from 2001:f00:bad::/64 iif eth0 lookup isp-b',
    family => 'inet6',
  }
```

## Note

To setup other network parameters like interface configurations, additional routing
tables, etc, we recommend using the [example42/puppet-network module](https://forge.puppet.com/example42/network).
