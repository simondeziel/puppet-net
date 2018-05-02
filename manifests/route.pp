#
define net::route (
  String $iproute              = $name,
  Enum['inet','inet6'] $family = 'inet',
  String $order                = '20',
) {
  include net
  if $family == 'inet' {
    if $iproute !~ /^[0-9]{1,3}\.[0-9]+/ {
      fail('Invalid iproute param for net::route')
    }
    $target = $net::routes_file
  } else {
    if $iproute !~ /^[0-9a-fA-F]{1,4}:[0-9a-fA-F:]+/ {
      fail('Invalid iproute param for net::route')
    }
    $target = $net::routes6_file
  }

  concat::fragment { $name:
    target  => $target,
    order   => $order,
    content => "${iproute}\n",
  }
}
