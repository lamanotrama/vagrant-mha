class mha::params {

  $manager_version = '0.55-0'
  $node_version    = '0.54-0'

  $user     = 'root'
  $password = ''

  $repl_user     = 'repl'
  $repl_password = ''

  $ssh = {
    user        => root,
    key_path    => '/root/.ssh/id_rsa_mha',
    private_key => 'puppet:///modules/mha/id_rsa',
    public_key  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEArtdvtkbHIW0GOUcDSBJtK0ql14YMLGxyvROqWUzH89UhMzUoMyViFMYdKDJJ/99F/vTiMtTl4lAyw93UVTMAyI1wfDlUjv9CDEWshuFUW6FPRSYJq+zo9GXrLZK84UJItjngP5Zdxuyd38chSPfnBG5scrlsgwVZmQEU9wStWhYewU/DKvXmMvX7b2nzmvaaTKdl6tAOq5ZFC51DVaYk1dpNW8LpjL617Gfj69z5ot+zexXZgIIJapjmpyaqSeGg834W9YaUFtCGXnKIrOQuseiRz4TE0wLJ5V+4VqQM6CDrN90QX23WTXLLkkvMXYg97rbPriO8+T5y7t9ugYx/Qw==',
  }

  $purge_relay_logs_schedule = {
    minute => 10,
    hour   => '2-23/6', # 2,8,14,20
  }

}

