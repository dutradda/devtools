define check-var
ifndef $(1)
$$(error <$(1)> is a required variable!)
endif
endef

help:  ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

_setup-project:
	@devtools/common/setup-project.sh
