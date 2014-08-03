define mysql::database($ensure) {

  if mysql_exists() {
    mysql_database { $name:
      ensure => $ensure,
      # require => File["/root/.my.cnf"],
    }
  }

}
