.PHONY: apply destroy verify

apply:
	kubectl apply -k .

destroy:
	kubectl delete -k .

verify:
	POD_NAME=`kubectl get pods -o json | \
		 python3 -c "import json, sys; print(json.loads(sys.stdin.read())['items'][0]['metadata']['name'], end='')"`; \
	CLUSTER_IP=`kubectl get services -l app=hello -o json | \
		 python3 -c "import json, sys; print(json.loads(sys.stdin.read())['items'][0]['spec']['clusterIP'], end='')"`; \
	kubectl exec -it $$POD_NAME -- /bin/sh -c "apk add --no-cache curl && curl $$CLUSTER_IP:8080"
