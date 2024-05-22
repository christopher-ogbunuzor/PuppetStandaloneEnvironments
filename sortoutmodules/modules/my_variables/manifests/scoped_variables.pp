# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include my_variables::scoped_variables
class my_variables::scoped_variables {
  $my_content = 'Hello Scoped'

  file { '/tmp/scoped_variables_0':
    ensure  => 'file',
    content => $my_content,
    path    => '/tmp/scoped_variables_0',
  }

  file { '/tmp/scoped_variables_1':
    ensure  => 'file',
    content => $my_variables::local_variables::my_content,
    path    => '/tmp/scoped_variables_1',
  }

  file { '/tmp/scoped_variables_2':
    ensure  => 'file',
    content => $my_variables::my_content, #using module variable
    path    => '/tmp/scoped_variables_2',
  }

  file { '/tmp/scoped_variables_3':
    ensure  => 'file',
    content => $::my_content,  #using global variable
    path    => '/tmp/scoped_variables_3',
  }
}
