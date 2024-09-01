# Pokemon Uranium

Pokemon Uranium obfuscates its Ruby scripts by placing them in `Scripts.rxdata` which is then placed in `Uranium.rgssad`. The latter can be decompiled with:

Contains a [Rust CLI](rgssad) for packing and unpacking `Uranium.rgssad` and a [Ruby CLI](unpackd) for extracting and combining `Scripts.rxdata` with a patch to modify it slgithly for Pokemon Uranium.

```sh
# Extract scripts from Uranium.rgssad
make decompile POKEMON_URANIUM=path/to/pokemon/uranium
# Edit the extract scripts as desired, then compile them back to Uranium.rgssad
make compile POKEMON_URANIUM=path/to/pokemon/uranium
```

Contains a [patch](pokemon-debug-menu.patch) for implementing a Pokemon debug menu in Pokemon Uranium to allow editing of a Pokemon's Nature, EVs and IVs to avoid senseless breeding/resetting grind.

```sh
make decompile pokemon-debug-menu compile POKEMON_URANIUM=path/to/pokemon/uranium
```
