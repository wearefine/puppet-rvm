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

  file { '/usr/local/':
    ensure => 'link',
    target => '/usr/share/rvm/',
  }
}
