# pkgtmpl/Makefile revision 001

SHELL:=/usr/bin/env bash

BUMP_VERSION = $(shell grep ^current_version .bumpversion.cfg | awk '{print $$NF}')
PROJECT_VERSION = $(BUMP_VERSION)

.PHONY: vars
vars:
	@echo "PROJECT_VERSION: $(PROJECT_VERSION)"
	@echo "BUMP_VERSION: $(BUMP_VERSION)"

.PHONY: version-sanity
version-sanity:
ifneq ($(PROJECT_VERSION), $(BUMP_VERSION))
	$(error Version mismatch PROJECT_VERSION != BUMP_VERSION)
endif
	@echo "Versions are equal $(PROJECT_VERSION), $(BUMP_VERSION), $(CONST_VERSION)"

.PHONY: changelog-check
changelog-check:
ifneq (,$(findstring dev,$(PROJECT_VERSION)))
	$(error Cannot pull request when dev version)
else ifeq (,$(shell grep $(PROJECT_VERSION) CHANGELOG.md))
	$(error No changelog entry for $(PROJECT_VERSION))
else ifneq (,$(shell grep Unreleased CHANGELOG.md))
	$(error Unreleased section in CHANGELOG.md)
else
	@echo "Changelog entry found for $(PROJECT_VERSION)"
endif

# vim: ft=Makefile
