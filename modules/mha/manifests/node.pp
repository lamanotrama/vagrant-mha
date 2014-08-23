class mha::node (
  $version = $mha::params::node_version,

  $user = 'root',
  $password,

  $repl_user = 'repl',
  $repl_password,

  $nodes,
  $manager,

  $ssh = { 'key_path' => '/root/.ssh/id_rsa' },
) inherits mha::params {

  class { 'mha::node::install': version => $version }
  -> class { 'mha::node::grants': }

  Service['mysql']
  -> Class['mha::node::grants']

  create_resources(mha::ssh_keys, { "mha::node" => $ssh } )

}
