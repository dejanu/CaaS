.DEFAULT_GOAL := documentation

documentation:
	@echo "make flex"
	@echo "make imperative"
	@echo "make imperative_safe"
	@echo "make declarative"


flex:
	@echo "kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes" | jq .items[].usage"

declarative:
	@echo "kubectl apply -f deployment.yaml"
imperative_deploy:
	@echo "kubectl create deployment webapp  --image=nginx:1.17.8 --replicas=2"
imperative_safe:
	@echo "kubectl create deployment webapp --image=nginx:1.17.8 --replicas=2 --dry-run=client -oyaml"
imperative_service:
	@echo "kubectl expose deploy webapp --name=webapp-svc --type="ClusterIP" --port=8080 --target-port=80"
patch_service:
	@echo "kubectl patch svc webapp-svc -p '{"spec": {"type": "LoadBalancer"}}'"
