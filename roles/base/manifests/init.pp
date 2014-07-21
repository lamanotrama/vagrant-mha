class base {

  include ::yumrepo
  include ::myhosts
  include ::iptables::disable
  include ::selinux::disable

}

