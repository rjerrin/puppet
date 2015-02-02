class mysql::params {
  $conf_dir = '/etc/mysql/conf.d'
  $confg_file = '/etc/mysql/my.cnf'
  $daemon_user = 'mysql'
  $service_name = 'mysql'
  $package_name = 'mysql-server'
  $service_port = '3306'
  $service_pid   = '/var/run/mysqld/mysqld.pid'
  $service_socket  = '/var/run/mysqld/mysqld.sock'
  $basedir         = '/usr'
  $datadir         = '/var/lib/mysql'
  $tmpdir          = '/tmp'
  $lc_messages_dir = '/usr/share/mysql'
  $key_buffer = '16M'
  $max_allowed_packet = '16M'
  $thread_stack = '192K'
  $thread_cache_size = '8'
  $myisam_recover = 'BACKUP'
  $query_cache_limit  = '1M'
  $query_cache_size    = '16M'
  $log_error = '/var/log/mysql/error.log'
  $expire_logs_days        = '10'
  $max_binlog_size         = '100M'

}


