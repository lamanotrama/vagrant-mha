class mha_node::vip {

  $vip = hiera('mha::vip')

  if ! $::ipaddress_eth1_0 {
    exec { 'attach vip':
      command => "/sbin/ifconfig eth1:0 ${vip} netmask ${::netmask_eth1} up",
    }
  }

}

