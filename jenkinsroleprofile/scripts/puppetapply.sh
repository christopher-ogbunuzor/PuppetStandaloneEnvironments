#!/bin/bash

envdir="/etc/puppetlabs/code/environments/jenkinsroleprofileEnv"

if [ "root" = "$(whoami)" ]; then
  :
else
  echo "error: run as root; eg: sudo $0" 1>&2
  exit 1
fi

for targd in /usr/local/bin /opt/puppetlabs/bin ; do
  [ -x ${targd}/puppet ] && bindir=$targd
done

if [ "x$bindir" = "x" ] ; then
  "error: unable to locate executable puppet" 1>&2
  exit 1
else
  pbin=${bindir}/puppet
fi

if [ -e "${envdir}" ]; then
  :
else
  echo "run $(dirname $0)/createlocal.sh - ${envdir} missing" 1>&2
  exit 1
fi

set -x

# assuming that puppet is in PATH via /etc/profile.d or similar

$pbin apply --test --environment=local ${1} ${envdir}/manifests
