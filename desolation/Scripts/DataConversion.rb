def convertSaveFolder
  folder = RTP.getSaveFolder
  #load in data needed for conversions
  File.open("Scripts/ConversionClasses.rb"){|f| eval(f.read) }
  #IDs are not compiled; this grabs them directly from their PBS hash
  File.open("Scripts/"+GAMEFOLDER+"/montext.rb"){|f| eval(f.read) }
  File.open("Scripts/"+GAMEFOLDER+"/movetext.rb"){|f| eval(f.read) }
  File.open("Scripts/"+GAMEFOLDER+"/itemtext.rb"){|f| eval(f.read) }
  File.open("Scripts/"+GAMEFOLDER+"/abiltext.rb"){|f| eval(f.read) }
  #errors here are terrifying and we like safety
  Dir.mkdir(folder+"Conversion Backup") unless (File.exists?(folder+"Conversion Backup"))
  backupSaves = Dir.entries(folder+"Conversion Backup")
  filecount = 0
  conversioncount = 0
  Dir.foreach(folder) do |filename|
    next if filename == '.' || filename == '..' || filename == "Conversion Backup" || !filename.end_with?(".rxdata")
    filecount += 1
    data = ""
    File.open(RTP.getSaveFileName(filename),"rb"){|file|
      data = Marshal.load(file)
    }
    save_data(data,(folder+"Conversion Backup/"+filename))
  end
  return if filecount == 0
  Dir.foreach(folder) do |filename|
    next if filename == '.' || filename == '..' || filename == "Conversion Backup" || !filename.end_with?(".rxdata")
    conversioncount += 1
    newsave = {}
    puts filename
    filename = folder + filename
    begin #protection for corrupt saves
      File.open(filename){|f|
        trainer    = Marshal.load(f)
        next if trainer.is_a?(Hash) #if it's a hash, then this save has already been converted.
        newsave[:playtime]   = Marshal.load(f)
        newsave[:system]     = Marshal.load(f)
        Marshal.load(f) #dropping pokemonsystem in favor of clientdata
        newsave[:map_id]    = Marshal.load(f) # Current map id no longer needed
        #REJUV SILLY MAPS GO HERE TO CATCH
        newsave[:switches]  = Marshal.load(f) # Why does removing these break shit
        newsave[:variable]  = Marshal.load(f)
        newsave[:self_switches]     = Marshal.load(f)
        newsave[:game_screen]   = Marshal.load(f)
        Marshal.load(f) #killing mapfactory????
        newsave[:game_player]   = Marshal.load(f)
        global     = Marshal.load(f)
        newsave[:PokemonMap] = Marshal.load(f)
        bag    = Marshal.load(f)
        storage    = Marshal.load(f)
        
        bag = collectItems(bag,global.pcItemStorage)
        global.pcItemStorage = nil if global.pcItemStorage
        trainer = convertTrainer(trainer)
        storage = convertStorage(storage)
        trainer = convertDex(trainer,storage)
        global = convertGlobal(global)
        newsave[:PokemonBag] = bag
        newsave[:Trainer] = trainer
        newsave[:PokemonStorage] = storage
        newsave[:PokemonGlobal] = global
        #print "stop"
        save_data(newsave,filename)
        
      }
      percent = (100.0*conversioncount/filecount).round
      System.set_window_title("#{percent}\% converted...")
    rescue
      puts "Save '#{filename}' is corrupt!"
      puts $1, $@
      filecount -= 1
      next
    end
  end
end
def collectItems(bag,pc)
  newbag = PokemonBag.new()
  for pocket in bag.pockets #get all of the items out of the bag
    next if pocket == nil
    for item in pocket #get all the items in a pocket
      next if item == nil
      itemsym = nil
      item[0] = itemfixer(item[0]) if Desolation
      for i in ITEMHASH.keys #convert pocket item to symbol
        if ITEMHASH[i][:ID] == item[0]
          itemsym = i
          break
        end
      end
      #puts itemsym
      newbag.pbStoreItem(itemsym,  item[1]) #it's basically just a discount hash.
    end
  end
  return newbag if !pc #if you don't have an item pc, you're free to go.
  for item in 0...pc.length #pc is a little less complicated.
    itemsym = nil
    for i in ITEMHASH.keys #convert pocket item to symbol
      if ITEMHASH[i][:ID] == item[0]
        itemsym = i
        break
      end
    end
    newbag.pbStoreItem(itemsym,  item[1]) #it's basically just a discount hash.
  end
  return newbag
end

