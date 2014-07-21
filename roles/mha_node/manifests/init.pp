class mha_node {

  include ::yumrepo
  include ::percona::repository
  include ::myhosts
  include ::mha::ssh_keys
  include ::percona::server
  include ::percona::shared
  include ::mha::node

  Class['::Percona::Shared']
  -> Class['::Percona::Server']
  -> Class['::Mha::Node']

}
