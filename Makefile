# Makefile, ABr
# Simple project file for learning_ansible

# variables
DOCKER_IMAGE=mmumshad/ubuntu-ssh-enabled
ANSIBLE_CONTROLLER=ansible_controller
ANSIBLE_TARGETS=ansible_target_1 ansible_target_2 ansible_target_3

# pseudo-targets
.PHONY: all init build clean

all: build

build: init

init:
	@for i in $(ANSIBLE_CONTROLLER) $(ANSIBLE_TARGETS) ; do \
	  docker inspect --format='{{ .Id }}' $$i >/dev/null 2>&1 \
	    || docker run --detach --name $$i $(DOCKER_IMAGE) ; \
	done

