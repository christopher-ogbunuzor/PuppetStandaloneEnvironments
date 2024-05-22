$my_content = 'Hello Top'
node default {
  # include my_module::my_class - NO NEED TO INCLUDE INDIVIDUAL CLASSES since this is already done at the module level in init.pp file
  # the below are modules, not classes
  include my_module
  include my_variables
  include my_facts
  include my_parameters
  include my_parameters_refactor
  include my_files_templates
}
