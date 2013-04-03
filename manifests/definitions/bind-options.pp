/*

= Definition: bind::options
Sets named.conf options with template file

Arguments:
 *$template_file*: Source template file for named.conf

*/
define bind::options($template_file) {

  file { "/etc/named.conf":
    ensure => file,
    content => template($template_file),
    owner => 'root',
    group => 'named',
    mode => 0640,
    notify => Exec['restart_bind'],
    require => Package["bind9"],
  }

  exec { 'restart_bind':
    command => '/bin/bash -c \'/etc/init.d/named restart\'',
    refreshonly => true,
  }

}
