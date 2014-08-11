class mha::node (
  $version = $mha::params::node_version,

  $user = 'root',
  $password,

  $repl_user = 'repl',
  $repl_password,

  $nodes,
  $manager,
) inherits mha::params {

  class { 'mha::node::install': version => $version }
  -> class { 'mha::node::grants': }

  Service['mysql']
  -> Class['mha::node::grants']

}
