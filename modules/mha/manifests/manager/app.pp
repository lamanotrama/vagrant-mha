define mha::manager::app (
  $user = 'root',
  $password,

  $repl_user = 'repl',
  $repl_password,

  $nodes,

  $ssh = { 'key_path' => '/root/.ssh/id_rsa_mha' },
  $manage_daemon = false
) {

  $config = "/etc/masterha/${name}.cnf"

  if !defined('/etc/masterha') {
    file { '/etc/masterha':
      ensure => directory,
      mode   => 755,
    }
  }

  file { $config:
    content => template('mha/etc/masterha/app.cnf'),
    mode    => 600,
    owner   => 'root',
    group   => 'root',
  }

  create_resources(mha::ssh_keys, { "mha::app::${name}" => $ssh } )

  if $manage_daemon {
    include supervisor

    supervisor::program { "masterha_manager_${name}":
      ensure                 => present,
      enable                 => true,
      command                => "/usr/bin/masterha_manager --conf=${config}",
      autorestart            => true,
      user                   => 'root',
      group                  => 'root',
      stdout_logfile         => '/var/log/supervisor/%(program_name)s.log',
      stdout_logfile_maxsize => '50MB',
      stdout_logfile_backups => 10,
      redirect_stderr        => true,
      require                => Class['mha::manager'],
    }
  }

}

