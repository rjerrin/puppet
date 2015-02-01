class cassandra::package {

    $packages = [ "cassandra", "dsc21" ]
    package { $packages : ensure => "installed" }
}
