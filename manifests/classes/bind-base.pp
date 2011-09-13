/*

= Class: bind::base

Declares some basic resources.
You should NOT include this class as is, as it won't work at all!
Please refer to Class["bind"].

*/
class bind::base {

  include bind::params

  $debian = $operatingsystem ? {
    /RedHat|CentOS|Linux/ => false,
    /Debian|Ubuntu/ => true,
  }

  service { "bind9":
    ensure  => running,
    enable  => true,
    require => Package["bind9"],
  }

  file { "${bind::params::config_zones}":
    ensure => directory,
    owner  => "${bind::params::owner_zones}",
    group  => "${bind::params::group_zones}",
    mode   => 0755,
    require => Package["bind9"],
    purge   => true,
    force   => true,
    recurse => true,
    source  => "puppet:///modules/bind/empty",
  }

  if $debian {
    file { "${bind::params::database_zones}":
      ensure => directory,
      owner  => "${bind::params::owner_zones}",
      group  => "${bind::params::group_zones}",
      mode   => 0755,
      require => Package["bind9"],
      purge   => true,
      force   => true,
      recurse => true,
      source  => "puppet:///modules/bind/empty",
    }
  }

}
