class jabber {
  $jabber_home = "/opt/jabber"

package { "ejabberd":
  ensure => "present",
}

file { "/etc/ejabberd/ejabberd.cfg":
  mode => "766",
  owner => "root",
  group => "root",
  source => "puppet:///modules/jabber/ejabberd.cfg",
}

service { "ejabberd":
  enable => true,
}

}
