def deep_copy(obj)
    return Marshal.load(Marshal.dump(obj))
end

def extractFormProc(data, key) #string of file contents from reading, specific hash proc value
    basefile = ""
	File.open("Scripts/"+GAMEFOLDER+"/montext.rb"){|f|
		basefile = f.read
	}
    basefilearr = basefile.split(/\n/)
    loc1 = data.source_location
    contents = basefilearr
    ret = contents[loc1[1] - 1]
    ret = ret[ret.index("p")..]
    
    return ret.chop if ret[-2..] == "},"

    for line in loc1[1]...contents.length
    line = contents[line].gsub(/\s+/," ")
    ret += "\n#{line}"

    break if checkStringBracketSyntax(ret, key)
    end
    ret.chop! if ret[-1] == ","
    return ret
end

def checkStringBracketSyntax(string, key)
    stack = []
    convert = { "[" => "]", "{" => "}", "(" => ")" }
    for char in 0...string.length
    stack.push(string[char]) if string[char] == "[" || string[char] == "{" || string[char] == "("
    if string[char] == "]" || string[char] == "}" || string[char] == ")"
        if string[char] != convert[stack.last]
            raise "#{key} syntax error, check your code"
            break
        end
        stack.pop
    end
    end
    return stack.empty?
end

class TrueClass
    def to_i
        return 1
    end
end
class FalseClass
    def to_i
        return 0
    end
end

def fieldSymFromGraphic(graphic)
    return :INDOOR if graphic == nil
    $cache.FEData.each{|key,data|
    return key if data.graphic.include?(graphic)
    }
    return :INDOOR
end

def rbgToHSL(red, green, blue)
    red /= 255.0
    green /= 255.0
    blue /= 255.0
    max = [red, green, blue].max
    min = [red, green, blue].min
    hue = (max + min) / 2.0
    sat = (max + min) / 2.0
    light = (max + min) / 2.0

    if(max == min)
    hue = 0
    sat = 0
    else
    d = max - min;
    sat = light >= 0.5 ? d / (2.0 - max - min) : d / (max + min)
    case max
        when red 
        hue = (green - blue) / d + (green < blue ? 6.0 : 0)
        when green 
        hue = (blue - red) / d + 2.0
        when blue 
        hue = (red - green) / d + 4.0
    end
    hue /= 6.0
    end
    return [(hue*360), (sat*100), (light*100)]
end

def hslToRGB(hue, sat, light)
    hue = hue/360.0
    sat = sat/100.0
    light = light/100.0

    red = 0.0
    green = 0.0
    blue = 0.0
    
    if(sat == 0.0)
    red = light.to_f
    green = light.to_f
    blue = light.to_f
    else
    q = light < 0.5 ? light * (1 + sat) : light + sat - light * sat
    p = 2 * light - q
    red = hueToRGB(p, q, hue + 1/3.0)
    green = hueToRGB(p, q, hue)
    blue = hueToRGB(p, q, hue - 1/3.0)
    end

    return [(red * 255), (green * 255), (blue * 255)]
end

def hueToRGB(p, q, t)
    t += 1                                  if(t < 0) 
    t -= 1                                  if(t > 1)
    return (p + (q - p) * 6 * t)            if(t < 1/6.0) 
    return q                                if(t < 1/2.0) 
    return (p + (q - p) * (2/3.0 - t) * 6)  if(t < 2/3.0) 
    return p
end

