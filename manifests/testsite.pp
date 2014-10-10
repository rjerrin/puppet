include nginx
nginx::file { 'www.example.com.conf':
  content => template('test/www.example.com.conf.erb'),
}
