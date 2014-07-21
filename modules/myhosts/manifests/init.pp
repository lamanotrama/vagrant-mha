class myhosts {

  host {
    'manager001.mha.lan':
      ensure  => 'present',
      ip      => '192.168.80.100';

    'node001.mha.lan':
      ensure  => 'present',
      ip      => '192.168.80.2';

    'node002.mha.lan':
      ensure  => 'present',
      ip      => '192.168.80.3';

    'node003.mha.lan':
      ensure  => 'present',
      ip      => '192.168.80.4';
  }

}
