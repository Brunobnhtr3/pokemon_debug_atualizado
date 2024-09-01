WD = $(CURDIR)/tmp
POKEMON_URANIUM = $(HOME)/Desktop

.PHONY: rgssad
rgssad:
	@git submodule update --force

.PHONY: unpackd
unpackd: rgssad
	@cd $@ && bundle install && cd ..
	@cd $@ && git apply ../unpackd.patch && cd ..

.PHONY: decompile-rgssad
decompile-rgssad: rgssad
	@rm -rf $(WD)
	@cd rgssad && cargo run unpack $(POKEMON_URANIUM)/Uranium.rgssad $(WD) && cd ..
	
.PHONY: decompile-scripts
decompile-scripts: unpackd
	@echo "RPGXP 1.02" > $(WD)/Game.rxproj
	@cd unpackd && bundle install && cd ..
	@cd unpackd && bundle exec unpackd --extract --project $(WD) --files scripts && cd ..

.PHONY: decompile
decompile: decompile-rgssad decompile-scripts

.PHONY: compile-scripts
compile-scripts: unpackd
	@cd unpackd && bundle exec unpackd --combine --project $(WD) --files scripts && cd ..
	@rm -rf $(WD)/Game.rxproj $(WD)/Data/Backup $(WD)/Data/Scripts $(WD)/Data/YAML

.PHONY: compile-rgssad
compile-rgssad: rgssad
	@cd rgssad && cargo run pack $(WD) $(POKEMON_URANIUM)/Uranium.rgssad && cd ..

.PHONY: compile
compile: compile-scripts compile-rgssad
