class iptables::disable {

  service { 'iptables':
    ensure => stopped,
    enable => false,
  }

  file { '/etc/sysconfig/iptables':
    ensure => absent,
  }

}

