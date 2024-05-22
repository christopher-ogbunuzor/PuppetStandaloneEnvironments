# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include my_variables
class my_variables {
  $my_content = 'Hello Module'
  # This is where you collate all classes within a module into a single place and 
  # you include this in site.pp
  include my_variables::local_variables
  include my_variables::scoped_variables
}
