include ../lib.mk

WD = $(CURDIR)/tmp

.PHONY: clean
clean:
	@rm -rf $(WD)
	@cd unpackd && git checkout . && cd ..

.PHONY: rgssad
rgssad:
	@git submodule update --force

.PHONY: unpackd
unpackd: rgssad
	@cd $@ && bundle install && cd ..
	@cd $@ && git apply ../unpackd.patch && cd ..

.PHONY: decompile-rgssad
decompile-rgssad: rgssad check-pokemon-uranium
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
pokemon-debug-menu:
	@cd tmp/Data/Scripts && (git init && git add . && git commit --message init || true) && git apply ../../../$@.patch && git commit --message $@ && cd -

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
