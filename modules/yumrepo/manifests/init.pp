class yumrepo {

  yumrepo {
    'epel':
      name       => "epel",
      descr      => 'epel repo',
      mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch',
      enabled    => 1,
      priority   => 10,
      gpgcheck   => 0;
  }

}
