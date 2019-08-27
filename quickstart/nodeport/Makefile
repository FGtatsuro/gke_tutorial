.PHONY: apply destroy verify

apply:
	kubectl apply -k .

destroy:
	kubectl delete -k .

verify:
	NODE_NAME=`kubectl get pods -o json | \
		  python3 -c "import json, sys; print(json.loads(sys.stdin.read())['items'][0]['spec']['nodeName'])"`; \
	EXTERNAL_IP=`kubectl get nodes $$NODE_NAME -o json | \
		    python3 -c "import json, sys; print([a for a in json.loads(sys.stdin.read())['status']['addresses'] if a['type'] == 'ExternalIP'][0]['address'])"`; \
	NODE_PORT=`kubectl get services hello-server -o json | \
		 python3 -c "import json, sys; print(json.loads(sys.stdin.read())['spec']['ports'][0]['nodePort'])"`; \
	if [ -z "`gcloud compute firewall-rules list --filter='name:test-node-port' 2>/dev/null`" ]; then \
		gcloud compute firewall-rules create test-node-port --allow tcp:$$NODE_PORT; \
	fi; \
	curl $$EXTERNAL_IP:$$NODE_PORT; \
	gcloud compute firewall-rules delete test-node-port
