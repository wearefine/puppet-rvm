# == Class: rvm::system
#
# Install the RVM system
#
class rvm::system {

  include ::apt

  apt::ppa { 'ppa:rael-gc/rvm':
    before => Package['rvm'],
  }

  package { 'rvm':
    ensure => 'installed',
    before => Exec['link_rvm'],
  }

  exec { 'link_rvm':
    command => 'ln -s /usr/share/rvm/ /usr/local',
  }
}
