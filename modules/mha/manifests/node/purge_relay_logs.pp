class mha::node::purge_relay_logs {

  # ref: https://code.google.com/p/mysql-master-ha/wiki/Requirements#Schedule_to_run_purge_relay_logs_script

  $job = {
    'purge relay logs for MHA' => {
      user    => 'root',
      command => "sleep \$((\$RANDOM\\%60)) && /usr/bin/purge_relay_logs --user=${mha::node::user} --password=${mha::node::password} --disable_relay_log_purge >> /var/log/masterha/purge_relay_logs.log 2>&1",
    }
  }

  $default = $mha::node::purge_relay_logs_schedule

  create_resources(cron, $job, $default)

}

