#!/bin/bash
set -e

echo "-> removing kind cluster..."
kind delete cluster    
