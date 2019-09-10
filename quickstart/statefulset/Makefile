.PHONY: apply destroy list_pv list_disk

apply:
	kubectl apply -k .

destroy:
	kubectl delete -k .
	kubectl delete pvc -l app=statefulset-demo

list_pv:
	kubectl get pvc -l app=statefulset-demo -o template --template='{{range .items}}{{printf "%s:%s\n" .metadata.name .spec.volumeName}}{{end}}'

# TODO: Improve filter regular expression
list_disk:
	gcloud compute disks list --filter="name~'-pvc-'"
