include ../lib.mk

WD = $(CURDIR)/tmp

.PHONY: clean
clean:
	@rm -rf $(WD)

.PHONY: decompile-scripts
decompile-scripts: check-pokemon-flux clean
	@7za -o$(WD) x $(POKEMON_FLUX)/Source/Main/A_0.fpk
	@find $(WD) -name "desktop.ini" -type f -exec rm -f {} +

.PHONY: decompile
decompile: decompile-scripts

.PHONY: pokemon-debug-menu
pokemon-debug-menu:
	@cd tmp/Data/Scripts && (git init && git add . && git commit --message init || true) && git apply ../../../$@.patch && git commit --message $@ && cd -

.PHONY: compile-scripts
compile-scripts: check-pokemon-flux
	@cd $(WD) && 7za a $(POKEMON_FLUX)/Source/Main/A_0.fpk && cd ..

.PHONY: compile
compile: compile-scripts

.PHONY: check-pokemon-flux
check-pokemon-flux:
ifndef POKEMON_FLUX
	$(error POKEMON_FLUX must be set to path/to/pokemon/flux)
endif
