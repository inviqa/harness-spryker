#!/bin/bash

function task_composer_install()
{
    if [ "$APP_MODE" = "production" ]; then
        passthru "COMPOSER_MEMORY_LIMIT=2048M composer install --no-interaction --optimize-autoloader"
    else
        passthru "COMPOSER_MEMORY_LIMIT=2048M composer install --no-interaction"
    fi
}
