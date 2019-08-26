.PHONY: apply destroy

apply:
	if [ -z "`gcloud deployment-manager deployments list | grep quickstart-pd`" ]; then \
		gcloud deployment-manager deployments create quickstart-pd \
			--template pd/main.jinja \
			--automatic-rollback-on-error; \
	fi
	kubectl apply -k .

destroy:
	kubectl delete -k .
	if [ -n "`gcloud deployment-manager deployments list | grep quickstart-pd`" ]; then \
		gcloud deployment-manager deployments delete quickstart-pd; \
	fi
