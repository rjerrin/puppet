class mysql::service  ( ) inherits ::mysql::params {  

service { 'mysql':
  name   => 'mysql',
  ensure => running
}
}
