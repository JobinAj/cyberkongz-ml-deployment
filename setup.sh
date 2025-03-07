#!/bin/bash

# Build Docker Image
docker build -t jobinaj/cyberkongz-ml:latest .

# Push to Docker Hub
docker push jobinaj/cyberkongz-ml:latest

# Deploy using Kubeflow
kubectl apply -f manifests/component.yaml
kubectl apply -f manifests/kubeflow-pipeline.py
