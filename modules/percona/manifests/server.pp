class percona::server ($ensure='running') {

  include percona::server::packages
  include percona::server::service
  include percona::server::config

  Class['percona::repository']
  -> Class['percona::server::packages']
  -> Class ['percona::server::config']
  -> Class['percona::server::service']

}
