.DEFAULT_GOAL := documentation

documentation:
	@echo "startapp"
	@echo "declarative_deploy"
	@echo "imperative_deploy"
	@echo "imperative_service"
	@echo "cleanup"

startapp:
	@echo "docker run -p 5555:5000 dejanualex/encryptapi:2.1"
imperative_deploy:
	@echo "kubectl create deployment webapp --image=dejanualex/encryptapi:2.1 --replicas=2"
imperative_service:
	@echo "kubectl expose deploy webapp --name=webapp-svc --type="LoadBalancer" --port=8080 --target-port=5000"
cleanup:
	kubectl delete deploy webapp && kubectl delete svc webapp-svc pythonapp-svc