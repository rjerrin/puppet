class webserver::php {
	class { 'apache':
	 mpm_module 	=> 'prefork',
	 default_mods   => false,
      	 default_confd_files => false,
	 default_vhost => false,
	}
	include ::apache::mod::php
	include ::apache::mod::ssl
	$modules = [ "php5-mysql", "php5-gd","php5-mcrypt"]
	package {  $modules : ensure => "installed"  }
}

class webserver::testsite { 
	apache::vhost { 'slave.test.net' :
	port => '80',
	docroot => '/var/www/new',
        directoryindex => ['index.html index.htm index.php'],
	directories => [
		    {
        path => '/var/www/new',
        options => ['Indexes', 'FollowSymLinks', 'MultiViews'],
        allow_override => [ 'None' ],
        order => 'Allow,Deny',
}
]
}
	file { "/var/www/new/index.php" :
		ensure => present,
		content => "<?php phpinfo();?>",
	}

}



	



