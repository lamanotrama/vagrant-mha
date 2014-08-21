define mha::ssh_keys (
  $key_path,
  $private_key = 'puppet:///modules/mha/id_rsa',
  $public_key  = 'AAAAB3NzaC1yc2EAAAABIwAAAQEArtdvtkbHIW0GOUcDSBJtK0ql14YMLGxyvROqWUzH89UhMzUoMyViFMYdKDJJ/99F/vTiMtTl4lAyw93UVTMAyI1wfDlUjv9CDEWshuFUW6FPRSYJq+zo9GXrLZK84UJItjngP5Zdxuyd38chSPfnBG5scrlsgwVZmQEU9wStWhYewU/DKvXmMvX7b2nzmvaaTKdl6tAOq5ZFC51DVaYk1dpNW8LpjL617Gfj69z5ot+zexXZgIIJapjmpyaqSeGg834W9YaUFtCGXnKIrOQuseiRz4TE0wLJ5V+4VqQM6CDrN90QX23WTXLLkkvMXYg97rbPriO8+T5y7t9ugYx/Qw==',
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
