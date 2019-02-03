#!/usr/bin/env bash

__gcpprj::gcloud()
{

unset new_project
unset current_project

if project_file="$(find_project_file "$PWD")"; then
  new_project=$(cut -b 1-1024 "$project_file")
  current_project=$("$GCLOUD_ORIG" config list --format 'value(core.project)' 2>/dev/null)
   if [ "$current_project" = "$new_project" ]; then
        echo project are the same
    else
        echo Setting project "$new_project"
        $GCLOUD_ORIG config set project "$new_project" > /dev/null 2>&1
    fi
fi

$GCLOUD_ORIG "$@"
$GCLOUD_ORIG config set project "$current_project" > /dev/null 2>&1
unset new_project
}
