class { 'test' :

class { '::nginx':
  # Fix for "upstream sent too big header ..." errors
  fastcgi_buffers     => '8 8k',
  fastcgi_buffer_size => '8k',
  upstream => {
    fpmbackend => 'server unix:/var/run/php-fpm-www.sock',
  },
}

nginx::file { 'www.example.com.conf':
  content => template('mymodule/www.example.com.conf.erb'),
}

file { "/var/www/www.example.com":
    ensure => "directory",
    owner  => "www-data",
    group  => "www-data",
    mode   => 750,
}

}
