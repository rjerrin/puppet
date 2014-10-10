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
	apache::vhost { 'slave.test.net non-ssl' :
	servername => 'slave.test.net',
	port => '80',
	docroot => '/var/www/new',
	 rewrites   => [
    {
      comment      => 'redirect non-SSL traffic to SSL site',
      rewrite_cond => ['%{HTTPS} off'],
      rewrite_rule => ['(.*) https://%{HTTPS_HOST}%{REQUEST_URI}'],
    }
  ]
}
}


	



