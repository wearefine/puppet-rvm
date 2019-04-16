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

  file { '/usr/share/rvm/':
    ensure => link,
    target => '/usr/local',
  }
}
