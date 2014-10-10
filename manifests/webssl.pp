class webserver::ssltestsite {
        apache::vhost { 'slave.test.net ssl' :
	servername => 'slave.test.net',
        ssl  => true,
	port => 443,
        ssl_cert => '/etc/ssl/test.cert',
        ssl_key  => '/etc/ssl/test.key',
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
        file { "/etc/ssl/test.cert":
                ensure => present,
                source => "puppet://$::server/modules/apache/test.cert",
        }

              file { "/etc/ssl/test.key":
                ensure => present,
                source  => "puppet://$::server/modules/apache/test.key",
        }



}