def convertTrainer(trainer)
  newparty = []
  for mon in trainer.party
    newparty.push(convertMon(mon))
  end
  trainer.party = newparty
  $cache.trainertypes.each{|sym, data|
    $Trainer.trainertype = sym if data.checkFlag?(:ID) == $Trainer.trainertype
  }
  $Trainer.trainertype = $cache.trainertypes.keys[0] if $Trainer.trainertype.is_a?(Integer)
  return trainer
end

def convertStorage(storage)
  for box in 0...storage.maxBoxes
    newbox = []
    for index in 0...storage[box].length
      mon = storage[box, index]
      next if !mon
      storage[box, index] = convertMon(mon)
    end
  end
  return storage
end

def convertDex(trainer,storage)
  #newtrainer = deep_copy(trainer)
  if !trainer.pokedex.nil?
    puts "Converting dex..."
    time = Time.now
    newdex = Pokedex.new()
    for mon in 1...newdex.dexList.length
      symbol = $cache.pkmn.keys[mon - 1]
      newdex.dexList[symbol][:seen?] = trainer.seen[mon]
      newdex.dexList[symbol][:owned?] = trainer.owned[mon]
      newdex.dexList[symbol][:shadowCaught?] = trainer.shadowcaught[mon]
    end
    newdex.canViewDex = trainer.pokedex
    trainer.pokedex = newdex
    for boxes in storage.boxes
      for mon in boxes
        if mon != nil
          trainer.pokedex.setFormSeen(mon)
        end
      end
    end
    trainer.seen = nil
    trainer.owned = nil
    trainer.shadowcaught = nil
    trainer.formseen = nil
    trainer.formlastseen = nil
    puts "Done! - Took #{Time.now - time} sec"
  end
  return trainer
end

def convertGlobal(global)
  daycare = []
  if global.daycare[0][0]
    newmon = convertMon(global.daycare[0][0])
    global.daycare[0][0] = newmon
  end
  if global.daycare[1][0]
    newmon = convertMon(global.daycare[1][0])
    global.daycare[1][0] = newmon
  end
  global.dependentEvents = [] if !global.dependentEvents
  global.hallOfFame = [] if !global.hallOfFame
  global.hallOfFameLastNumber = 0 if !global.hallOfFameLastNumber
  global.purifyChamber=PurifyChamber.new() if !global.purifyChamber
  return global
end

def convertMon(mon)
  newmoves = []
  for move in mon.moves
    for i in MOVEHASH.keys
      if MOVEHASH[i][:ID] == move.id
        newmove = PBMove.new(i)
        newmove.pp = move.pp
        newmove.ppup = move.ppup
        newmoves.push(newmove)
        break
      end
    end
  end
  mon.moves = newmoves
  firstmoves = []
  if !mon.firstmoves.nil?
    for move in mon.firstmoves
      for j in MOVEHASH.keys
        if MOVEHASH[j][:ID] == move
          newmove = PBMove.new(j)
          firstmoves.push(newmove.move)
          break
        end
      end
    end
    mon.firstmoves = firstmoves
  end
  mon.item = nil if mon.item == 0
  mon.item = itemfixer(mon.item) if Desolation
  for i in ITEMHASH.keys
    if ITEMHASH[i][:ID] == mon.item
      mon.item = i 
      break
    end
  end
  for i in BallHandlers::BallTypes.keys
    if i == mon.ballused
      mon.ballused = BallHandlers::BallTypes[i] 
      break
    end
  end
  for i in MONHASH.keys
    formname = MONHASH[i].keys[0]
    if MONHASH[i][formname][:dexnum] == mon.species
      mon.species = i 
      break
    end
  end
  mon.level = PBExp.levelFromExperience(mon.exp, mon.growthrate)
  mon.level = 1 if mon.isEgg?
  mon.form = 0 if !mon.form
  speed = mon.iv.delete_at(3)
  mon.iv.push(speed)
  speed = mon.ev.delete_at(3)
  mon.ev.push(speed)
  mon.initAbility
  mon.setNature($cache.natures.keys[mon.natureflag]) if mon.natureflag != nil
  mon.nature = $cache.natures.keys[mon.personalID%25]
  mon.status = nil if mon.status == 0
  return mon
end

def tempConvertNatures
  for mon in $Trainer.party
    next if mon.nature.is_a?(Symbol)
    mon.setNature($cache.natures.keys[mon.natureflag]) if mon.natureflag != nil
    mon.nature = $cache.natures.keys[mon.personalID%25]
    
  end
  for box in 0...$PokemonStorage.maxBoxes
    for index in 0...$PokemonStorage[box].length
      mon = $PokemonStorage[box, index]
      next if !mon
      next if mon.nature.is_a?(Symbol)
      mon.setNature($cache.natures.keys[mon.natureflag]) if mon.natureflag != nil
      mon.nature = $cache.natures.keys[mon.personalID%25]

    end
  end
end