# MobiaMission

## Directory 

```
.
├── 00-prereqs
│   ├── artifact_registry.tf
│   ├── oldvariables
│   ├── prod.tfvars -> ../prod.tfvars
│   ├── provider.tf
│   ├── service_accounts.tf
│   ├── statefile-backend-gcs.tf
│   ├── terraform-tfstate.json
│   └── variables.tf
├── 01-gke-infra
│   ├── gke.tf
│   ├── networking.tf
│   ├── oldvariables
│   ├── prod.tfvars -> ../prod.tfvars
│   ├── provider.tf
│   └── variables.tf
├── 02-k8s-deploy
│   ├── mobia_app.tf
│   ├── oldvariables
│   ├── prod.tfvars -> ../prod.tfvars
│   ├── provider.tf
│   └── variables.tf
├── LICENSE
├── README.md
├── TODO.md
├── build
│   ├── Dockerfile
│   └── index.html
└── prod.tfvars
```

### 00-prereqs


For the purposes of this presentation, the Terraform used to setup the rerequisites for a successful terraform run are stored here. In a real production repository the contents of this directory would be stored in separate VCS repository for logical separation. 

### 01-gke-infra

This directory contains ``gke.tf`` & ``networking.tf``, which are responsible for the deployment of the GKE cluster and VPC/Subnet to be associated with them. 

### 02-k8s-deploy

This directory contains ``mobia_app.tf`` which is the primary kubernetes manifests responsible for launching the application

## build

This directory contains the ``Dockerfile`` and ``index.html`` required to produce the application

## How to Use


### Pull Requests

In order to deploy the infra represented in this repository, open a Pull Request on [this repository](https://github.com/unseenservant/MobiaMission) targetting the ``main`` branch. 

When you PR is ready, you'll see the Terraform Plan output as part of the Actions on the PR 

#### To Apply the Terraform Plan

Following Hashicorp's recommended VCS workflow for deploying Terraform, when a PR is merged into ``main`` another GitHub Action called **Apply Terraform** is started which will provision the infrastructure. 

### Important Notes

If infrastructure changes are detected on 01-gke-infra the Terraform Plan for 02-k8s-deploy will not execute and will return an error. This is control flow to prevent changes to both the application layer and the underlying GKE cluster in the same PR, ensuring best practices are utilized. 


## Results

[Here!](http://35.241.48.121/) & [Cloud Console](https://console.cloud.google.com/kubernetes/workload/overview?hl=en&project=mobia-mission-aaron&pageState=(%22savedViews%22:(%22i%22:%2295f6c98e207a4bfdaec54fa782670b40%22,%22c%22:%5B%5D,%22n%22:%5B%5D)))