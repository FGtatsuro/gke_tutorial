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
	@if [ -z "`which peco`" ]; then \
		printf "\33[31m%s\33[0m\n" "peco doesn't exist on PATH. 👿"; \
		exit 1; \
	fi
	@printf "\33[32m%s\33[0m\n" "peco: OK"
	@printf "\33[32m%s\33[0m\n" "ALL OK! Let's start! 🌟"


.PHONY: cluster
.PHONY: quickstart/loadbalancer quickstart/clusterip quickstart/nodeport quickstart/job quickstart/cronjob quickstart/volume quickstart/persistent_volume quickstart/namespace quickstart/statefulset quickstart/statefulset_existing_pd quickstart/daemonset quickstart/configmap

cluster:
	@(make -C cluster `cat cluster/Makefile | grep -P '^[-_0-9a-zA-Z]+:' | sed s/://g | peco`)

quickstart/loadbalancer:
	@(make -C quickstart/loadbalancer `cat quickstart/loadbalancer/Makefile | grep -P '^[-_0-9a-zA-Z]+:' | sed s/://g | peco`)

quickstart/clusterip:
	@(make -C quickstart/clusterip `cat quickstart/clusterip/Makefile | grep -P '^[-_/0-9a-zA-Z]+:' | sed s/:.*$$//g | peco`)

quickstart/nodeport:
	@(make -C quickstart/nodeport `cat quickstart/nodeport/Makefile | grep -P '^[-_/0-9a-zA-Z]+:' | sed s/:.*$$//g | peco`)

quickstart/job:
	@(make -C quickstart/job `cat quickstart/job/Makefile | grep -P '^[-_0-9a-zA-Z]+:' | sed s/://g | peco`)

quickstart/cronjob:
	@(make -C quickstart/cronjob `cat quickstart/cronjob/Makefile | grep -P '^[-_0-9a-zA-Z]+:' | sed s/://g | peco`)

quickstart/volume:
	@(make -C quickstart/volume `cat quickstart/volume/Makefile | grep -P '^[-_0-9a-zA-Z]+:' | sed s/://g | peco`)

quickstart/persistent_volume:
	@(make -C quickstart/persistent_volume `cat quickstart/persistent_volume/Makefile | grep -P '^[-_/0-9a-zA-Z]+:' | sed s/:.*$$//g | peco`)

quickstart/namespace:
	@(make -C quickstart/namespace `cat quickstart/namespace/Makefile | grep -P '^[-_/0-9a-zA-Z]+:' | sed s/:.*$$//g | peco`)

quickstart/statefulset:
	@(make -C quickstart/statefulset `cat quickstart/statefulset/Makefile | grep -P '^[-_/0-9a-zA-Z]+:' | sed s/:.*$$//g | peco`)

quickstart/statefulset_existing_pd:
	@(make -C quickstart/statefulset_existing_pd `cat quickstart/statefulset_existing_pd/Makefile | grep -P '^[-_/0-9a-zA-Z]+:' | sed s/:.*$$//g | peco`)

quickstart/daemonset:
	@(make -C quickstart/daemonset `cat quickstart/daemonset/Makefile | grep -P '^[-_/0-9a-zA-Z]+:' | sed s/:.*$$//g | peco`)

quickstart/configmap:
	@(make -C quickstart/configmap `cat quickstart/configmap/Makefile | grep -P '^[-_/0-9a-zA-Z]+:' | sed s/:.*$$//g | peco`)
