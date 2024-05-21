# message of the day base profile
class profile::motd (
  String $motd_main   = '/etc/motd',
) {

  # heredocument
  # variables are interpolated
  # using a template (or the concat module) might be a more typical way
  # to a achieve this

  $motd_contents = @("END")
  ------------------------------------------
  ${facts['fqdn']}
  ------------------------------------------
  ${facts['operatingsystem']} ${facts['operatingsystemrelease']}
  END

  file { "$motd_main":
    owner     => root,
    group     => root,
    mode      => '0644',
    content   => $motd_contents,
    show_diff => true,
  }
}
