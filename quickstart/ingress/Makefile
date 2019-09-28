.PHONY: apply destroy verify

apply:
	kubectl apply -k .

destroy:
	kubectl delete -k .

verify:
	curl -s `kubectl get ingress my-ingress -o template --template='{{(index .status.loadBalancer.ingress 0).ip}}'`/ | grep 'Hello, world!'
	curl -s `kubectl get ingress my-ingress -o template --template='{{(index .status.loadBalancer.ingress 0).ip}}'`/kube | grep 'Hello Kubernetes!'
