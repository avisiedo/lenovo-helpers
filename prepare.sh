#!/bin/bash

# Use: ./prepare.sh
#      ./prepare.sh --skip-tags sshd

set -e

# https://stackoverflow.com/questions/4774054/reliable-way-for-a-bash-script-to-get-the-full-path-to-itself
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SCRIPTNAME="$( basename "$0" )"

function main
{
	local playbook="${SCRIPTNAME%.sh}.yml";
	if [ ! -e "${playbook}" ]; then
		echo "error: playbook=${playbook} does not exist"
		exit 1
	fi
	# if [ "$*" != "" ]; then
	# 	ansible-playbook "${playbook}" $@
	# else
	# 	ansible-playbook "${playbook}" --ask-become-pass $@
	# fi
	#ansible-playbook "${playbook}" --ask-become-pass --skip-tags unsafe-tool --skip-tags compliance $@
	ansible-playbook "${playbook}" $@
}

if [ "${BASH_SOURCE[1]}" == "" ]; then
	main "$@"
fi
