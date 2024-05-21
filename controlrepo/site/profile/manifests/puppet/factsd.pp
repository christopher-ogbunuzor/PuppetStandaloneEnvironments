# create one of the structured facts locations

class profile::puppet::factsd (
  String $facterdir = '/etc/puppetlabs/facter',
  String $factsddir = 'facts.d',
) {
  file { $facterdir:
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0755',
  } ->
  file { "${facterdir}/${factsddir}":
    ensure  => directory,
    owner   => root,
    group   => root,
    mode    => '0755',
  }
}
