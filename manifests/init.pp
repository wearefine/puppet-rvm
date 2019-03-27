# Install RVM, create system user a install system level rubies
class rvm(
  $install_rvm=true,
  $install_dependencies=false,
  $manage_rvmrc=$rvm::params::manage_rvmrc,
  $system_rubies={},
  $rvm_gems={},
) inherits rvm::params {

  if $install_rvm {

    # rvm has now autolibs enabled by default so let it manage the dependencies
    if $install_dependencies {
      class { '::rvm::dependencies':
        before => Class['rvm::system'],
      }
    }

    if $manage_rvmrc {
      ensure_resource('class', 'rvm::rvmrc')
    }

    class { '::rvm::system': }
  }

  # rvm::system_user{ $system_users: }
  create_resources('rvm_system_ruby', $system_rubies, {'ensure' => present})
  if $rvm_gems != {} {
    validate_hash($rvm_gems)
    create_resources('rvm_gem', $rvm_gems )
  }
}
