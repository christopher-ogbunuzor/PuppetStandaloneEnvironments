# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include my_files_templates::my_templates
class my_files_templates::my_templates {
  file { '/tmp/hello_template':
    ensure  => 'file',
    content => epp('my_files_templates/hello_template.epp'),
    path    => '/tmp/hello_template',
  }
}
