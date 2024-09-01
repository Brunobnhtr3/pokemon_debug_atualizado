# Pokemon Uranium

Pokemon Uranium obfuscates its Ruby scripts by placing them in `Scripts.rxdata` which is then placed in `Uranium.rgssad`. The latter can be decompiled with:

```sh
make decompile-rgssad POKEMON_URANIUM=path/to/pokemon/uranium
```

Then, the former can be decompiled with:

```sh
make decompile-scripts
```

The scripts will then be extracted to [`tmp/Data/Scripts`](tmp/Data/Scripts). One script in particular cannot be inflated to UTF-8, so that one is skipped and cannot be edited within this repository.

Additionally, the file with `class GameMap` in it for some reason seems to have a syntax error `endend` at the end of it instead of:

```rb
# ...
  end
end
```

Contains a reference [Ruby file](pscreen-party.rb) for implementing a debug menu in Pokemon Uranium to allow editing of a Pokemon's Nature, EVs and IVs to avoid senseless breeding/resetting grind. Omits the `###_PScreen_Party.rb` naming scheme and the rest of the code in that file as those things are liable to change independently. To use this reference, "merge" the class defined in it with the same class defined in the Pokemon Xenoverse scripts e.g. `###_PScreen_Party.rb`, with the reference taking priority if both define the same function.

After editing the Ruby files as desired, recompile with:

```sh
make compile-scripts
make compile-rgssad POKEMON_URANIUM=path/to/pokemon/uranium
```
