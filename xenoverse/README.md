# Pokemon Xenoverse

Contains a [Python script](main.py) for converting Pokemon Xenoverse's Ruby scripts and its compiled `Scripts.xvd` back and forth, based on https://github.com/godmodemaker/xenoscr-comdecom.

```sh
# Extract scripts from Data/Scripts.xvd
make decompile POKEMON_XENOVERSE=path/to/pokemon/xenoverse
# Edit the extract scripts as desired, then compile them back to Scripts.xvd
make compile POKEMON_XENOVERSE=path/to/pokemon/xenoverse
```

Note that the Pokemon Xenoverse installation actually installs a launcher which then installs the game in a subdirectory of the launcher's installation, so `/path/to/pokemon/xenoverse` is likely something more convoluted e.g. `/path/to/pokemon/xenoverse/launcher/Xenoverse Per Aspera Ad Astra/Xenoverse-public-1.5.5/Xenoverse`

Contains a [patch](pokemon-debug-menu.patch) for implementing a debug menu in Pokemon Xenoverse to allow editing of a Pokemon's Nature, EVs and IVs to avoid senseless breeding/resetting grind.

```sh
make decompile pokemon-debug-menu compile POKEMON_XENOVERSE=path/to/pokemon/xenoverse
```
