# @api private
# This class handles net params. Avoid modifying private classes.
class net::params {
  $base_dir            = '/etc/network'
  $script_dir          = "${base_dir}/if-up.d"
  $routes_script_file  = "${script_dir}/routes"
  $routes6_script_file = "${script_dir}/routes6"
  $rules_script_file   = "${script_dir}/rules"
  $rules6_script_file  = "${script_dir}/rules6"
  $routes_file         = "${base_dir}/routes"
  $routes6_file        = "${base_dir}/routes6"
  $rules_file          = "${base_dir}/rules"
  $rules6_file         = "${base_dir}/rules6"
}
