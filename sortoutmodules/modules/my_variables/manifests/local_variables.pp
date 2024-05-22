# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include my_variables::local_variables
class my_variables::local_variables {
  $my_content = 'Hello World'

  file { '/tmp/locall_variables.txt':
    ensure  => 'file',
    content => $my_content,
    path    => '/tmp/locall_variables.txt',
  }

  file { '/tmp/local_variables.txt':
    ensure  => 'file',
    content => "Another ${my_content}",
    path    => '/tmp/local_variables.txt',
  }
  sysctl { 'net.ipv4.ip_forward':
    ensure => present,
    value  => '1',
  }
}
