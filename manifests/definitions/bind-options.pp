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
    notify => Service["bind9"],
    require => Package["bind9"],
  }

}
