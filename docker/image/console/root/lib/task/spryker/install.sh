#!/bin/bash

function task_spryker_install()
{
    task "postgres:available"

    passthru "PGPASSWORD=$DB_PASS vendor/bin/install -r docker"

    task "skeleton:apply"
    task "assets:dump"
}
