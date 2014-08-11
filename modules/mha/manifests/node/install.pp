class mha::node::install {

  $node_version = '0.54-0'
  $suffix = mha_pkg_suffix()

  package { 'perl-DBD-MySQL':
    require => Package['MySQL-Shared'],
  }

  package {'mha4mysql-node':
    ensure   => installed,
    provider => rpm,
    source   => "https://mysql-master-ha.googlecode.com/files/mha4mysql-node-${node_version}${suffix}",
    require  => Package['perl-DBD-MySQL'],
  }

}
