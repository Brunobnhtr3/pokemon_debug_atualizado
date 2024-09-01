PYTHON = python
PIP = pip

WD = $(CURDIR)/tmp

.PHONY: clean
clean:
	@rm -rf $(WD)

.PHONY: requirements.txt
requirements.txt: check-python
	@$(PIP) install --ignore-installed --break-system-packages -r requirements.txt

.PHONY: decompile-scripts
decompile-scripts: check-pokemon-xenoverse requirements.txt clean
	@mkdir $(WD)
	@$(PYTHON) main.py --decompile $(WD) $(POKEMON_XENOVERSE)/Data/Scripts.xvd

.PHONY: decompile
decompile: decompile-scripts

.PHONY: pokemon-debug-menu
pokemon-debug-menu: check-git
	@cd tmp && git init && git add . && git commit --message init && git apply ../$@.patch && cd ..
	@rm -rf tmp/.git

.PHONY: compile-scripts
compile-scripts: check-pokemon-xenoverse check-python
	@$(PYTHON) main.py --compile $(WD) $(POKEMON_XENOVERSE)/Data/Scripts.xvd

.PHONY: compile
compile: compile-scripts

.PHONY: check-pokemon-xenoverse
check-pokemon-xenoverse:
ifndef POKEMON_XENOVERSE
	$(error POKEMON_XENOVERSE must be set to path/to/pokemon/xenoverse)
endif

.PHONY: check-git
check-git:
ifeq ($(shell command -v git 2>/dev/null),)
    $(error "git is not installed")
endif

.PHONY: check-python
check-python:
ifeq ($(shell command -v $(PYTHON) 2>/dev/null),)
    $(error "$(PYTHON) is not installed")
endif
ifeq ($(shell command -v $(PIP) 2>/dev/null),)
    $(error "$(PIP) is not installed")
endif
