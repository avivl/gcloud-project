#!/bin/bash
export GCPPRJ_ROOT
export GCPPRJ_PROJECT_FILE_NAME=.gcpprj
GCLOUD_ORIG=$(command -v  gcloud)
export GCLOUD_ORIG


if [[ -n $BASH_VERSION ]]; then
    # BASH
    GCPPRJ_ROOT="$(builtin cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
elif [[ -n $ZSH_VERSION ]]; then
    # ZSH
    GCPPRJ_ROOT="${${(%):-%x}:A:h}"
    compdef _gcloud __gcpprj::gcloud
else
    return 1
fi
__gcpprj::init::init()
{
    # core files
    for src in "$GCPPRJ_ROOT/src"/*.sh
    do
        # shellcheck source=/dev/null
        source "$src"
    done

    unset src

    # alias to gcloud
    eval "alias gcloud=__gcpprj::gcloud"
}
__gcpprj::init::init

