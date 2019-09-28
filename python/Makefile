setup-python-virtualenv:  ## Setup python virtualenv
	$(eval $(call check-var,PROJECT_ROOT))
	$(eval $(call check-var,PROJECT_NAME))
	$(eval $(call check-var,PYTHON_VERSION))
	@devtools/python/create-virtualenv.sh $(PROJECT_ROOT) $(PROJECT_NAME) $(PYTHON_VERSION) && \
	devtools/python/show-source-virtualenv.sh

setup-python-project:  ## Setup a python project
	@devtools/python/check-virtualenv.sh $(shell pwd) && \
	make _setup-project
