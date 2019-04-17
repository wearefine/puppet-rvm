# Default module parameters
class rvm::params(
  $manage_group = true,
  $manage_rvmrc = true,
  $version = '1.29.7-1',
) {

  $group = $::operatingsystem ? {
    default => 'rvm',
  }
}
