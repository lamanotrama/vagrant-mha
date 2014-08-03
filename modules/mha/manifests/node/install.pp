class mha::node::install {

  $node_version = '0.54-0'

  package {
    'mha4mysql-node':
      ensure   => installed,
      provider => rpm,
      require  => Package['perl-DBD-MySQL'],
      source   => "https://mysql-master-ha.googlecode.com/files/mha4mysql-node-${node_version}.el6.noarch.rpm",
  }

  package {
    'perl-DBD-MySQL':
      ensure  => latest,
      require => Package['MySQL-Shared'],
  }

}
