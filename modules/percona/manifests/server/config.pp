class percona::server::config {

  file { '/etc/my.cnf':
    ensure  => present,
    content => template('percona/server/my.cnf.erb'),
    notify  => Service['mysql'],
  }

}