def getMonOutput(mon)
    exporttext = ""
    exporttext += "\t\t:name => \"#{mon.name}\",\n"
    exporttext += "\t\t:dexnum => #{mon.dexnum},\n"
    exporttext += "\t\t:Type1 => :#{mon.Type1},\n"
    exporttext += "\t\t:Type2 => :#{mon.Type2},\n" if mon.Type2 && (mon.Type1 != mon.Type2)
    exporttext += "\t\t:BaseStats => #{mon.BaseStats.inspect},\n"
    exporttext += "\t\t:EVs => #{mon.EVs.inspect},\n"
    exporttext += "\t\t:Abilities => #{mon.Abilities},\n"
    exporttext += "\t\t:HiddenAbilities => :#{mon.checkFlag?(:HiddenAbilities)},\n" if mon.checkFlag?(:HiddenAbilities)
    exporttext += "\t\t:GrowthRate => :#{mon.GrowthRate},\n"
    exporttext += "\t\t:GenderRatio => :#{mon.GenderRatio},\n"
    exporttext += "\t\t:BaseEXP => #{mon.BaseEXP},\n"
    exporttext += "\t\t:CatchRate => #{mon.CatchRate},\n"
    exporttext += "\t\t:Happiness => #{mon.Happiness},\n"
    exporttext += "\t\t:EggSteps => #{mon.EggSteps},\n"
    if mon.EggMoves
      exporttext += "\t\t:EggMoves => ["
      for eggmove in mon.EggMoves
        exporttext += ":#{eggmove},"
      end
      exporttext += "],\n"
    end
    if mon.preevo
      exporttext += "\t\t:preevo => {\n"
      exporttext += "\t\t\t:species => :#{mon.preevo[:species]},\n"
      exporttext += "\t\t\t:form => #{mon.preevo[:form]}\n"
      exporttext += "\t\t},\n"
    end
    if mon
      check = 1
      exporttext += "\t\t:Moveset => [\n"
      for move in mon.Moveset
        exporttext += "\t\t\t[#{move[0]},:#{move[1]}]"
        exporttext += ",\n" if check != mon.Moveset.length
        check += 1
      end
      exporttext += "],\n"
    end
    exporttext += "\t\t:compatiblemoves => ["
    for j in mon.compatiblemoves
      next if PBStuff::UNIVERSALTMS.include?(j)
      exporttext += ":#{j},"
    end
    exporttext += "],\n"
    exporttext += "\t\t:moveexceptions => ["
    for j in mon.moveexceptions
      exporttext += ":#{j},"
    end
    exporttext += "],\n"
    if mon.shadowmoves
      exporttext += "\t\t:shadowmoves => ["
      for shadowmove in mon.shadowmoves
        exporttext += ":#{shadowmove},"
      end
      exporttext += "],\n"
    end
    exporttext += "\t\t:Color => \"#{mon.Color.to_s}\",\n"
    exporttext += "\t\t:Habitat => \"#{mon.Habitat.to_s}\",\n" if mon.Habitat 
    exporttext += "\t\t:EggGroups => #{mon.EggGroups},\n"
    exporttext += "\t\t:Height => #{mon.Height},\n"
    exporttext += "\t\t:Weight => #{mon.Weight},\n"
    exporttext += "\t\t:WildItemCommon => :#{mon.checkFlag?(:WildItemCommon)},\n" if mon.checkFlag?(:WildItemCommon)
    exporttext += "\t\t:WildItemUncommon => :#{mon.checkFlag?(:WildItemUncommon)},\n" if mon.checkFlag?(:WildItemUncommon)
    exporttext += "\t\t:WildItemRare => :#{mon.checkFlag?(:WildItemRare)},\n" if mon.checkFlag?(:WildItemRare)
    exporttext += "\t\t:kind => \"#{mon.kind}\",\n"
    exporttext += "\t\t:dexentry => \"#{mon.dexentry}\",\n"
    exporttext += "\t\t:BattlerPlayerY => #{mon.BattlerPlayerY},\n"
    exporttext += "\t\t:BattlerEnemyY => #{mon.BattlerEnemyY},\n"
    exporttext += "\t\t:BattlerAltitude => #{mon.BattlerAltitude},\n"
    if mon.evolutions != nil
      evos = mon.evolutions
      check = 1
      exporttext += "\t\t:evolutions => [\n"
      for evo in evos
        exporttext += "\t\t\t[:#{evo[0].to_s},:#{evo[1].to_s}"
        evomethods = ["Item","ItemMale","ItemFemale","TradeItem","DayHoldItem","NightHoldItem"]
        if evomethods.include?(evo[1].to_s)
          exporttext += ",:#{evo[2].to_s}"
        else
          exporttext += ",#{evo[2].is_a?(Integer) ? "" : ":"}#{evo[2].to_s}" if evo[2]
        end
        exporttext += "],\n" if check != evos.length
        exporttext += "]\n" if check == evos.length
        check += 1
      end
      exporttext += "\t\t]\n"
    end
    exporttext += "\t},\n\n"
    return exporttext
