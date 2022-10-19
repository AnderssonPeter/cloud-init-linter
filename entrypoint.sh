#!/bin/bash

readarray -t config_files < <(ls cloud-init*.{yml,yaml} -1q 2> /dev/null)
for config_file in "${config_files[@]}"; do
    result="$(cloud-init devel schema --config-file $config_file 2>&1)"
    if [[ "$?" -eq 0 ]]
    then
        echo "::error file=$config_file::$result"
    else
        echo "$result"
    fi
done