.DEFAULT_GOAL := documentation

documentation:
	@echo "make flex"
	@echo "make declarative"
	@echo "make imperative"
	@echo "make imperative_safe"
	@echo "make naked_pod"
	@echo "patch_service"
	@echo "deploy_checks"

flex:
	@echo "kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes" | jq .items[].usage"
declarative:
	@echo "kubectl apply -f deployment.yaml"
imperative_deploy:
	@echo "kubectl create deployment webapp --image=dejanualex/python_hello:1.0 --replicas=2"
imperative_safe:
	@echo "kubectl create deployment webapp --image=dejanualex/python_hello:1.1 --replicas=2 --dry-run=client -oyaml"
imperative_service:
	@echo "kubectl expose deploy webapp --name=webapp-svc --type="ClusterIP" --port=8080 --target-port=5555"
naked_pod:
	@echo "kubectl run curlopenssl -i --tty --image=dejanualex/curlopenssl:1.0 --rm -- sh"
patch_service:
	@echo "kubectl patch svc webapp-svc -p '{\"spec\": {\"type\": \"LoadBalancer\"}}'"
deploy_checks:
	@echo "kubectl rollout status deployment webapp"
	@echo "kubectl rollout history deployment webapp"
deploy_change_image:
	@echo "kubectl set image deployment webapp webapp=dejanualex/python_hello:1.1"
