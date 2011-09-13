/*

= Class: bind::redhat
Special redhat class - inherits from bind::base

You should not include this class - please refer to Class["bind"]

*/
class bind::redhat inherits bind::base {

  include bind::params

  package {"bind9":
    ensure => present,
    name => "bind-chroot"
  }

  Service["bind9"] {
    name => "named",
    pattern => "/usr/sbin/named",
    restart => "/etc/init.d/named reload",
  }

  exec { 'named.conf.local':
    command => "echo \"include \\\"/etc/named.conf.local\\\";\" >> /etc/named.conf",
    path => "/usr/local/bin:/bin:/usr/bin",
    unless => "grep -q '/etc/named.conf.local' /etc/named.conf",
    notify => Service["bind9"],
    require => Package["bind9"]
  }

}
