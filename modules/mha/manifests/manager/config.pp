class mha::manager::config {

  file {
    '/etc/app1.cnf':
      source  => 'puppet:///modules/mha/app1.cnf'
  }
}
