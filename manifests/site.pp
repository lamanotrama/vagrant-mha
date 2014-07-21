node 'manager001.mha.dev' {
  include mha_manager
}

node 'node001.mha.dev' {
  $server_id=1
  include mha_node::master
}

node 'node002.mha.dev' {
  $server_id=2
  include mha_node::slave
}

node 'node003.mha.dev' {
  $server_id=3
  include mha_node::slave
}
