# CI/CD Pipeline with Docker, Kubernetes, Helm, Prometheus, Grafana, and Terraform 🚀

This project demonstrates a full CI/CD pipeline for a **Flask application** using modern DevOps tools like Docker, Kubernetes, Helm, Prometheus, Grafana, and Terraform. The project is deployed on a **local Minikube cluster** and manages cloud infrastructure with **AWS**.


##  **Project Overview**

The project achieves the following goals:

1. **Flask Application**: Containerized with Docker and deployed to Kubernetes.
2. **Kubernetes Deployment**: Managed with Helm charts for easy configuration.
3. **Monitoring and Visualization**:
   - **Prometheus**: Collects metrics from the Flask app and cluster.
   - **Grafana**: Visualizes metrics using dashboards.
4. **Infrastructure as Code**:
   - **Terraform**: Manages AWS resources such as an S3 bucket and EC2 instance.
   - Remote state stored in an **S3 bucket** with DynamoDB state locking.

---

## 🛠️ **Tools and Technologies**

- **Flask**: Python web framework.
- **Docker**: Containerize the application.
- **Kubernetes**: Orchestrate and manage containers.
- **Helm**: Simplify Kubernetes deployments.
- **Prometheus**: Metrics monitoring.
- **Grafana**: Metrics visualization.
- **Terraform**: Infrastructure as Code (IaC) for AWS.
- **Minikube**: Local Kubernetes cluster.

---

## 🚀 **Setup and Deployment**

Follow these steps to set up and deploy the project.

### **1. Prerequisites**

Ensure you have the following tools installed:

- [Docker](https://www.docker.com)
- [Minikube](https://minikube.sigs.k8s.io/)
- [Helm](https://helm.sh)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Terraform](https://www.terraform.io)
- AWS CLI configured with access credentials.

---

### **2. Clone the Repository**

```bash
git clone https://github.com/your-username/ci-cd-docker-helm-project.git
cd ci-cd-docker-helm-project
