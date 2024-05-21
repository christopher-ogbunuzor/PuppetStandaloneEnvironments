# message of the day base profile
class profile::motd::init (
  String $motd_main   = $profile::motd::params::motd_main,
  String $motd_local  = $profile::motd::params::motd_local,
  String $motd_behav  = $profile::motd::params::motd_behav,
) inherits profile::motd::params {

  include profile::motd::local
  if 'deploy' == $motd_behav {
    concat { "$motd_main":
      owner     => root,
      group     => root,
      mode      => '0644',
      show_diff => true,
    }

    concat::fragment{ 'motd01-line':
      target  => $motd_main,
      content => "------------------------------------------\n",
      order   => '01',
    }

    concat::fragment{ 'motd02-fqdn':
      target  => $motd_main,
      content => "${facts['fqdn']}\n",
      order   => '02',
    }

    concat::fragment{ 'motd03-line':
      target  => $motd_main,
      content => "------------------------------------------\n",
      order   => '03',
    }

    concat::fragment{ 'motd04-osrel':
      target  => $motd_main,
      content => "${facts['operatingsystem']} ${facts['operatingsystemrelease']}\n",
      order   => '04',
    }
  }
  elsif 'absent' == $motd_behav {
    file {"$motd_main":
      ensure => absent,
    }
  }
  elsif 'ignore' == $motd_behav {
    # we neither enforce motd, or not
  }
  else {
    fail {"invalid behaviour defined \$motd_behav '${motd_behav}'":}
  }
}

