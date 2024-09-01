WD = $(CURDIR)/tmp

.PHONY: clean
clean: check-git
	@rm -rf $(WD)
	@cd unpackd && git checkout . && cd ..

.PHONY: rgssad
rgssad: check-git
	@git submodule update --force

.PHONY: check-ruby check-git unpackd
unpackd: rgssad
	@cd $@ && bundle install && cd ..
	@cd $@ && git apply ../unpackd.patch && cd ..

.PHONY: decompile-rgssad
decompile-rgssad: rgssad check-cargo check-pokemon-uranium
	@rm -rf $(WD)
	@cd rgssad && cargo run unpack $(POKEMON_URANIUM)/Uranium.rgssad $(WD) && cd ..

.PHONY: decompile-scripts
decompile-scripts: unpackd
	@echo "RPGXP 1.02" > $(WD)/Game.rxproj
	@cd unpackd && bundle install && cd ..
	@cd unpackd && bundle exec unpackd --extract --project $(WD) --files scripts && cd ..

.PHONY: decompile
decompile: decompile-rgssad decompile-scripts

.PHONY: pokemon-debug-menu
pokemon-debug-menu: check-git
	@cd tmp/Data/Scripts && git init && git add . && git commit --message init && git apply ../../../$@.patch && cd ../../..
# @rm -rf tmp/Data/Scripts/.git

.PHONY: compile-rgssad
compile-rgssad: rgssad check-pokemon-uranium
	@cd rgssad && cargo run pack $(WD) $(POKEMON_URANIUM)/Uranium.rgssad && cd ..

.PHONY: compile-scripts
compile-scripts: unpackd
	@cd unpackd && bundle exec unpackd --combine --project $(WD) --files scripts && cd ..
	@rm -rf $(WD)/Game.rxproj $(WD)/Data/Backup $(WD)/Data/Scripts $(WD)/Data/YAML

.PHONY: compile
compile: compile-scripts compile-rgssad

.PHONY: check-pokemon-uranium
check-pokemon-uranium:
ifndef POKEMON_URANIUM
	$(error POKEMON_URANIUM must be set to path/to/pokemon/uranium)
endif

.PHONY: check-git
check-git:
ifeq ($(shell command -v git 2>/dev/null),)
    $(error "git is not installed")
endif

.PHONY: check-cargo
check-cargo:
ifeq ($(shell command -v cargo 2>/dev/null),)
    $(error "cargo is not installed")
endif

.PHONY: check-ruby
check-ruby:
ifeq ($(shell command -v ruby 2>/dev/null),)
    $(error "ruby is not installed")
endif
ifeq ($(shell command -v bundle 2>/dev/null),)
    $(error "bundle is not installed")
endif
