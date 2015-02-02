class mysql::config 
(
  $port = $::mysql::params::service_port,
  $key_buffer = $::mysql::params::key_buffer,
  $max_allowed_packet = $::mysql::params::max_allowed_packet,
  $thread_stack = $::mysql::params::thread_stack,
  $thread_cache_size = $::mysql::params::thread_cache_size,
  $myisam_recover = $::mysql::params::myisam_recover,
  $query_cache_limit =  $::mysql::params::query_cache_limit,
  $log_file  =  $::mysql::params::log_error,
  $expire_logs_days =  $::mysql::params::expire_logs_days,
  $max_binlog_size =   $::mysql::params::max_binlog_size,

) inherits ::mysql::params
{
  file { 'confdir':
    name   => $::mysql::params::conf_dir,
    ensure => 'directory',
  }

  file  { 'conffile' :
  name    => $::mysql::params::confg_file,
  ensure  => 'present',
  notify  => Class['mysql::service'],
  content => template('mysql/my.cnf.erb'),
  }


  file { $::mysql::params::basedir :
    ensure => directory
  }
  file { $::mysql::params::datadir :
    ensure => directory,
    owner  => 'mysql',
    group  => 'mysql',
    mode   => 700
  }
  file { $::mysql::params::lc_messages_dir:
    ensure => directory
  }
}
