
---
# Collect Metrics from Exporters using the Managed Service for Prometheus

```bash

# create k8s GKE cluster
gcloud beta container clusters create gmp-cluster --num-nodes=1 --zone us-central1-f --enable-managed-prometheus

# get credentials
gcloud container clusters get-credentials gmp-cluster --zone=us-central1-f

# create namespace
kubectl create ns gmp-test

# deploy an app which exposes metrics (3 replicas)
kubectl -n gmp-test apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/prometheus-engine/v0.2.3/examples/example-app.yaml
```
---

# Migrate existing Prometheus monitoring workloads to GCP

```bash

# get project ID e.g qwiklabs-gcp-00-5df9517dbcd0
gcloud config get-value project

# deploy GKE cluster
gcloud container clusters create gmp-cluster --num-nodes=3 --zone=us-central1-c

gcloud container clusters get-credentials gmp-cluster --zone=us-central1-c

# create namespace gmt-test
kubectl create ns gmp-test

# deploy app that exposes Prometheus metrics
kubectl -n gmp-test apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/prometheus-engine/v0.2.3/examples/example-app.yaml

kubectl get po -n gmp-test
NAME                            READY   STATUS    RESTARTS   AGE
prom-example-84c6f547f5-6t7bj   1/1     Running   0          44s
prom-example-84c6f547f5-6wnpz   1/1     Running   0          44s
prom-example-84c6f547f5-r8qwl   1/1     Running   0          44s


# deploy Prometheus kubectl -n gmp-test get pod
kubectl -n gmp-test apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/prometheus-engine/v0.2.3/examples/prometheus.yaml


# kube prometheus library kube-prometheus/manifests/prometheus-prometheus.yaml edit image and replicas
git clone https://github.com/prometheus-operator/kube-prometheus.git

cd kube-prometheus&& kubectl apply --server-side -f manifests/setup

until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done


curl https://raw.githubusercontent.com/GoogleCloudPlatform/prometheus-engine/v0.2.1/examples/frontend.yaml | sed 's/\$PROJECT_ID/{qwiklabs-gcp-00-5df9517dbcd0}/' | kubectl apply -n gmp-test -f -


# Forwarding from 127.0.0.1:9090 -> 9090 Forward the port to see the Prometheus metrics UI
kubectl -n gmp-test port-forward svc/frontend 9090

# deploy Grafana cd kube-prometheus and
kubectl -n gmp-test apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/prometheus-engine/v0.2.3/examples/grafana.yaml

# Forward the port to see the Grafana UI forwarding 127.0.0.01:3001 -> 3000
kubectl -n gmp-test port-forward svc/grafana 3001:3000
```