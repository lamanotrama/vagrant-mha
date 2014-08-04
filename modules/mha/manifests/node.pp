class mha::node (
  $user = 'root',
  $password,

  $repl_user = 'repl',
  $repl_password,

  $nodes,
  $manager,
) {

  class { 'mha::node::install': }
  -> class { 'mha::node::grants': }

  Service['mysql']
  -> Class['mha::node::grants']

}
