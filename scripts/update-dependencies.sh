#!/bin/bash
set -o errexit -o nounset -o pipefail
# command -v shellcheck >/dev/null && shellcheck "$0"

update_npm_deps() {
	local dep_type=$1
	local install_flag=$2
	echo "Updating npm $dep_type..."

	deps=$(jq -r ".$dep_type | to_entries[] | select(.value | startswith(\"^\") or startswith(\"~\") or startswith(\">\") or startswith(\"<\") or startswith(\"=\")) | .key + \"@latest\"" package.json | tr '\n' ' ')

	if [ -n "$deps" ]; then
		# shellcheck disable=SC2086
		npm install "$install_flag" $deps --force
		echo "All npm $dep_type have been updated to their latest versions."
	else
		echo "No npm $dep_type found to update."
	fi
	echo
}

update_npm_deps "devDependencies" "--save-dev"

echo "All dependencies have been updated to their latest versions."
