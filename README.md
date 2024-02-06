
# MobiaMission Infrastructure Deployment
## Overview
MobiaMission is a robust infrastructure deployment project designed to streamline the setup and management of cloud resources using Terraform. This project encapsulates the deployment of a Google Kubernetes Engine (GKE) cluster, associated networking infrastructure, and a sample web application, ensuring a cohesive and scalable solution.

## Repository Structure
```plaintext
.
├── 00-prereqs
│   ├── artifact_registry.tf
│   ├── prod.tfvars -> ../prod.tfvars
│   ├── provider.tf
│   ├── service_accounts.tf
│   ├── statefile-backend-gcs.tf
│   └── variables.tf
├── 01-gke-infra
│   ├── gke.tf
│   ├── networking.tf
│   ├── prod.tfvars -> ../prod.tfvars
│   ├── provider.tf
│   └── variables.tf
├── 02-k8s-deploy
│   ├── mobia_app.tf
│   ├── prod.tfvars -> ../prod.tfvars
│   ├── provider.tf
│   └── variables.tf
├── LICENSE
├── README.md
├── build
│   ├── Dockerfile
│   └── index.html
└── prod.tfvars
```
### Directory Descriptions
1. **00-prereqs**: Contains Terraform configurations for prerequisite resources, including service accounts and backend storage for Terraform state.
2. **01-gke-infra**: Hosts Terraform files (gke.tf & networking.tf) for provisioning the GKE cluster and its associated VPC and subnet.
3. **02-k8s-deploy**: Contains the Terraform configuration (mobia_app.tf) for deploying the sample web application onto the Kubernetes cluster.
4. **build**: Includes the Dockerfile and index.html for building the sample web application.

## Usage Guidelines
### Deploying Infrastructure
1. **Open a Pull Request**: To initiate the deployment, create a Pull Request targeting the main branch of MobiaMission Repository.
2. **Review Terraform Plan**: Upon opening the PR, GitHub Actions will generate a Terraform Plan, visible in the Actions tab, detailing the proposed infrastructure changes.
3. **Merge to Apply**: Once reviewed and approved, merging the PR into main triggers another GitHub Action, Apply Terraform, which provisions the outlined infrastructure.

### Best Practices and Workflow
* **Separation of Concerns**: The content within the 00-prereqs directory, under a production environment, should reside in a separate version-controlled repository for logical segregation and enhanced security.
* **Sequential Deployment**: Infrastructure changes detected in 01-gke-infra will cause the Terraform Plan for 02-k8s-deploy to halt and return an error. This mechanism ensures that modifications to the application layer and the underlying GKE cluster are not made simultaneously, adhering to deployment best practices.

## Viewing Results
The deployed application can be accessed [here](http://35.241.48.121/). For administrative and monitoring purposes, the GKE cluster and application deployment can be managed via the [Google Cloud Console](https://console.cloud.google.com/kubernetes/workload/overview?hl=en&project=mobia-mission-aaron&pageState=(%22savedViews%22:(%22i%22:%2295f6c98e207a4bfdaec54fa782670b40%22,%22c%22:%5B%5D,%22n%22:%5B%5D))).