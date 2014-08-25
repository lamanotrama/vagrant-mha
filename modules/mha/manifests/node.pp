class mha::node (
  $version = $mha::params::node_version,

  $user          = $mha::params::user,
  $password      = $mha::params::password,

  $repl_user     = $mha::params::repl_user,
  $repl_password = $mha::params::repl_password,

  $nodes,
  $manager,

  $ssh = $mha::params::ssh,
) inherits mha::params {

  class { 'mha::node::install': version => $version }
  -> class { 'mha::node::grants': }

  # if puppetlabs-mysql is used, and mysql::server class is included with service_manage parameter(default true)
  # ref https://github.com/puppetlabs/puppetlabs-mysql/blob/master/manifests/server/service.pp#L10
  if $mysql::server::real_service_manage {
    $service_name = $mysql::server::service_name
  } else {
    $service_name = 'mysql'
  }

  Service[$service_name]
  -> Class['mha::node::grants']

  create_resources(mha::ssh_keys, { "mha::node" => $ssh } )

}
