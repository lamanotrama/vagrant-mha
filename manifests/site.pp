stage { 'first': }
stage { 'last': }

Stage['first']
-> Stage['main']
-> Stage['last']

node 'manager001.mha.dev' {
  include mha_manager
}

node 'node001.mha.dev' {
  $server_id = 1
  include mha_node
}

node 'node002.mha.dev' {
  $server_id = 2
  include mha_node

  # mater_hostは本来不定なので、本番では不要
  class { 'mha_node::start_slave':
    master  => '192.168.80.2',
    require => Class['mha_node'],
  }
}

node 'node003.mha.dev' {
  $server_id = 3
  include mha_node

  class { 'mha_node::start_slave':
    master  => '192.168.80.2',
    require => Class['mha_node'],
  }
}
