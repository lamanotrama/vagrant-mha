class ntp (
  $servers = ['0.rhel.pool.ntp.org', '1.rhel.pool.ntp.org', '2.rhel.pool.ntp.org']
) {

  include ntp::install
  include ntp::config
  include ntp::service

     Class['ntp::install']
  -> Class['ntp::config']
  ~> Class['ntp::service']

}
