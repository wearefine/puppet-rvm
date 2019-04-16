# Install RVM, create system user a install system level rubies
class rvm(
  $install_rvm = true,
  $install_dependencies = false,
  $manage_rvmrc = $rvm::params::manage_rvmrc,
  $system_rubies = {},
  $rvm_gems = {},
  $manage_group = $rvm::params::manage_group,
  $version = $rvm::params::version,
) inherits rvm::params {

  if $install_rvm {

    # rvm has now autolibs enabled by default so let it manage the dependencies
    if $install_dependencies {
      class { '::rvm::dependencies':
        before => Class['rvm::system'],
      }
    }

    if $manage_group {
      include ::rvm::group
    }

    if $manage_rvmrc {
      class { '::rvm::rvmrc': }
    }

    class { '::rvm::system': }
  }

  $system_rubies.each |String $name, Hash $data| {
    rvm_system_ruby { $name:
      * => $data,
    }
  }

  if $rvm_gems != {} {
    validate_hash($rvm_gems)
    $rvm_gems.each |String $name, Hash $data| {
      rvm_gem { $name:
        * => $data,
      }
    }
  }
}
