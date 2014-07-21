class mha::ssh_keys {

  ssh_authorized_key { 'mha_ssh_pub':
    ensure => present,
    user   => 'root',
    type   => 'ssh-rsa',
    key    => 'AAAAB3NzaC1yc2EAAAABIwAAAQEArtdvtkbHIW0GOUcDSBJtK0ql14YMLGxyvROqWUzH89UhMzUoMyViFMYdKDJJ/99F/vTiMtTl4lAyw93UVTMAyI1wfDlUjv9CDEWshuFUW6FPRSYJq+zo9GXrLZK84UJItjngP5Zdxuyd38chSPfnBG5scrlsgwVZmQEU9wStWhYewU/DKvXmMvX7b2nzmvaaTKdl6tAOq5ZFC51DVaYk1dpNW8LpjL617Gfj69z5ot+zexXZgIIJapjmpyaqSeGg834W9YaUFtCGXnKIrOQuseiRz4TE0wLJ5V+4VqQM6CDrN90QX23WTXLLkkvMXYg97rbPriO8+T5y7t9ugYx/Qw=='
  }

  file { '/root/.ssh/id_rsa':
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => 'puppet:///modules/mha/id_rsa',
    require => Ssh_authorized_key['mha_ssh_pub']
  }

}
