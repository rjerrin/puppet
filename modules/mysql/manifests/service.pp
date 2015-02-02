class mysql::service  ( ) inherits ::mysql::params {  

service { 'mysql':
  name   => $::mysql::params::service_name,
  ensure => running
}
}
