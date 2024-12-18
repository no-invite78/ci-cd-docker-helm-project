# CI/CD Pipeline with Docker, Kubernetes, Helm, Prometheus, Grafana, and Terraform 

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


## **Tools and Technologies**

- **Flask**: Python web framework.
- **Docker**: Containerize the application.
- **Kubernetes**: Orchestrate and manage containers.
- **Helm**: Simplify Kubernetes deployments.
- **Prometheus**: Metrics monitoring.
- **Grafana**: Metrics visualization.
- **Terraform**: Infrastructure as Code (IaC) for AWS.
- **Minikube**: Local Kubernetes cluster.


## **Setup and Deployment**

Follow these steps to set up and deploy the project.

### **1. Prerequisites**

Ensure you have the following tools installed:

- [Docker](https://www.docker.com)
- [Minikube](https://minikube.sigs.k8s.io/)
- [Helm](https://helm.sh)
- [Kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Terraform](https://www.terraform.io)
- AWS CLI configured with access credentials.


### **2. Clone the Repository**

```bash
git clone https://github.com/your-username/ci-cd-docker-helm-project.git
cd ci-cd-docker-helm-project
```

## 3. Run the Flask Application with Docker
Build and test the application locally:

```bash
docker build -t flask-app .
docker run -p 5000:5000 flask-app
```

## 4. Deploy to Kubernetes with Helm
Start Minikube and deploy the app:

```bash
minikube start
helm upgrade --install flask-app flask-app-chart/
```
Check the services and pods:

```bash
kubectl get pods
kubectl get svc
```
If using minikube tunnel for LoadBalancer, run:

```bash
minikube tunnel
```
Access the application at http://127.0.0.1:5000.

## 5. Monitor with Prometheus and Grafana
Add the Prometheus Helm repo and install monitoring stack:

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack
```

Port forward Grafana to access the dashboard:

```bash
kubectl port-forward svc/prometheus-grafana 3000:80
```

Open http://localhost:3000 and log in:

Username: admin
Password: prom-operator

## 6. Deploy AWS Infrastructure with Terraform
Navigate to the Terraform folder:

```bash
cd terraform
terraform init
terraform plan
terraform apply
```
Terraform provisions:

EC2 Instance
S3 Bucket for remote state
DynamoDB for state locking
Grafana Dashboard

The Grafana dashboard visualizes:

Flask App CPU Usage
Flask App Memory Usage
Custom queries include:

```promql
# CPU Usage
rate(container_cpu_usage_seconds_total{pod=~"flask-app.*"}[5m])

# Memory Usage
container_memory_usage_bytes{pod=~"flask-app.*"}
```

## Screenshots

### 1. AWS Console
- **S3 Bucket for Terraform State:**
  ![S3 Bucket](screenshots/Screenshot%202024-12-18%20at%2002.50.41.png)

- **EC2 Instance Details:**
  ![EC2 Instance](screenshots/Screenshot%202024-12-18%20at%2002.51.38.png)
  

### 2. Kubernetes Deployment
- **`kubectl get pods` and `kubectl get svc` Output:**

  ![Pods and Services Output](screenshots/Screenshot%202024-12-18%20at%2010.01.04.png)


### 3. Grafana Dashboard
- **CPU Usage:**
  
  ![Grafana CPU](screenshots/Screenshot%202024-12-18%20at%2010.24.35.png)


## Folder Structure
```bash
ci-cd-docker-helm-main/
│-- flask-app/                    # Flask application code
│-- flask-app-chart/              # Helm chart for deployment
│-- terraform/                    # Terraform configuration files
│-- .gitignore                    # Ignore unnecessary files
│-- Dockerfile                    # Docker configuration
│-- README.md                     # Project documentation

```
## Contributing

Feel free to open issues or pull requests if you want to improve this project.

## License

This project is licensed under the MIT License.

## Acknowledgements

Kubernetes Official Docs
Prometheus and Grafana
HashiCorp Terraform
