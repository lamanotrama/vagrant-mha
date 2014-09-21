node 'manager001.mha.dev' {
  include base
  include mha_manager
}

node 'node001.mha.dev' {
  $server_id = 1
  include base
  include mha_node
  include mha_node::vip
}

node 'node002.mha.dev' {
  $server_id = 2
  include base
  include mha_node

  # mater_hostは本来不定なので、本番では不要
  class { 'mha_node::start_slave':
    master  => '192.168.80.2',
    require => Class['mha_node'],
  }
}

node 'node003.mha.dev' {
  $server_id = 3
  include base
  include mha_node

  class { 'mha_node::start_slave':
    master  => '192.168.80.2',
    require => Class['mha_node'],
  }
}
