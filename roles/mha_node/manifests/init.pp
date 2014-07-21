class mha_node {

  class { 'base': stage => 'first' }

  include ::percona::server
  include ::percona::client
  include ::percona::shared

  include ::mha::ssh_keys
  include ::mha::node

  Class['::Percona::Shared']
  -> Class['::Percona::Server']
  -> Class['::Mha::Node']

}
