.PHONY: apply destroy verify

apply:
	kubectl apply -k .

destroy:
	kubectl delete -k .

verify:
	EXTERNAL_IP=`kubectl get services hello-server -o json | \
		    python3 -c "import json, sys; print(json.loads(sys.stdin.read())['status']['loadBalancer']['ingress'][0]['ip'])"`; \
	curl $$EXTERNAL_IP:8080
