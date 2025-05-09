# Pokemon Flux

Pokemon Flux obfuscates its Ruby scripts by placing them in `.fpk` files which are somehow extractable and compressable with [7-Zip](https://www.7-zip.org/). Extract them, edit them as desired, re-compress them, and replace the original `.fpk` with the resulting `.zip`.

Contains a script that uses a 7-Zip CLI, to zip and unzip an `.fpk`.

```sh
# Extract scripts from Source/Main/A_0.fpk
make decompile POKEMON_FLUX=path/to/pokemon/flux
# Edit the extract scripts as desired, then compile them back to Source/Main/A_0.fpk
make compile POKEMON_FLUX=path/to/pokemon/flux
```

Contains a [patch](pokemon-debug-menu-v1.patch) for implementing a Pokemon debug menu in Pokemon Flux to allow editing of a Pokemon's Nature, EVs and IVs to avoid senseless breeding/resetting grind.

```sh
make decompile pokemon-debug-menu compile POKEMON_FLUX=path/to/pokemon/flux
```

Backwards compatibility for Episode 1.

```sh
make decompile pokemon-debug-menu compile POKEMON_FLUX=path/to/pokemon/flux V1="true"
```
