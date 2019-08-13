.PHONY: create preview update destroy config

create:
	if [ -z "`gcloud container clusters list | grep quickstart`" ]; then \
		gcloud deployment-manager deployments create quickstart --template main.jinja --automatic-rollback-on-error; \
	fi

preview:
	if [ -n "`gcloud container clusters list | grep quickstart`" ]; then \
		gcloud deployment-manager deployments update quickstart --template main.jinja --preview; \
	fi

update:
	if [ -n "`gcloud container clusters list | grep quickstart`" ]; then \
		gcloud deployment-manager deployments update quickstart; \
	fi

destroy:
	if [ -n "`gcloud container clusters list | grep quickstart`" ]; then \
		gcloud deployment-manager deployments delete quickstart; \
	fi

config:
	gcloud container clusters get-credentials quickstart
