.PHONY: doctor

doctor:
	@if [ -z "`which gcloud`" ]; then \
		printf "\33[31m%s\33[0m\n" "gcloud doesn't exist on PATH. 👿"; \
		exit 1; \
	fi
	@printf "\33[32m%s\33[0m\n" "gcloud: OK"
	@if [ -z "`which kubectl`" ]; then \
		printf "\33[31m%s\33[0m\n" "kubectl doesn't exist on PATH. 👿"; \
		exit 1; \
	fi
	@if [ "`kubectl version -o json 2>/dev/null | python -c \"import sys, json; print(int(json.loads(sys.stdin.read())['clientVersion']['minor']) >= 14)\"`" = False ]; then \
		printf "\33[31m%s\33[0m\n" "kubectl version must be greater than 1.14.x. 👿"; \
		exit 1; \
	fi
	@printf "\33[32m%s\33[0m\n" "kubectl: OK"
	@if [ -z "`which kustomize`" ]; then \
		printf "\33[31m%s\33[0m\n" "kustomize doesn't exist on PATH. 👿"; \
		exit 1; \
	fi
	@printf "\33[32m%s\33[0m\n" "kustomize: OK"
	@printf "\33[32m%s\33[0m\n" "ALL OK! Let's start! 🌟"


.PHONY: quickstart/cluster/create quickstart/cluster/preview quickstart/cluster/update quickstart/cluster/destroy
.PHONY: quickstart/app/create quickstart/app/destroy

quickstart/cluster/create:
	make -C quickstart cluster/create

quickstart/cluster/preview:
	make -C quickstart cluster/preview

quickstart/cluster/update:
	make -C quickstart cluster/update

quickstart/cluster/destroy:
	make -C quickstart cluster/destroy

quickstart/app/create:
	make -C quickstart app/create

quickstart/app/destroy:
	make -C quickstart app/destroy
