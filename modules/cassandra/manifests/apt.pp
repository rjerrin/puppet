class cassandra::apt 
{
	exec { 'curl' :
        command => '/usr/bin/curl -L http://debian.datastax.com/debian/repo_key | /usr/bin/sudo /usr/bin/apt-key add  - '
}
	exec { 'update': 
	command => '/usr/bin/apt-get -y update'
}
	
   
   class { 'java':
	  distribution => 'jre',
	}

}

