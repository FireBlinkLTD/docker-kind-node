#!/bin/bash
set -e

EXISTING_CLUSTERS=$(kind get clusters)

if [[ "${EXISTING_CLUSTERS}x" != "x" ]]; then
    echo "-> removing kind cluster..."
    kind delete cluster
    echo "<- kind cluster removed"
fi

echo "-> creating kind cluster..."
kind create cluster

echo "<- kind cluster created"   