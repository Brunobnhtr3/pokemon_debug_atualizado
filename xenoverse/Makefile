include ../lib.mk

WD = $(CURDIR)/tmp

PYTHON = python
PIP = pip

.PHONY: clean
clean:
	@rm -rf $(WD)

.PHONY: requirements.txt
requirements.txt:
	@$(PIP) install --ignore-installed --break-system-packages -r requirements.txt

.PHONY: decompile-scripts
decompile-scripts: check-pokemon-xenoverse requirements.txt clean
	@mkdir $(WD)
	@$(PYTHON) main.py --decompile $(WD) $(POKEMON_XENOVERSE)/Data/Scripts.xvd

.PHONY: decompile
decompile: decompile-scripts

.PHONY: pokemon-debug-menu
pokemon-debug-menu:
	@cd tmp && (git init && git add . && git commit --message init || true) && git apply ../$@.patch && git commit --message $@ && cd ..

.PHONY: compile-scripts
compile-scripts: check-pokemon-xenoverse
	@$(PYTHON) main.py --compile $(WD) $(POKEMON_XENOVERSE)/Data/Scripts.xvd

.PHONY: compile
compile: compile-scripts

.PHONY: check-pokemon-xenoverse
check-pokemon-xenoverse:
ifndef POKEMON_XENOVERSE
	$(error POKEMON_XENOVERSE must be set to path/to/pokemon/xenoverse)
endif
