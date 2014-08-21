class mha_manager {

  class { 'base': stage => 'first' }

  include ::percona::client
  include ::percona::shared

  include ::mha::manager

  ::mha::manager::app { 'app1':
    user          => hiera('mha::user'),
    password      => hiera('mha::password'),
    repl_user     => hiera('mha::repl_user'),
    repl_password => hiera('mha::repl_password'),
    nodes         => hiera('mha::nodes'),
    manage_daemon => true,
  }

}
