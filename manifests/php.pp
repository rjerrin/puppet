class magento {
	php::ini { '/etc/php5/apache2/php.ini' :
		  memory_limit => '512M',
}
         exec { "/etc/init.d/apache2 reload":
	         subscribe => File["/etc/php5/apache2/php.ini"],
		 refreshonly => true,
}

}

