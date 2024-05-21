# allow a local file to be added to end of motd
class profile::motd::local (
  String $motd_main   = $profile::motd::params::motd_main,
  String $motd_local  = $profile::motd::params::motd_local,
  String $motd_behav  = $profile::motd::params::motd_behav,
) inherits profile::motd::params {

  if 'deploy' == $motd_behav {

    file {"$motd_local":
      ensure => present,
      owner  => root,
      group  => root,
      mode   => '0644',
    } ->

    concat::fragment{ 'motd98-space':
      target  => $motd_main,
      content => "\n",
      order   => '98',
    }

    concat::fragment{ 'motd99-local':
      target  => $motd_main,
      source  => $motd_local,
      order   => '99',
    }
  }
  elsif 'absent' == $motd_behav {
    file {"$motd_local":
      ensure => absent,
    }
  }
  elsif 'ignore' == $motd_behav {
    # we neither enforce motd_local, or not
  }
  else {
    fail {"invalid behaviour defined \$motd_behav '${motd_behav}'":}
  }
}
