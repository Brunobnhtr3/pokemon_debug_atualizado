# Pokemon Xenoverse

Contains a [Python script](main.py) for converting Pokemon Xenoverse's Ruby scripts and its compiled `Scripts.xvd` back and forth, based on https://github.com/godmodemaker/xenoscr-comdecom.

```sh
# Install dependencies.
pip install -r requirements.txt
# Extract scripts from Data/Scripts.xvd
python main.py --decompile /path/to/extract/scripts/  /path/to/PokemonXenoverse/Data/Scripts.xvd
# Edit the extract scripts as desired, then compile them back to Scripts.xvd
python main.py --compile /path/to/extract/scripts/  /path/to/PokemonXenoverse/Data/Scripts.xvd
```

Note that the Pokemon Xenoverse installation actually installs a launcher which then installs the game in a subdirectory of the launcher's installation, so `/path/to/Pokemon/Xenoverse/Data/Scripts.xvd` is likely something more convoluted e.g. `/path/to/PokemonXenoverseLauncher/Xenoverse Per Aspera Ad Astra/Xenoverse-public-1.5.5/Xenoverse/Data/Scripts.xvd`

Contains a reference [Ruby file](new-party.rb) for implementing a debug menu in Pokemon Xenoverse to allow editing of a Pokemon's Nature, EVs and IVs to avoid senseless breeding/resetting grind. Omits the `###_NewParty.rb` naming scheme of the Pokemon Xenoverse scripts and the rest of the code in that file as those things are liable to change independently. To use this reference, "merge" the class defined in it with the same class defined in the Pokemon Xenoverse scripts e.g. `###_NewParty.rb`, with the reference taking priority if both define the same function.
