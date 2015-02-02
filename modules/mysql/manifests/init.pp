# == Class: mysql
#
# Full description of class mysql here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { mysql:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class mysql ( 
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
) inherits ::mysql::params  {
include mysql::install

class { ::mysql::config: 
  port               => $port,
  key_buffer         => $key_buffer,
  max_allowed_packet => $max_allowed_packet,
  thread_stack       => $thread_stack,
  thread_cache_size  => $thread_cache_size,
  myisam_recover     => $myisam_recover,
  query_cache_limit  => $query_cache_limit,
  log_file           => $log_file,
  expire_logs_days   => $expire_log_days,
  max_binlog_size    => $max_binlog_size,

}

include mysql::service

Class['mysql::install'] -> Class['mysql::config'] -> Class ['mysql::service']

}
