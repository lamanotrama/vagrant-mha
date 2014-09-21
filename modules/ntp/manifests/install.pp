class ntp::install {

  package { 'ntp':
    ensure => present,
  }

  if $::operatingsystemrelease >= 6 {
    package { 'ntpdate':
     ensure => present,
    }
  }

}
