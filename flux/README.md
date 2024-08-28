# Pokemon Flux

Pokemon Flux obfuscates its Ruby scripts by placing them in `.fpk` files which are actually just `.zip` files. Extract them as `.zip`s using your favorite tool, edit them as desired, zip them back up and replace the original `.fpk` with the resulting `.zip`.

Contains reference Ruby files ([1](debug-menus.rb), [2](pokemon-party.rb)) for implementing a Pokemon debug menu.

Omits the `###_DebugMenus.rb`/`###_PokemonParty.rb` naming scheme of the Pokemon Flux scripts and the rest of the code in that file as those things are liable to change independently. To use this reference, "merge" the class defined in it with the same class defined in the Pokemon Flux scripts e.g. `###_DebugMenus.rb`, with the reference taking priority if both define the same function.

