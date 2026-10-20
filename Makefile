.PHONY: help
help:  ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-40s\033[0m %s\n", $$1, $$2}'

.PHONY: build-all
build-all: build-old-tz build-new-tz  ## Build both docker images.

.PHONY: build-old-tz
build-old-tz:  ## Build a docker container with the old tz data
	docker build -f Dockerfile.old -t "babel-tz-data-example:old" .

.PHONY: build-new-tz
build-new-tz:  ## Build a docker container with
	docker build -f Dockerfile.new -t "babel-tz-data-example:new" .

.PHONY: run-all
run-all: build-all  ## Run all
	docker run "babel-tz-data-example:old"
	docker run "babel-tz-data-example:new"

.PHONY: run-old
run-old: build-old-tz  ## Run the container with the old TZ data.
	docker run "babel-tz-data-example:old"

.PHONY: run-new
run-new: build-new-tz   ## Run the container with the new TZ data.
	docker run "babel-tz-data-example:new"

