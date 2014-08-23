define mha::ssh_keys (
  $key_path,
  $user,
  $private_key,
  $public_key,
) {

  if !defined(File[$key_path]) {
    file { $key_path:
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      source  => $private_key,
      require => Ssh_authorized_key["mha_ssh_pub ${key_path}"]
    }

    ssh_authorized_key { "mha_ssh_pub ${key_path}":
      ensure => present,
      user   => 'root',
      type   => 'ssh-rsa',
      key    => $public_key,
    }
  }

}
