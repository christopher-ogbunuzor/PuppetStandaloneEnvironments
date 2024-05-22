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

  concat::fragment { '1':
  target  => 'testconcat',
  content => '1',
  order   => '01',
}

  file { '/tmp/local_variables.txt':
    ensure  => 'file',
    content => "Another ${my_content}",
    path    => '/tmp/local_variables.txt',
  }
}
