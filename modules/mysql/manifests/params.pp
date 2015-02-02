class mysql::params {
  $conf_dir = '/etc/mysql/conf.d'
  $confg_file = '/etc/mysql/conf.d/my.cnf'
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
}


