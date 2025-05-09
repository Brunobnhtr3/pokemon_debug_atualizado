# Pokemon Flux

Pokemon Flux obfuscates its Ruby scripts by placing them in `.fpk` files which are somehow extractable and compressable with [7-Zip](https://www.7-zip.org/). Extract them, edit them as desired, re-compress them, and replace the original `.fpk` with the resulting `.zip`.

Contains a script that uses a 7-Zip CLI, to zip and unzip an `.fpk`.

```sh
# Extract scripts from Data/Data_0.fpk.
make decompile POKEMON_FLUX=path/to/pokemon/flux
# Edit the extract scripts as desired, then compile them back to Data/Data_0.fpk.
make compile POKEMON_FLUX=path/to/pokemon/flux
# Use a different 7z CLI.
make compile POKEMON_FLUX=path/to/pokemon/flux 7Z=7za
make compile POKEMON_FLUX=path/to/pokemon/flux 7Z=7zzs
```

Backwards compatibility for Episode 1, which additionally includes a [patch](pokemon-debug-menu.patch) for implementing a Pokemon debug menu in Pokemon Flux Episode 1 to allow editing of a Pokemon's Nature, EVs and IVs to avoid senseless breeding/resetting grind.

```sh
make decompile pokemon-debug-menu compile POKEMON_FLUX=path/to/pokemon/flux V1="true"
```

In addition, contains a [patch](pokemon-debug-menu.patch) for implementing a Pokemon debug menu in Pokemon Flux Episode 1 to allow editing of a Pokemon's Nature, EVs and IVs to avoid senseless breeding/resetting grind.
