class mha_node {

  class { 'base': stage => 'first' }

  include ::percona::server
  include ::percona::client
  include ::percona::shared

  class { '::mha::node':
    user          => hiera('mha::user'),
    password      => hiera('mha::password'),
    repl_user     => hiera('mha::repl_user'),
    repl_password => hiera('mha::repl_password'),
    manager       => hiera('mha::manager'),
    nodes         => hiera('mha::nodes'),
  }

  Class['::Percona::Shared']
  -> Class['::Percona::Server']
  -> Class['::Mha::Node']

}
