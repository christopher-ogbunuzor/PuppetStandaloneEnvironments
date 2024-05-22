# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include my_module::another_class
class my_module::another_class {
  file { '/tmp/another.txt':
    ensure  => 'file',
    content => 'Another Hello World',
    path    => '/tmp/another.txt',
  }
}
