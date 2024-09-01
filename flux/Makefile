WD = $(CURDIR)/tmp

.PHONY: clean
clean:
	@rm -rf $(WD)

.PHONY: decompile-scripts
decompile-scripts: check-pokemon-flux check-7za clean
	@7za -o$(WD) x $(POKEMON_FLUX)/Source/Main/A_0.fpk
	@find $(WD) -name "desktop.ini" -type f -exec rm -f {} +

.PHONY: decompile
decompile: decompile-scripts

.PHONY: pokemon-debug-menu
pokemon-debug-menu: check-git
	@cd tmp/Data/Scripts && git init && git add . && git commit --message init && git apply ../../../$@.patch && cd ../../..
	@rm -rf tmp/Data/Scripts/.git

.PHONY: compile-scripts
compile-scripts: check-pokemon-flux check-7za
	@cd $(WD) && 7za a $(POKEMON_FLUX)/Source/Main/A_0.fpk && cd ..

.PHONY: compile
compile: compile-scripts

.PHONY: check-pokemon-flux
check-pokemon-flux:
ifndef POKEMON_FLUX
	$(error POKEMON_FLUX must be set to path/to/pokemon/flux)
endif

.PHONY: check-git
check-git:
ifeq ($(shell command -v git 2>/dev/null),)
    $(error "git is not installed")
endif

.PHONY: check-7za
check-7za:	
ifeq ($(shell command -v 7za 2>/dev/null),)
    $(error "7za is not installed")
endif
