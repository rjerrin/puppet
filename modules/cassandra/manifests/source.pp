class cassandra::source 
{
	file { 'cassandra.sources.list':
	    path => '/etc/apt/sources.list.d/cassandra.sources.list' ,
	    ensure => 'present',
	    content => 'deb http://debian.datastax.com/community stable main'
	  }

}
	   
	 
