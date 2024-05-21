# add role to motd
class profile::motd::role (
  String $motd_main   = $profile::motd::params::motd_main,
  String $motd_local  = $profile::motd::params::motd_local,
  String $motd_behav  = $profile::motd::params::motd_behav,
) inherits profile::motd::params {

  if ! has_key($facts, 'role') {
    # do nothing if the role fact is not defined
  }
  elsif 'deploy' == $motd_behav {

    concat::fragment{ 'motd10-role':
      target  => $motd_main,
      content => "role: ${facts['role']}\n",
      order   => '10',
    }

  }
  elsif 'absent' == $motd_behav {
    # behaviour handled by profile::motd::init
  }
  elsif 'ignore' == $motd_behav {
    # we neither enforce motd, or not
  }
  else {
    fail {"invalid behaviour defined \$motd_behav '${motd_behav}'":}
  }
}
