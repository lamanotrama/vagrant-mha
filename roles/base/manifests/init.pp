class base {

  include ::repo_epel
  include ::mysql_yumrepo
  include ::percona_repo
  include ::iptables::disable
  include ::selinux::disable
  include ::ntp

  Yumrepo <| |> -> Package <| |>

}

