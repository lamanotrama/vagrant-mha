class base {

  include ::repo_epel
  include ::mysql_yumrepo
  include ::iptables::disable
  include ::selinux::disable

}

