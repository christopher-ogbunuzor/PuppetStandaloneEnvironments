#!/bin/bash

if [ "root" = "$(whoami)" ]; then
  echo 'ok: running as root'
else
  echo "error: run as root; eg: sudo $0" 1>&2
  exit 1
fi
echo "Print value of dollar 0: $0"
here=$(readlink -f $0)  #read full path of executing script
echo "PRINTING LOCAL SCRIPT LOCATION: $here"
echo $here

crroot=$(echo "$here" | sed 's~^\(.*\)/scripts/.*~\1~g')

if [ ! -d ${crroot}/manifests ]; then
  echo "error:" 1>&2
  echo "I tried to locate the root of control-repo." 1>&2
  echo "I found ${crroot} but it doesn't contain a manifests directory." 1>&2
  echo "Either there's a bug, or I'm not in scripts/." 1>&2
  exit 1
else
  echo "ok: located control-repo in $crroot"
fi

tdir="/etc/puppetlabs/code/environments/jenkinsroleprofileEnv"
pcan1="/opt/puppetlabs/bin/puppet"
pcan2="/usr/local/bin/puppet"

if [ -x $pcan1 ]; then
  pbin=$pcan1
  echo "ok: found $pbin"
elif [ -x $pcan2 ]; then
  pbin=$pcan2
  echo "ok: found $pbin"
elif pcan3=$(which puppet); then
  pbin=$pcan3
  echo "ok: found $pbin (in PATH)"
else
  echo "error: 'puppet' not found or not executable" 1>&2
  echo "looked in $(dirname $pcan1), $(dirname $pcan2), and in PATH" 1>&2
fi

if [ ! -d $tdir ]; then
  echo "ok: puppet needs $tdir, so creating it"
  mkdir -p $tdir
else
  echo "ok: ${tdir} exists"
fi

# to protect the puppet code from shell interpretation, it's in single quotes
# but we need shell variables, thus we terminate the quotes either 
# side of tdir and crroot

${pbin} apply --test --environment=jenkinsroleprofileEnv \
  -e 'file { "'${tdir}'/local": ensure=>link,target=>"'${crroot}'",}'