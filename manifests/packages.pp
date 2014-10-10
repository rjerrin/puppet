class packages {

	$packages = [ "bash", "vim"]
	package {  $packages : ensure => "latest"  }


}

