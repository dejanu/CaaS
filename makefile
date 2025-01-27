.DEFAULT_GOAL := documentation

documentation:
	@echo "metrics"
	@echo "buildapp"
	@echo "nakepod"
	@echo "imperative"
	@echo "declarative"
	@echo "service"
	@echo "curl_pod"
	@echo "patch_service"
	@echo "rollout"

metrics:
	@echo "kubectl get --raw /apis/metrics.k8s.io/v1beta1/pods | jq .items[].containers[].usage"

startapp::
	@printf 'go run go_hello/main.go'

buildapp:
	@echo "docker build -t dejanualex/gohello:1.0  -f go_hello/Dockerfile go_hello"  
	@echo "docker run --rm -p 5555:8888 dejanualex/gohello:1.0"
	@echo "docker push dejanualex/gohello:1.0" 

nakedpod::
	@echo "kubectl run basic --image=dejanualex/gohello:1.0  --port=8888"

imperative::
	@echo "kubectl create deployment webapp --image=dejanualex/gohello:1.0 --replicas=1"

declarative::
	@echo "kubectl tree deploy webapp"
	@echo "kubectl get deploy webapp -oyaml > t.yaml"

service:
	@echo "kubectl expose deploy webapp --name=webapp-svc --type="ClusterIP" --port=8080 --target-port=8888"
	@echo "curl  webapp-svc.default.svc.cluster.local:8080"
curl_pod:
	@echo "kubectl run curlpod -i --tty --rm --image=dejanualex/curlopenssl:1.0 -- sh"
patch_service:
	@echo "kubectl patch svc webapp-svc -p '{\"spec\": {\"type\": \"LoadBalancer\"}}'"
rollout:
	@echo "kubectl set image deploy webapp gohello=dejanualex/gohello:1.1"




# kubectl top po -A
# kubectl top po -A --sort-by=memory
# kubectl top po -A --sort-by=memory -v=6
# kubectl top po -A --sort-by=memory -v=9
# kubectl get --raw /apis/metrics.k8s.io/v1beta1/pods | jq .items[].containers[].usage
# kubectl top po -A --sort-by=memory --use-protocol-buffers


# get container name
# kubectl get po -l app=webapp -o jsonpath="{.items[0].spec.containers[0].name}"
# kubectl rollout status deploy webapp"
# "kubectl rollout history deploy webapp"
# "kubectl rollout undo deploy webapp --to-revision=1"
