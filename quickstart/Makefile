.PHONY: cluster/create cluster/destroy cluster/config

cluster/create:
	if [ -z "`gcloud container clusters list | grep quickstart`" ]; then \
		gcloud deployment-manager deployments create quickstart --template cluster/main.jinja --automatic-rollback-on-error; \
	fi

cluster/preview:
	if [ -n "`gcloud container clusters list | grep quickstart`" ]; then \
		gcloud deployment-manager deployments update quickstart --template cluster/main.jinja --preview; \
	fi

cluster/update:
	if [ -n "`gcloud container clusters list | grep quickstart`" ]; then \
		gcloud deployment-manager deployments update quickstart; \
	fi

cluster/destroy:
	if [ -n "`gcloud container clusters list | grep quickstart`" ]; then \
		gcloud deployment-manager deployments delete quickstart; \
	fi

cluster/config:
	gcloud container clusters get-credentials quickstart


.PHONY: app/create app/destroy

app/create: cluster/config
	kubectl apply -k app

app/destroy: cluster/config
	kubectl delete -k app
