class lamp {
    package { 'httpd':
        ensure => 'present',
    }
 
    package { 'php5-common':
        ensure => 'present',
    }
 
    # Update this to use your respective time zone value
    exec { 'php_config':
        command => '/bin/sed -i "s/^;date.timezone =/date.timezone = \'America\/Chicago\'/g" /etc/php.ini',
        require => Package['php5-common'],
    }
 
    service { 'httpd':
        ensure => 'running',
        enable => true,
        hasrestart => true,
        hasstatus => true,
        subscribe => Package['httpd', 'php'],
    }
 
    # Drupal requirements
    package { ['php-pdo', 'php-mysql', 'php-xml', 'php-gd', 'php-mbstring']:
        ensure => 'present',
        require => Package['php'],
    }
 
    package { 'mysql-server':
        ensure => 'present',
    }
 
    service { 'mysqld':
        ensure => 'running',
        enable => true,
        hasrestart => true,
        hasstatus => true,
        subscribe => Package['mysql-server'],
    }
 
    # Equivalent to /usr/bin/mysql_secure_installation without providing or setting a password
    exec { 'mysql_secure_installation':
        command => '/usr/bin/mysql -uroot -e "DELETE FROM mysql.user WHERE User=\'\'; DELETE FROM mysql.user WHERE User=\'root\' AND Host NOT IN (\'localhost\', \'127.0.0.1\', \'::1\'); DROP DATABASE IF EXISTS test; FLUSH PRIVILEGES;" mysql',
        require => Service['mysqld'],
    }

}
 
