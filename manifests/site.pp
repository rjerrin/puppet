import 'web.pp'
import  'php.pp'
import  'packages.pp'

node 'slave.test.net' {
include webserver::php
include webserver::testsite
include magento 
include packages


}
