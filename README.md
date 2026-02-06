# Secure Kubernetes Deployment for Shell Script
A simple K8s deployment to run a security check container with resource limits and non-root security.

### Problem
Deploying apps needs security (non-root, resource limits).

### Solution
Deploys a pod with secure context and limits for a bash script container.

### Tools Used
- Kubernetes (Minikube)
- Docker
- Bash scripting

### How to Run
1. Start Minikube: `minikube start`
2. Apply: `kubectl apply -f deployment.yaml`
3. Check logs: `kubectl logs secure-shell-deployment-76d8b9d56f-w487l`

### Lessons Learned
Used non-root for security. Trade-off: Resource limits for low attack surface vs higher for performance.

Learned from KodeKloud's Kubernetes course.
