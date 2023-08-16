# Install

```bash
kubectl create namespace argocd

# list clusters from context
kubectl config get-contexts -o name
kubectl config current-context

## it will create lots of crds applications.argoproj.io
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# unistall argocd
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# all tge svc created are of type ClusterIP
kubectl get svc -n argocd

# patch the argocd-server svc to type LoadBalancerxs
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# get secrets
kubectl -n argocd get secrets
# get the initial password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d


# login to argocd server
argocd login <ARGOCD_SERVER>

# enroll cluster
argocd cluster add <context-name>

# the above command will create:
# INFO[0036] ServiceAccount "argocd-manager" created in namespace "kube-system" 
# INFO[0036] ClusterRole "argocd-manager-role" created    
# INFO[0036] ClusterRoleBinding "argocd-manager-role-binding" created 


# add app manually in the UI

# get the status of the app
argocd app list
argocd app get <app-name>

# sync/deploy the app
argocd app sync <app-name>

# This command retrieves the manifests from the repository and performs a kubectl apply of the manifests
```