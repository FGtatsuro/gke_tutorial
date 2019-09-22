.PHONY: apply destroy verify

apply:
	kubectl apply -k .

destroy:
	kubectl delete -k .

verify:
	OUT=`kubectl get secret secret -o template --template='{{range $$k, $$v := .data}}{{printf "%s=%s\n" $$k $$v}}{{end}}'`; \
		echo $$OUT | grep fromfile.properties && echo $$OUT | grep fromliteral;
