# @summary Create temporary file
#
# Create temporary file
#
# @example
#   include my_module::my_class
class my_module::my_class {
  file { '/tmp/hello.txt':
    ensure  => 'file',
    content => 'Hello World, Puppet has created this file',
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    path    => '/tmp/hello.txt', #redundant since it has to be same as the title
  }
}
