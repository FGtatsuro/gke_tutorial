.PHONY: cluster/create cluster/destroy

cluster/create:
	if [ -z "`gcloud container clusters list | grep quickstart`" ]; then \
		gcloud deployment-manager deployments create quickstart --template cluster/main.jinja --automatic-rollback-on-error; \
	fi

cluster/destroy:
	if [ -n "`gcloud container clusters list | grep quickstart`" ]; then \
		gcloud deployment-manager deployments delete quickstart; \
	fi


.PHONY: app/create app/destroy

app/create:
	kubectl apply -k app

app/destroy:
	kubectl delete -k app
