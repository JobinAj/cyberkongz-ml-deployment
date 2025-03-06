#!/bin/bash

# Build Docker Image
docker build -t your-docker-repo/cyberkongz-ml:latest .

# Push to Docker Hub
docker push your-docker-repo/cyberkongz-ml:latest

# Deploy using Kubeflow
kubectl apply -f manifests/component.yaml
kubectl apply -f manifests/kubeflow-pipeline.py
