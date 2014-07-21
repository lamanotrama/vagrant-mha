class mha_manager {

  class { 'base': stage => 'first' }

  include ::percona::client
  include ::percona::shared

  include ::mha::ssh_keys
  include ::mha::manager

}
