class ntp::service {

  service { 'ntpd':
    ensure  => running,
    enable  => true,
  }

  if $::operatingsystemrelease >= 6 {
    service { 'ntpdate':
      ensure    => stopped,
      enable    => true,
      hasstatus => false,
      before    => Service['ntpd'],
    }
  }

  exec {
    'set system clock':
      command     => "/usr/sbin/ntpdate -u ${ntp::servers[0]}",
      refreshonly => true,
      notify      => Exec['set hw clock'];

    'set hw clock':
      command     => "/sbin/hwclock --systohc",
      refreshonly => true;
  }

}
