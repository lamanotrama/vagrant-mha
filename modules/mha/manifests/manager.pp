class mha::manager {

  class { 'mha::manager::install': }
  -> class { 'mha::manager::config': }

}
