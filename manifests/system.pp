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
    before => File['/usr/local/rvm/'],
  }

  file { '/usr/local/rvm':
    ensure => link,
    target => '/usr/share/rvm/',
  }
}
