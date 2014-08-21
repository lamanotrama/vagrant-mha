class base {

  include ::yumrepo
  include ::iptables::disable
  include ::selinux::disable

}

