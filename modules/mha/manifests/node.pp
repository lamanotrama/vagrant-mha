class mha::node {

  include mha::node::package
  include mha::node::grants

  Service['mysql']
  -> Class['mha::node::grants']

}
