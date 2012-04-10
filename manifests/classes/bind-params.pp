class bind::params {

  $config_home = $operatingsystem ? {
    /RedHat|CentOS|Amazon|Linux/ => '/var/named/chroot/etc',
    /Debian|Ubuntu/ => '/etc/bind/',
  }

  $config_zones = $operatingsystem ? {
    /RedHat|CentOS|Amazon|Linux/ => '/var/named/chroot/etc/zones',
    /Debian|Ubuntu/ => '/etc/bind/zones',
  }

  $database_zones = $operatingsystem ? {
    /RedHat|CentOS|Amazon|Linux/ => '/var/named',
    /Debian|Ubuntu/ => '/etc/bind/pri',
  }

  $owner_zones = $operatingsystem ? {
    /RedHat|CentOS|Amazon|Linux/ => 'root',
    /Debian|Ubuntu/ => 'root',
  }

  $group_zones = $operatingsystem ? {
    /RedHat|CentOS|Amazon|Linux/ => 'named',
    /Debian|Ubuntu/ => 'root',
  }

  $zones_path = $operatingsystem ? {
    /RedHat|CentOS|Amazon|Linux/ => '/etc/zones',
    /Debian|Ubuntu/ => '/etc/bind/zones',
  }

  $os = $operatingsystem ? {
    /RedHat|CentOS|Amazon|Linux/ => 'redhat',
    /Debian|Ubuntu/ => 'debian',
  }

}

