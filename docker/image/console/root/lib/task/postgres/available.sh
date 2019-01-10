#!/bin/bash

function task_postgres_available
{
    local counter=0

    while [ $(is_postgres_ready) -ne 0 ]; do

        if (( counter > 30 )); then
            (>&2 echo "timeout while waiting on postgres to become available")
            exit 1
        fi

        sleep 1
        ((counter++))
    done
}

function is_postgres_ready
{
    pg_isready -h $DB_HOST 2>&1 >/dev/null
    echo "$?"
}