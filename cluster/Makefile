.PHONY: create preview update destroy config

create:
	if [ -z "`gcloud container clusters list | grep gke-tutorial`" ]; then \
		gcloud deployment-manager deployments create gke-tutorial --template main.jinja --automatic-rollback-on-error && \
		gcloud container clusters get-credentials gke-tutorial; \
	fi

preview:
	if [ -n "`gcloud container clusters list | grep gke-tutorial`" ]; then \
		gcloud deployment-manager deployments update gke-tutorial --template main.jinja --preview; \
	fi

update:
	if [ -n "`gcloud container clusters list | grep gke-tutorial`" ]; then \
		gcloud deployment-manager deployments update gke-tutorial; \
	fi

destroy:
	if [ -n "`gcloud container clusters list | grep gke-tutorial`" ]; then \
		gcloud deployment-manager deployments delete gke-tutorial; \
	fi

config:
	gcloud container clusters get-credentials gke-tutorial
