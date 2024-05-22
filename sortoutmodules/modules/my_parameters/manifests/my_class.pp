# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include my_parameters::my_class
class my_parameters::my_class (String $greeting) {
  file { '/tmp/my_parameters':
    ensure  => 'file',
    content => $greeting,
    path    => '/tmp/my_parameters',
  }
}
