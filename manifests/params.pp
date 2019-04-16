# Default module parameters
class rvm::params($manage_group = true) {

  $manage_rvmrc = $::osfamily ? {
    'Windows' => false,
    default   => true
  }

  $group = $::operatingsystem ? {
    default => 'rvm',
  }
}
