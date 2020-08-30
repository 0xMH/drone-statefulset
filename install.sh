#!/usr/bin/env bash

set -e

PATH="/opt/bitnami/kubectl/bin:$PATH"

INIT_FILE=/opt/sinlead/kubectl/initialized

if [ ! -f ${INIT_FILE} ]; then
    init-kubectl
    touch ${INIT_FILE}
fi

echo Deploying...
kubectl -n ${PLUGIN_NAMESPACE} set image statefulset/${PLUGIN_STATEFULSET} ${PLUGIN_CONTAINER}=${PLUGIN_REPO}:${PLUGIN_TAG} --record
