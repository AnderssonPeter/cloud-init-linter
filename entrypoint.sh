#!/bin/bash

readarray -t config_files < <(ls cloud-init*.{yml,yaml} -1q 2> /dev/null)
had_errors=0
for config_file in "${config_files[@]}"; do
    result="$(cloud-init devel schema --config-file $config_file 2>&1)"
    if [[ "$?" -eq 0 ]]
    then
        echo "::notice file=$config_file::Was valid"
    else
        echo "::error file=$config_file::$result"
        had_errors=1
    fi
done

exit $had_errors