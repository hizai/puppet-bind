class bind::params {

  $config_home = $operatingsystem ? {
    /RedHat|CentOS|Linux/ => '/var/named/chroot/etc',
    /Debian|Ubuntu/ => '/etc/bind/',
  }

  $config_zones = $operatingsystem ? {
    /RedHat|CentOS|Linux/ => '/var/named/chroot/etc/zones',
    /Debian|Ubuntu/ => '/etc/bind/zones',
  }

  $database_zones = $operatingsystem ? {
    /RedHat|CentOS|Linux/ => '/var/named',
    /Debian|Ubuntu/ => '/etc/bind/pri',
  }

  $owner_zones = $operatingsystem ? {
    /RedHat|CentOS|Linux/ => 'root',
    /Debian|Ubuntu/ => 'root',
  }

  $group_zones = $operatingsystem ? {
    /RedHat|CentOS|Linux/ => 'named',
    /Debian|Ubuntu/ => 'root',
  }

  $zones_path = $operatingsystem ? {
    /RedHat|CentOS|Linux/ => '/etc/zones',
    /Debian|Ubuntu/ => '/etc/bind/zones',
  }

  $os = $operatingsystem ? {
    /RedHat|CentOS|Linux/ => 'redhat',
    /Debian|Ubuntu/ => 'debian',
  }

}

