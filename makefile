.DEFAULT_GOAL := documentation

documentation:
	@echo "startapp"
	@echo "buildapp"
	@echo "nakepod"
	@echo "imperative"
	@echo "service"
	@echo "curl_pod"
	@echo "patch_service"

startapp::
	@printf 'go run main.go'

buildapp:
	@echo "docker build -t dejanualex/go_hello:1.0 ." 
	@echo "docker run --rm -p 5555:8888 dejanualex/go_hello:1.0"
	@echo "docker push dejanualex/go_hello:1.0" 

nakedpod::
	@echo "kubectl run basic --image=dejanualex/go_hello:1.0  --port=8888"

imperative::
	@echo "kubectl create deployment webapp --image=dejanualex/go_hello:1.0"
	@echo "kubectl tree deploy webapp"
	@echo "kubectl get deploy webapp -oyaml > t.yaml"

service:
	@echo "kubectl expose deploy webapp --name=webapp-svc --type="ClusterIP" --port=8080 --target-port=8888"
	@echo "curl  webapp-svc.default.svc.cluster.local:8080/hi"
curl_pod:
	@echo "kubectl run curlpod -i --tty --image=dejanualex/curlopenssl:1.0 --rm -- sh"
patch_service:
	@echo "kubectl patch svc webapp-svc -p '{\"spec\": {\"type\": \"LoadBalancer\"}}'"
