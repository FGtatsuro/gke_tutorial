.PHONY: apply destroy verify

apply:
	kubectl apply -k .

destroy:
	kubectl delete -k .

verify:
	OUT=`kubectl get cm -o template --template='{{range .items}}{{range $$k, $$v := .data}}{{printf "%s=%s\n" $$k $$v}}{{end}}{{end}}'`; \
		echo $$OUT | grep fromfile.properties=FROM_FILE=test1 && echo $$OUT | grep FROM_LITERAL=test2;
