.PHONY: apply destroy

apply:
	if [ -z "`gcloud deployment-manager deployments list | grep statefulset-existing-pd`" ]; then \
		gcloud deployment-manager deployments create statefulset-existing-pd \
			--template pd/main.jinja \
			--automatic-rollback-on-error; \
	fi
	kubectl apply -k ./pd
	kubectl apply -k .

destroy:
	kubectl delete -k .
	# NOTE: PV deletion hangs when PVC which uses these PV still exists
	kubectl delete pvc -l app=statefulset-existingpd-demo
	kubectl delete -k ./pd
	if [ -n "`gcloud deployment-manager deployments list | grep statefulset-existing-pd`" ]; then \
		gcloud deployment-manager deployments delete statefulset-existing-pd; \
	fi
