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
.PHONY: quickstart/stateless quickstart/job quickstart/cronjob quickstart/volume quickstart/persistent_volume

cluster:
	@(make -C cluster `cat cluster/Makefile | grep -P '^[-_0-9a-zA-Z]+:' | sed s/://g | peco`)

quickstart/stateless:
	@(make -C quickstart/stateless `cat quickstart/stateless/Makefile | grep -P '^[-_0-9a-zA-Z]+:' | sed s/://g | peco`)

quickstart/job:
	@(make -C quickstart/job `cat quickstart/job/Makefile | grep -P '^[-_0-9a-zA-Z]+:' | sed s/://g | peco`)

quickstart/cronjob:
	@(make -C quickstart/cronjob `cat quickstart/cronjob/Makefile | grep -P '^[-_0-9a-zA-Z]+:' | sed s/://g | peco`)

quickstart/volume:
	@(make -C quickstart/volume `cat quickstart/volume/Makefile | grep -P '^[-_0-9a-zA-Z]+:' | sed s/://g | peco`)

quickstart/persistent_volume:
	@(make -C quickstart/persistent_volume `cat quickstart/persistent_volume/Makefile | grep -P '^[-_/0-9a-zA-Z]+:' | sed s/:.*$$//g | peco`)
