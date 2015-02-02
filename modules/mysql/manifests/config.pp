class mysql::config ($port = $::mysql::params::service_port  ) inherits ::mysql::params
{
  file { 'confdir':
    name   => $::mysql::params::conf_dir,
    ensure => 'directory',
  }

  file  { 'conffile' :
  name    => $::mysql::params::confg_file,
  ensure  => 'present',
  notify  => Class['mysql::service'],
  content => template('mysql/my.cnf.erb')
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
