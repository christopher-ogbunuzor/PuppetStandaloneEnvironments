# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include my_files_templates::my_files
class my_files_templates::my_files {
  file { '/tmp/hello_file.txt':
    ensure => 'file',
    path   => '/tmp/hello_file.txt',
    source => 'puppet:///modules/my_files_templates/hello_file.txt',
  }
}
