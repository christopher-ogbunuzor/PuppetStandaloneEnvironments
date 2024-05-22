# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include my_facts::my_class
class my_facts::my_class {
  file { '/tmp/my_facts':
    ensure  => 'file',
    content => "Another ${facts['os']['family']}",
    path    => '/tmp/my_facts',
  }
  file { '/etc/facter/facts.d/custom_facts.rb':
    ensure  => 'file',
    content => "Facter.add('group') do\n  setcode do\n    'ci'\n  end\nend\n",
  }
}
