class mha::node {

  class { 'mha::node::install': }
  -> class { 'mha::node::grants': }

  Service['mysql']
  -> Class['mha::node::grants']

}
