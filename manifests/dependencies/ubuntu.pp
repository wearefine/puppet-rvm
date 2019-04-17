# Install packages needed by RVM on Ubuntu when not using autolibs
class rvm::dependencies::ubuntu {

  $dependencies = [
    'build-essential',
    'software-properties-common',
    'libcurl4-openssl-dev',
    'apache2-dev',
  ]

  package { $dependencies:
    ensure => 'installed',
  }

  package { 'libxslt1-dev':
    ensure => 'installed',
    alias  => 'libxslt-dev',
  }
}
