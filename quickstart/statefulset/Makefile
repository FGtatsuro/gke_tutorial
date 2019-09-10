.PHONY: apply destroy

apply:
	kubectl apply -k .

destroy:
	kubectl delete -k .
	kubectl delete pvc -l app=statefulset-demo
