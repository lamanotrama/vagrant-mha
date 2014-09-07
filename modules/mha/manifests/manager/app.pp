define mha::manager::app (
  $nodes         = [],
  $user          = $mha::params::user,
  $password      = $mha::params::password,
  $repl_user     = $mha::params::repl_user,
  $repl_password = $mha::params::repl_password,
  $ssh           = $mha::params::ssh,
  $default       = {},
  $manage_daemon = false
) {

  include mha::params

  $config = "/etc/masterha/${name}.cnf"

  ensure_resource('file', '/etc/masterha', {
    ensure => directory,
    mode   => 755,
  })

  file { $config:
    content => template('mha/etc/masterha/app.cnf'),
    mode    => 600,
    owner   => 'root',
    group   => 'root',
  }

  create_resources(mha::ssh_keys, { "mha::app::${name}" => $ssh })

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

