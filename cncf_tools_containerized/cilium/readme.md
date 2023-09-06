
# Cilium: CNI

```bash
curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/download/v0.13.2/cilium-linux-amd64.tar.gz
sudo tar xzvfC cilium-linux-amd64.tar.gz /usr/local/bin
rm cilium-linux-amd64.tar.gz

cilium status

# from a pod
pod=$(kubectl -n kube-system get pods -l k8s-app=cilium -o jsonpath='{.items[0].metadata.name}')
kubectl -n kube-system exec -q ${pod} -- cilium status --verbose
cilium bpf lb list

#install cilium using helm chart
helm repo add cilium https://helm.cilium.io/

# install cilium as daemonset
helm upgrade --install cilium cilium/cilium --version 1.14.0-snapshot.1 \
   --namespace kube-system \
   --set kubeProxyReplacement=partial \
   --set hostServices.enabled=false \
   --set hostServices.protocols=tcp \
   --set externalIPs.enabled=true \
   --set nodePort.enabled=true \
   --set hostPort.enabled=true \
   --set bpf.masquerade=false \
   --set image.pullPolicy=IfNotPresent \
   --set ipam.mode=kubernetes
```

* Install bookinfo app
```bash
kubectl create namespace bookinfo
kubectl apply -n bookinfo -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/bookinfo/platform/kube/bookinfo.yaml

# cheange clusterip service to loadbalancer type
kubectl -n bookinfo patch svc productpage -p '{"spec": {"type": "LoadBalancer"}}'
```


```bash
# deploy prometheus and grafana
kubectl apply -f https://raw.githubusercontent.com/cilium/cilium/v1.13/examples/kubernetes/addons/prometheus/monitoring-example.yaml
```