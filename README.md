# kubeterra101
Basic Terraformed Kubernetes service running a Hello World app built using Python and FastAPI. This runs in your local environment via Minikube.


Prerequisites:
- Python 3
- FastAPI - https://fastapi.tiangolo.com/
- Docker/Docker Hub
- Minikube - https://kubernetes.io/docs/tutorials/hello-minikube/
- Terraform - https://www.terraform.io/

Commands

From directory with Dockerfile:
```
docker build -t k8s-fast-api .
```

Workaround due to error when using minikube image load:
```
docker image save -o k8s-fast-api.tar k8s-fast-api:0.0.1
minikube image load k8s-fast-api.tar
```

Create Kubernetes deployment:
```
kubectl create deployment k8s-fast-api --image=docker.io/library/k8s-fast-api:0.0.1
```

Expose public via service:
```
kubectl expose deployment k8s-fast-api --type=LoadBalancer --port=80
```

Connect to service:
```
minikube service k8s-fast-api
```


Monitor/Check commands:
```
minikube dashboard
minikube image ls
kubectl get deployments
kubectl get pods
kubectl get events
kubectl config view
kubectl logs (pod_name)
kubectl get services
```
