# @summary A class using a parameterized module
#
# A class using a parameterized module
#
# @example
#   include my_parameters_refactor::my_class
# pls note class is not parameterised,instead the module is
class my_parameters_refactor::my_class {
  file { '/tmp/my_parameters_refactor':
    ensure  => 'file',
    content => $my_parameters_refactor::greeting, #using module variable
    path    => '/tmp/my_parameters_refactor',
  }
}
