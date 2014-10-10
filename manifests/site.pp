import 'web.pp'
import  'php.pp'
import  'packages.pp'
import  'webssl.pp'

node 'slave.test.net' {
include webserver::php
include webserver::testsite
include webserver::ssltestsite
include magento 
include packages


}
