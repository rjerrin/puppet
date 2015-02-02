class mysql::install ( ) inherits ::mysql::params {
  $package = $::mysql::params::package_name
  package { $package :
    ensure =>  'installed'
  }

}

