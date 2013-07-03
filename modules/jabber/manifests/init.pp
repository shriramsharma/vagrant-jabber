class jabber {
  $jabber_home = "/opt/jabber"

package { "ejabberd":
  ensure => "present",
}

file { "/etc/ejabberd/ejabberd.cfg":
  mode => "0640",
  owner => "root",
  group => "ejabberd",
  source => "puppet:///modules/jabber/ejabberd.cfg",
}

service { "ejabberd":
  enable => true,
  ensure => running,
  hasstatus => true
}

exec { "setup_pwd":
  command => "/usr/sbin/ejabberdctl register chadmin localhost test",
  path => $path,
}

}
