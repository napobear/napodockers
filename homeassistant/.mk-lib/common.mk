MK_DIR := $(ROOT_DIR)/.mk-lib
include $(MK_DIR)/variables.mk
-include $(MK_DIR)/version.mk
-include $(ROOT_DIR)/.make.env
-include .make.env

f ?= $(DOCKER_COMPOSE_FILE)
DOCKER_COMPOSE_FILE := $(f)

.DEFAULT_GOAL := help

help: ##@other Show this help.
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

confirm:
	@( read -p "$(RED)Are you sure? [y/N]$(RESET): " sure && case "$$sure" in [yY]) true;; *) false;; esac )

check-dependencies:
	@echo Checking dependencies
