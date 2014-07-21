class mha::node::package {
  package {
    'mha4mysql-node':
      ensure   => installed,
      provider => rpm,
      require  => Package['perl-DBD-MySQL'],
      source   => "/vagrant/mha4mysql-node-0.54-0.el6.noarch.rpm",
  }

  package {
    'perl-DBD-MySQL':
      ensure   => latest,
      require  => Class['Percona::Shared'],
  }
}
