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

  Service['mysql']
  -> Class['mha::node::grants']

  create_resources(mha::ssh_keys, { "mha::node" => $ssh } )

}
