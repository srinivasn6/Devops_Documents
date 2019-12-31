class apache () {

$doc_root = "/var/www/html"

#exec { 'yum update':
# command => '/bin/yum update'
#}

package { 'httpd':
 ensure  => "installed",
# require => Exec['yum update']
}

file { [ $doc_root ]:
 ensure => "directory",
 path => $doc_root,
 owner => "root",
 group => "root",
 mode => '644',
 require => Package['httpd'],
}

file { [ "$doc_root/index.html" ]:
   ensure => "present",
   content => "Hello World!!!!!!!",
   owner => 'root',
   group => 'root',
   mode => '655',
#   source => "/root/puppet_exercise/index.html",
   require => File[$doc_root]
}

service { 'httpd':
   ensure => running,
   enable => true
}
}
