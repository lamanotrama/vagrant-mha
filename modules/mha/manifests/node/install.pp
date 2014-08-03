class mha::node::install {

  $node_version = '0.54-0'

  package { 'perl-DBD-MySQL':
    require => Package['MySQL-Shared'],
  }

  package {'mha4mysql-node':
    ensure   => installed,
    provider => rpm,
    source   => "https://mysql-master-ha.googlecode.com/files/mha4mysql-node-${node_version}.el6.noarch.rpm",
    require  => Package['perl-DBD-MySQL'],
  }

}
