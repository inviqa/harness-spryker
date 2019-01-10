#!/bin/bash

function task_assets_apply()
{
    # todo: fetch info from postgres
    IS_DATABASE_APPLIED="no"

    if [ "$IS_DATABASE_APPLIED" = "no" ]; then
        task "spryker:install"
    fi

    for file in /app/tools/assets/development/*.files.{tgz,tar.gz}; do
        [ -f "$file" ] || continue
        run "tar -zxvf ${file} -C /app"
    done
}
