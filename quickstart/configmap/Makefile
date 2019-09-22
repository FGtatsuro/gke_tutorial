.PHONY: apply destroy verify

apply:
	kubectl apply -k .

destroy:
	kubectl delete -k .

verify:
	OUT=`kubectl get cm -o template --template='{{range .items}}{{range $$k, $$v := .data}}{{printf "%s=%s" $$k $$v}}{{end}}{{print "\n"}}{{end}}'`; \
		echo $$OUT | grep fromfile.properties=test1 && echo $$OUT | grep fromliteral=test2;
