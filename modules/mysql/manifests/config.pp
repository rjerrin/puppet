class mysql::config () inherits ::mysql::params
{
  file { 'confdir':
    name   => $::mysql::params::conf_dir,
    ensure => 'directory',
  }

  file  { 'conffile' :
  name   => $::mysql::params::confg_file,
  ensure => 'present',
  source =>  'puppet:///modules/mysql/my.cnf'
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