end

def fixtheoops
  $PokemonForms.each{|species, speciesdata|
    next if !$cache.pkmn.keys.include?(species)
    speciesdata.each{|form, formdata|
      next if !form.is_a?(String)
      skip = true
      $cache.pkmn[species].forms.each{|id, name| skip = false if name.include?(form)}
      next if skip
      cacheform = ""
      $cache.pkmn[species].forms.each{|id, name| cacheform = name if name.include?(form)}
      if formdata.dig(:Ability)
        $cache.pkmn[species].formData[cacheform][:Abilities] = formdata.dig(:Ability) 
        $cache.pkmn[species].formData[cacheform][:Abilities] = [formdata.dig(:Ability)] if formdata.dig(:Ability) .is_a?(Symbol)
      end
      $cache.pkmn[species].formData[cacheform][:evolutions] = formdata.dig(:GetEvo) if formdata.dig(:GetEvo)
      $cache.pkmn[species].formData[cacheform][:dexentry] = formdata.dig(:DexEntry) if formdata.dig(:DexEntry)
      $cache.pkmn[species].formData[cacheform][:Moveset] = formdata.dig(:Movelist) if formdata.dig(:Movelist)
      $cache.pkmn[species].formData[cacheform][:WildItemCommon] = formdata.dig(:WildHoldItems)[0] if formdata.dig(:WildHoldItems)
      $cache.pkmn[species].formData[cacheform][:WildItemUncommon] = formdata.dig(:WildHoldItems)[1] if formdata.dig(:WildHoldItems)
      $cache.pkmn[species].formData[cacheform][:WildItemRare] = formdata.dig(:WildHoldItems)[2] if formdata.dig(:WildHoldItems)
    }
  }
  $GamePokemonForms.each{|species, speciesdata|
    next if !$cache.pkmn.keys.include?(species)
    speciesdata.each{|form, formdata|
      next if !form.is_a?(String)
      skip = true
      $cache.pkmn[species].forms.each{|id, name| skip = false if name.include?(form)}
      next if skip
      cacheform = ""
      $cache.pkmn[species].forms.each{|id, name| cacheform = name if name.include?(form)}
      if formdata.dig(:Ability)
        $cache.pkmn[species].formData[cacheform][:Abilities] = formdata.dig(:Ability) 
        $cache.pkmn[species].formData[cacheform][:Abilities] = [formdata.dig(:Ability)] if formdata.dig(:Ability) .is_a?(Symbol)
      end
      $cache.pkmn[species].formData[cacheform][:evolutions] = formdata.dig(:GetEvo) if formdata.dig(:GetEvo)
      $cache.pkmn[species].formData[cacheform][:dexentry] = formdata.dig(:DexEntry) if formdata.dig(:DexEntry)
      $cache.pkmn[species].formData[cacheform][:Moveset] = formdata.dig(:Movelist) if formdata.dig(:Movelist)
      $cache.pkmn[species].formData[cacheform][:WildItemCommon] = formdata.dig(:WildHoldItems)[0] if formdata.dig(:WildHoldItems)
      $cache.pkmn[species].formData[cacheform][:WildItemUncommon] = formdata.dig(:WildHoldItems)[1] if formdata.dig(:WildHoldItems)
      $cache.pkmn[species].formData[cacheform][:WildItemRare] = formdata.dig(:WildHoldItems)[2] if formdata.dig(:WildHoldItems)
    }
  }
  
  monDump
  compileMons
end

def enforceTrainerType
  $cache.trainertypes.each{|sym, data|
    $Trainer.trainertype = sym if data.checkFlag?(:ID) == $Trainer.trainertype
  }
  $Trainer.trainertype = $cache.trainertypes.keys[0] if $Trainer.trainertype.is_a?(Integer)
end