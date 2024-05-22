## site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
#https://docs.puppet.com/pe/2015.3/release_notes.html#filebucket-resource-no-longer-created-by-default
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

  # the rest of this file has been modified for the puppet apply example
  # at blog.thewatertower.org

  # ensure we have stdlib so we can use functions, facts therein

# include ::stdlib
# include ::augeas_core
# include ::augeasproviders_sysctl
# include ::os_hardening

node default {

    # if a hash value doesn't exist
    # a variable set with its value will be undefined
    #
  $facts_servername = $facts['servername']
  $facts_role = $facts['role']

  if $facts_servername         == undef and
     $trusted['authenticated'] == 'local' {

    # this looks like puppet apply, so include the classes
    # list for puppet apply

    lookup('apply_classes').include

  }
  elsif $facts_role == undef {
    notify { 'role_valid_undef':
      message  => 'role not set (system not classified)',
      withpath => true,
    }
  }
  elsif $facts['role'] !~ /^role::/ {
    notify { 'role_valid_regex':
      message  => "role does not start with role:: - '${facts['role']}' (system not classified)",
      withpath => true,
    }
  }
  else {
     lookup('classes').include
  }
}
