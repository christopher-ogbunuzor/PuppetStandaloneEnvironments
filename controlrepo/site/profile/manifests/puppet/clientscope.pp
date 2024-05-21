# dumps a file with variables set when the agent runs
# generally /opt/puppetlabs/puppet/cache/site_agent_variables.yaml

class profile::puppet::clientscope (
) {
    # should be set (by stdlib)
    # functions to test hashes are supplied by stdlib, so we can't use them ..
  $pptvar = $facts['puppet_vardir']
  if $pptvar != undef {
    $myvarsdir=$facts['puppet_vardir']
  }
  else {
    $myvarsdir='/tmp'
  }

    # dumps all the variables that look like a string (and so helpfully filters some internal puppet settings) to a file
    #      content => inline_template('<%= scope.to_hash.reject { |k,v| !( k.is_a?(String) && v.is_a?(String) ) }.to_yaml %>'),
    # https://www.puppetcookbook.com/posts/see-all-client-variables.html
    # we want the non string stuff as well

  file { "${myvarsdir}/site_agent_variables.yaml":
    content   => inline_template('<%= scope.to_hash.to_yaml %>'),
    show_diff => false,
  }
}
