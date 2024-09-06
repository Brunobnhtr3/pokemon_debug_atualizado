
###Yumil -- 37 -- Quest log -- BEGIN
def pbCompileQuestLog
  quests = []
  if File.exists?("PBS/quests.txt") 
    file = File.open("PBS/quests.txt", "r")
    file_data = file.read
    title=nil
    state=nil
    ismain =false
    objectives=[]
    file_data.each_line {|line|
      if line.chomp == "#-------------------"
        if objectives != [] || title !=nil
          quests<<[title, state,objectives,ismain]
          title = nil
          state = nil
          ismain= false
          objectives = []
        end
        title = nil
        state = nil
        ismain= false
        objectives = []
      elsif (objectives==[] && title ==nil && state ==nil)
        title = line.chomp.split(",")[0]
        state = line.chomp.split(",")[1]
        ismain= line.chomp.split(",")[2]
      elsif(line[0..1]=="##")
        
      else
        objectives << [line.chomp.split(",")[0],line.chomp.split(",")[1]]
      end
    }
    file.close
    save_data(quests,"Data/quests.dat")
    $game_variables[:QuestLog] = quests
  end
end
###-- Yumil -- 37 -- Quest Log -- END

datafiles=[
   "encounters.dat",
   "trainertypes.dat",
   "connections.dat",
   "items.dat",
   "metadata.dat",
   "townmap.dat",
   "trainers.dat",
   "attacksRS.dat",
   "dexdata.dat",
   "eggEmerald.dat",
   "evolutions.dat",
   "regionals.dat",
   "types.dat",
   "tm.dat",
   "phone.dat",
   "trainerlists.dat",
   "shadowmoves.dat",
   ###Yumil - 38 - Quest Log - Begin
   "quests.dat",
   ###Yumil - 38 - Quest Log - End
   "Constants.rxdata"
]

textfiles=[
   "moves.txt",
   "abilities.txt",
   "encounters.txt",
   "trainers.txt",
   "trainertypes.txt",
   "items.txt",
   "connections.txt",
   "metadata.txt",
   "townmap.txt",
   "pokemon.txt",
   "phone.txt",
   "trainerlists.txt",
   "shadowmoves.txt",
    ###Yumil - 39 - Quest Log - Begin
   "quests.txt",
    ###Yumil - 39 - Quest Log - End
   "tm.txt",
   "types.txt"
]

def pbCompileAllData(mustcompile)
  compilerruntime = Time.now
  FileLineData.clear
  if mustcompile
    if (!$INEDITOR || LANGUAGES.length<2) && pbRgssExists?("Data/messages.dat")
      MessageTypes.loadMessageFile("Data/messages.dat")
    end
    # No dependencies
    yield(_INTL("Compiling type data"))
    pbCompileTypes
    # No dependencies
    yield(_INTL("Compiling town map data"))
    pbCompileTownMap
    # No dependencies
    yield(_INTL("Compiling map connection data"))
    pbCompileConnections
    # No dependencies  
    yield(_INTL("Compiling ability data"))
    pbCompileAbilities
    # Depends on PBTypes
    yield(_INTL("Compiling move data"))
    pbCompileMoves
    # Depends on PBMoves
    yield(_INTL("Compiling item data"))
    pbCompileItems
    # Depends on PBMoves, PBItems, PBTypes, PBAbilities
    yield(_INTL("Compiling Pokemon data"))
    pbCompilePokemonData
    # Depends on PBSpecies, PBMoves
    yield(_INTL("Compiling machine data"))
    pbCompileMachines
    # Depends on PBSpecies, PBItems, PBMoves
    yield(_INTL("Compiling Trainer data"))
    pbCompileTrainers
    # Depends on PBTrainers
    yield(_INTL("Compiling metadata"))
    pbCompileMetadata
    # Depends on PBTrainers
    yield(_INTL("Compiling battle Trainer data"))
    pbCompileTrainerLists
    # Depends on PBSpecies
    yield(_INTL("Compiling encounter data"))
    pbCompileEncounters
    # Depends on PBSpecies, PBMoves
    yield(_INTL("Compiling shadow move data"))
    pbCompileShadowMoves
    ###Yumil -- 40 -- Quest log -- BEGIN
    yield(_INTL("Compiling Quest Log"))
    pbCompileQuestLog
    ###Yumil -- 40 -- Quest Log-- END
    yield(_INTL("Compiling messages"))
  else
    if (!$INEDITOR || LANGUAGES.length<2) && safeExists?("Data/messages.dat")
      MessageTypes.loadMessageFile("Data/messages.dat")
    end
  end
  pbCompileAnimations
  pbSetTextMessages
  MessageTypes.saveMessages
  if !$INEDITOR && LANGUAGES.length>=2
    pbLoadMessages("Data/"+LANGUAGES[$PokemonSystem.language][1])
  end
  totalcompilertime = Time.now - compilerruntime
end