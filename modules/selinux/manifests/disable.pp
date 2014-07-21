class selinux::disable {

  file { '/etc/selinux/config':
    content => "SELINUX=disabled\n",
    mode    => 644,
  }

  exec { 'disable selinux':
    command => '/usr/sbin/setenforce 0',
    onlyif  => '/usr/sbin/selinuxenabled',
  }

}

