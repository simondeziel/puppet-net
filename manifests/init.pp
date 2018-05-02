#
class net (
  Stdlib::AbsolutePath $base_dir            = $net::params::base_dir,
  Stdlib::AbsolutePath $script_dir          = $net::params::script_dir,
  Stdlib::AbsolutePath $routes_script_file  = $net::params::routes_script_file,
  Stdlib::AbsolutePath $routes6_script_file = $net::params::routes6_script_file,
  Stdlib::AbsolutePath $rules_script_file   = $net::params::rules_script_file,
  Stdlib::AbsolutePath $rules5_script_file  = $net::params::rules6_script_file,
  Stdlib::AbsolutePath $routes_file         = $net::params::routes_file,
  Stdlib::AbsolutePath $routes6_file        = $net::params::routes6_file,
  Stdlib::AbsolutePath $rules_file          = $net::params::rules_file,
  Stdlib::AbsolutePath $rules6_file         = $net::params::rules6_file,
) inherits net::params {

  # inet routes
  file { $routes_script_file:
    mode    => '0755',
    content => epp('net/up-script.epp', { 'family' => 'inet', 'subcommand' => 'route', 'data' => $routes_file }),
    notify  => Exec['net: apply routes'],
  }
  concat { $routes_file:
    notify => Exec['net: apply routes'],
  }
  concat::fragment { "Puppet header ${routes_file}":
    target  => $routes_file,
    order   => '00',
    content => "# File managed by Puppet\n",
  }
  exec { 'net: apply routes':
    environment => ['IFACE=--all','MODE=start','ADDRFAM=inet'],
    command     => $routes_script_file,
    require     => [Concat[$routes_file],File[$routes_script_file]],
    refreshonly => true,
  }

  # inet6 routes
  file { $routes6_script_file:
    mode    => '0755',
    content => epp('net/up-script.epp', { 'family' => 'inet6', 'subcommand' => 'route', 'data' => $routes6_file }),
    notify  => Exec['net: apply routes6'],
  }
  concat { $routes6_file:
    notify => Exec['net: apply routes6'],
  }
  concat::fragment { "Puppet header ${routes6_file}":
    target  => $routes6_file,
    order   => '00',
    content => "# File managed by Puppet\n",
  }
  exec { 'net: apply routes6':
    environment => ['IFACE=--all','MODE=start','ADDRFAM=inet6'],
    command     => $routes6_script_file,
    require     => [Concat[$routes6_file],File[$routes6_script_file]],
    refreshonly => true,
  }

  # inet rules
  file { $rules_script_file:
    mode    => '0755',
    content => epp('net/up-script.epp', { 'family' => 'inet', 'subcommand' => 'rule', 'data' => $rules_file }),
    notify  => Exec['net: apply rules'],
  }
  concat { $rules_file:
    notify => Exec['net: apply rules'],
  }
  concat::fragment { "Puppet header ${rules_file}":
    target  => $rules_file,
    order   => '00',
    content => "# File managed by Puppet\n",
  }
  exec { 'net: apply rules':
    environment => ['IFACE=--all','MODE=start','ADDRFAM=inet'],
    command     => $rules_script_file,
    require     => [Concat[$rules_file],File[$rules_script_file]],
    refreshonly => true,
  }

  # inet6 rules
  file { $rules6_script_file:
    mode    => '0755',
    content => epp('net/up-script.epp', { 'family' => 'inet6', 'subcommand' => 'rule', 'data' => $rules6_file }),
    notify  => Exec['net: apply rules6'],
  }
  concat { $rules6_file:
    notify => Exec['net: apply rules6'],
  }
  concat::fragment { "Puppet header ${rules6_file}":
    target  => $rules6_file,
    order   => '00',
    content => "# File managed by Puppet\n",
  }
  exec { 'net: apply rules6':
    environment => ['IFACE=--all','MODE=start','ADDRFAM=inet6'],
    command     => $rules6_script_file,
    require     => [Concat[$rules6_file],File[$rules6_script_file]],
    refreshonly => true,
  }
}
