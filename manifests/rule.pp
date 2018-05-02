#
define net::rule (
  String $iprule              = $name,
  Enum['inet','inet6'] $family = 'inet',
  String $order                = '20',
) {
  include net
  if $family == 'inet' {
    $target = $net::rules_file
  } else {
    $target = $net::rules6_file
  }

  concat::fragment { $name:
    target  => $target,
    order   => $order,
    content => "${iprule}\n",
  }
}
