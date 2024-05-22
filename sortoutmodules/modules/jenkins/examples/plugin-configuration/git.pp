# lint:ignore:autoloader_layout
class jenkins::plugin::git (
# lint:endignore
  $version                    = 0,
  $config_filename            = 'hudson.plugins.git.GitSCM.xml',
  $config_content             = undef,
  $git_name                   = 'Jenkins',
  $git_email                  = 'jenkins@example.net',
  Boolean $git_create_account = false,
) {
  if $config_content == undef {
    $real_content = template('jenkins/plugin/git.config.xml.erb')
  } else {
    $real_content = $config_content
  }

  jenkins::plugin { 'git':
    version         => $version,
    config_filename => $config_filename,
    config_content  => $real_content,
  }
}
