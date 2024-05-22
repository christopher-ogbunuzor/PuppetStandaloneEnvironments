$my_content = 'Hello Top'

node default {
  # include my_module::my_class - NO NEED TO INCLUDE INDIVIDUAL CLASSES since this is already done at the module level in init.pp file
  # the below are modules, not classes
  include stdlib
  # include java # class already included inthe profile jenkins controller.pp
  # include jenkins # class already included inthe profile jenkins controller.pp
  # include os_hardening  #will error out if it does not find class os_hardening in the imported module
  # include concat
  include my_module
  include my_variables
  include my_facts
  include my_parameters
  include my_parameters_refactor
  include my_files_templates

  # could also have been include os_hardening, but you wont be able to specify value for any variables
  class { 'os_hardening':
    password_max_age => 29400,
  }
  # class { 'java':
  #   package => 'java-1.8.0-openjdk-devel',
  # }
}
