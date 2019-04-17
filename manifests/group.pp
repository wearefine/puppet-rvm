# Create the RVM group
class rvm::group (
  $group_name = $rvm::params::group,
)
inherits rvm::params {

  group { $group_name :
    ensure => 'present',
    system => true,
  }
}
