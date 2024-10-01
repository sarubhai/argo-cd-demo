# Argo CD Demo
Argo CD is a powerful continuous delivery tool for managing Kubernetes resources through a GitOps approach. With Argo CD, your Git repository is the single source of truth for your application’s desired state, ensuring consistency and reliability across your deployments.

This repository contains the source code for an Argo CD demo on a Kubernetes cluster.

For a detailed guide, follow the article: [Setup MLflow on Kubernetes](https://appdev24.com/pages/55/install-argo-cd-in-kubernetes)

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Setup Instructions](#setup-instructions)
3. [Verify Argo CD & Demo Application](#verify-application)
4. [Cleanup](#cleanup)

## Prerequisites
Ensure the following tools are installed on your local machine:

- [Docker](https://www.docker.com/)
- [Kubernetes](https://kubernetes.io/) (Docker Desktop Kubernetes is sufficient)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [helm](https://helm.sh/)

## Setup Instructions

### Step 1: DNS Configuration
Add the following DNS entries to your `/etc/hosts` file:

```
127.0.0.1	argo-cd.local
127.0.0.1	python-api.local
```

### Step 2: Clone the Repository

Clone this repository to your local machine:
```
git clone https://github.com/sarubhai/argo-cd-demo.git
cd argo-cd-demo
```

### Step 3: Deploy Resources
Run the deployment script to start the services:
```
./installation.sh
```

## Verify Application
Once the setup is complete, you can access the Argo CD API Server at:
[https://argo-cd.local](https://argo-cd.local)

View the Demo Application managed by Argo CD GitOps. Refresh the application in case the state is not reflected yet.

Also you can verify the Demo Application at:
[https://python-api.local/api/products](https://python-api.local/api/products)


## Cleanup
To clean up resources and reset the environment:

### Step 1: Run Cleanup Script
Run the cleanup script to remove all resources:
```
./cleanup.sh
```