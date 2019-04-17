# Install packages needed by RVM when not using autolibs
class rvm::dependencies {
  case $::operatingsystem {
    'Ubuntu' {
      require ::rvm::dependencies::ubuntu
    }
    default: {}
  }
}
