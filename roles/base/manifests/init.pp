class base {

  contain '::repo_epel'
  contain '::mysql_yumrepo'
  contain '::percona_repo'
  contain '::iptables::disable'
  contain '::selinux::disable'
  contain '::ntp'

  Yumrepo <| |> -> Package <| |>

}

