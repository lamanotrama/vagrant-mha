node percona1 {

  $server_id=1

  include percona::repository
  include myhosts
  include mha::ssh_keys
  include mha::node
  include percona::server
  include percona::shared
  include mha::manager

        Class['Percona::Shared'] -> Class['Percona::Server'] -> Class['Mha::Node'] -> Class['Mha::Manager']
}

node percona2 {

  $server_id=2

  include percona::repository
  include myhosts
  include percona::server
  include mha::ssh_keys
  include mha::node
  include percona::shared
  include mha::node::slave

  Class['Percona::Shared'] -> Class['Percona::Server'] -> Class['Mha::Node']
}

node percona3 {

  $server_id=3

  include percona::repository
  include myhosts
  include percona::server
  include mha::ssh_keys
  include mha::node
  include percona::shared
  include mha::node::slave

  Class['Percona::Shared'] -> Class['Percona::Server'] -> Class['Mha::Node']
}

