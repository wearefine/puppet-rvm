# == Class: rvm::system
#
# Install the RVM system
#
class rvm::system {

  include ::apt

  apt::ppa { 'ppa:rael-gc/rvm':
    before => Package['rvm'],
    notify => Exec['apt_update'],
  }

  package { 'rvm':
    ensure => 'installed',
    before => File['/usr/local/'],
  }

  exec { 'link_rvm':
    command => 'ln -s /usr/share/rvm/ /usr/local',
  }
}
