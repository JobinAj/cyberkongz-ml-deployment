#!/bin/bash

# Exit immediately if a command fails
set -e

# Build Docker Image
docker build -t jobinaj/cyberkongz-ml:latest .

# Push to Docker Hub
docker push jobinaj/cyberkongz-ml:latest

# Deploy using Kubeflow
kubectl apply -f manifests/component.yaml --validate=false

# Upload Kubeflow pipeline (assuming 'kubeflow-pipeline.py' is a pipeline script)
python manifests/kubeflow-pipeline.py
