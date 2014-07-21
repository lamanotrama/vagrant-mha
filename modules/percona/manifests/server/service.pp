class percona::server::service (
  $ensure = 'running'
) {

  service { 'mysql':
    ensure  => $ensure,
    enable  => true,
    require => Package['MySQL-server'],
  }

}
