class mha::manager::install {

  $manager_version = '0.55-0'

  include mha::node::install

  $perl_pkgs = [
    'perl-Config-Tiny',
    'perl-Log-Dispatch',
    'perl-Parallel-ForkManager',
    'perl-Time-HiRes',
  ]

  package { $perl_pkgs:
    ensure  => 'installed',
  }

  package { 'mha4mysql-manager':
    ensure   => installed,
    provider => rpm,
    source   => "https://mysql-master-ha.googlecode.com/files/mha4mysql-manager-${manager_version}.el6.noarch.rpm",
    require  => [
      Package[$perl_pkgs],
      Class['mha::node::install'],
    ],
  }

  file {
    '/usr/lib64/perl5/vendor_perl/MHA':
      ensure  => link,
      target  => '/usr/lib/perl5/vendor_perl/MHA/',
      require => Package['mha4mysql-manager'],
  }

}
