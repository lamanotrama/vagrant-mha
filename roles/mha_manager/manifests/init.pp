class mha_manager {

  include ::yumrepo
  include ::myhosts
  include ::mha::ssh_keys
  include ::mha::manager

  pacage { 'mysql':
    ensure => installed,
  }

}
