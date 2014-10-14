import 'web.pp'
import  'php.pp'
import  'packages.pp'
import  'webssl.pp'
import  'tomcat.pp'
import   'java.pp'

node 'slave.test.net' {
include webserver::php
include webserver::testsite
include webserver::ssltestsite
include webserver::tomcat 
include magento 
include packages
include postfix



}


node 'master.test.net' {

   package { 'apache2' :
	ensure => purged,
}



}

