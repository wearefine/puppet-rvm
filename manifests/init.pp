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

  $system_rubies.each |String $name, Hash $data| {
    rvm_system_ruby { $name:
      * => $data,
    }
  }

  # create_resources('rvm_system_ruby', $system_rubies, {'ensure' => present})
  if $rvm_gems != {} {
    validate_hash($rvm_gems)
    $rvm_gems.each |String $name, Hash $data| {
      rvm_gem { $name:
        * => $data,
      }
    }
  }
}
