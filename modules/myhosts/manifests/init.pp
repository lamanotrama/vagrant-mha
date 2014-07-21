class myhosts {
  host {
    'percona1':
      ensure  => 'present',
      ip      => '192.168.80.2';
    'percona2':
      ensure  => 'present',
      ip      => '192.168.80.3';
    'percona3':
      ensure  => 'present',
      ip      => '192.168.80.4';
  }
}
