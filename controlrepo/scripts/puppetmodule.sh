#!/bin/bash

if [ "root" = "$(whoami)" ]; then
  echo 'run as owner of workspace, not root' 1>&2
  exit 1
else
  :
fi

adhoc='/tmp/puppetmodules.list'

# --version 'string'

for module in puppetlabs-stdlib $(test -f $adhoc && cat $adhoc) ; do

  puppet module install "$module" \
     --target-dir=/etc/puppetlabs/code/environments/local/modules

done
