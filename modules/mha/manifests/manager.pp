class mha::manager (
  $version      = $mha::params::manager_version,
  $node_version = $mha::params::node_version
) inherits mha::params {

  include mha::manager::install
  include mha::manager::script

}
