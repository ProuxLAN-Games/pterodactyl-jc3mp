#!/bin/bash

packages=$( cat /home/container/packages_install.json )

for key in $( echo "${packages}" | jq -c 'keys[]' ); do
  cd "/home/container/packages/${key}"
  for cmd in $( echo "${packages}" | jq -c ".${key}[]" ); do
    eval ${cmd}
  done
done

cd /home/container
