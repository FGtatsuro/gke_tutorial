.PHONY: app/create app/destroy

app/create: cluster/config
	kubectl apply -k app

app/destroy: cluster/config
	kubectl delete -k app
