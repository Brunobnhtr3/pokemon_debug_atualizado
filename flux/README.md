# Pokemon Flux

Pokemon Flux obfuscates its Ruby scripts by placing them in `.fpk` files which are some extractable and compressable with [7-Zip](https://www.7-zip.org/). Extract them, edit them as desired, re-compress them, and replace the original `.fpk` with the resulting `.zip`.

Contains a script that uses `7za`, a 7-Zip CLI, to zip and unzip `A_0.fpk`. To use it, install `7za`.

```sh
# Extract scripts from Source/Main/A_0.fpk
make decompile POKEMON_FLUX=path/to/pokemon/flux
# Edit the extract scripts as desired, then compile them back to Source/Main/A_0.fpk
make compile POKEMON_FLUX=path/to/pokemon/flux
```

Contains a [patch](pokemon-debug-menu.patch) for implementing a Pokemon debug menu in Pokemon Flux to allow editing of a Pokemon's Nature, EVs and IVs to avoid senseless breeding/resetting grind. To use it, install [`cargo`](https://doc.rust-lang.org/cargo/getting-started/installation.html), and [`gem`](https://www.ruby-lang.org/en/documentation/installation/), respectively.

```sh
make decompile pokemon-debug-menu compile POKEMON_FLUX=path/to/pokemon/flux
```

