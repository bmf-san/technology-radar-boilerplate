.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

.PHONY: run
run: ## Run docker container.
	docker run --rm -p 8080:80 -e SERVER_NAMES="localhost 127.0.0.1" -v $$(pwd)/files/:/opt/build-your-own-radar/files wwwthoughtworks/build-your-own-radar