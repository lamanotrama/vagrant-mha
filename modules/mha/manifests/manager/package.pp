class mha::manager::package {

  $pack = [
    'perl-Config-Tiny',
    'perl-Log-Dispatch',
    'perl-Parallel-ForkManager',
    'perl-Time-HiRes',
  ]

  package { $pack:
    ensure  => 'installed',
  }

  package { 'mha4mysql-manager':
    ensure   => installed,
    provider => rpm,
    source   => '/vagrant/mha4mysql-manager-0.54-0.el6.noarch.rpm',
    require  => Package[$pack],
  }

  file {
    '/usr/lib64/perl5/vendor_perl/MHA':
      ensure  => link,
      target  => '/usr/lib/perl5/vendor_perl/MHA/',
      require => Package['mha4mysql-manager'],
  }

}
