### Deploy app

```bash
# deploy the app
kubectl apply -f deployment.yaml

# access the app
kubectl port-forward nginx 8080:80
```