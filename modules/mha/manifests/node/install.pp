class mha::node::install (
  $version
) {

  ensure_packages('perl-DBD-MySQL')

  package {'mha4mysql-node':
    ensure   => installed,
    provider => rpm,
    source   => "https://mysql-master-ha.googlecode.com/files/mha4mysql-node-${version}${::mha_pkg_suffix}",
    require  => Package['perl-DBD-MySQL'],
  }

}
