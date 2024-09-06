Events.onStepTaken+=proc {|sender,e|
  next if !$Trainer
  rnd=rand(300000)
  if (rnd<10 && ($game_switches[814] && !$game_switches[812]))
    $game_screen.start_flash(Color.new(255,255,255,128), 15)
    pbSEPlay("Saint3.ogg",100,100)
    leader=$game_player
    offset = [[0,-1],[1,0],[-1,0],[0,1]][leader.direction/2 - 1]
    mapTile1 = leader.x + offset[0]
    mapTile2 = leader.y + offset[1]
    rpgEvent=RPG::Event.new(mapTile1,mapTile2)
    newEvent=Game_Event.new($game_map.map_id,rpgEvent,$MapFactory.getMap($game_map.map_id))
    case leader.direction  # direction
    when 2 then newEvent.turn_down
    when 4 then newEvent.turn_left
    when 6 then newEvent.turn_right
    when 8 then newEvent.turn_up
    end
    newEvent.character_name="trchar121(b)"
    newEvent.character_hue=0
    pbAddDependency(newEvent)
    rnd2=rand(4)
    case rnd2
    when 0 then 
      Kernel.pbMessage("\\ff[15]AMELIA: Welcome to the full Desolation experience, just as beta testers experienced it...")
      Kernel.pbMessage("\\ff[15]Featuring... well, more me.")
      Kernel.pbMessage("\\ff[15]What a delight for you.")
    when 1 then
      Kernel.pbMessage("\\ff[15]AMELIA: Sorry, was I interrupting something important?")
      Kernel.pbMessage("\\ff[15]Unfortunately, dramatic scenes don't mean you get to play without seeing me.")
    when 2 then
      Kernel.pbMessage("\\ff[15]AMELIA: So I heard you were tired of fighting me.")
      Kernel.pbMessage("\\ff[15]Well.")
      Kernel.pbMessage("\\ff[15]I have bad news for you.")
    when 3 then 
      Kernel.pbMessage("\\ff[15]AMELIA: Welcome to the Episode 6 release of Pokémon Desolation.")
      Kernel.pbMessage("\\ff[15]The dev team hopes you will enjoy your experience.")
      Kernel.pbMessage("\\ff[15]I, however, will make sure that experience ends here.")
    when 4 then 
      Kernel.pbMessage("\\ff[15]AMELIA: ~ It's me that I spite as I stand up and fight, ~")
      Kernel.pbMessage("\\ff[15]~ The only thing I know for real... ~")
      Kernel.pbMessage("\\ff[15]Oh, it's you.")
      Kernel.pbMessage("\\ff[15]I guess there WILL be blood shed, then.")
    end
    if pbTrainerBattle(:BLACKFOXACE,"Amelia",_I("Alright, see you next time."),false,1,false,nil,recorded:false)
      #for i in 0..$Trainer.party.length-1
      #   if $Trainer.party[i]==$umbreon
      #      $Trainer.party[i]=Variables[:UmbreMon]
      #    end
      #end
      for i in $Trainer.party
        i.heal
      end
      #$Trainer.badges[7]=true
      Kernel.pbMessage("\\ff[15]AMELIA: Yeah, yeah, enjoy your victory while you can.")
      Kernel.pbMessage("\\ff[15]One day you won't be so lucky, and I'll be here to laugh at you.")
      # if $game_variables[:AmeliaWhatTheFuckYouCantDoThat].nil? || !$game_variables[:AmeliaWhatTheFuckYouCantDoThat].is_a?(Array)
      #   $game_variables[:AmeliaWhatTheFuckYouCantDoThat]=[]
      # end
       if $Trainer.party.any?{|mon| [:DEINO, :ZWEILOUS, :HYDREIGON].include?(mon.species)}
         yourmon = $Trainer.party.detect{|mon| [:DEINO, :ZWEILOUS, :HYDREIGON].include?(mon.species)}
         shittalking = yourmon.species
         Kernel.pbMessage("\\ff[15]... Nice "+shittalking.to_s.capitalize()+", dork.")
      #   $game_variables[:AmeliaWhatTheFuckYouCantDoThat].push(yourmon)
      #   indexToDelete = $Trainer.party.index{|mon| [:DEINO, :ZWEILOUS, :HYDREIGON].include?(mon.species)}
      #   $Trainer.party[indexToDelete]=nil
      #   $Trainer.party.compact!
      # else
      #   yourmon = $game_variables[:BattleDataArray].last().getMVPs[0]
      #   Kernel.pbMessage("\\ff[15] Good luck winning next time without your "+ yourmon.species.to_s.capitalize()+", dork.")
      #   $game_variables[:AmeliaWhatTheFuckYouCantDoThat].push(yourmon)
      #   indexToDelete = $Trainer.party.index{|mon| mon.species == $game_variables[:BattleDataArray].last().getMVPs[0].species}
      #   $Trainer.party[indexToDelete]=nil
      #   $Trainer.party.compact!
       end
      # $game_variables[:AmeliaWhatTheFuckYouCantDoThat].push(yourmon)
      if !$Trainer.party.any?{|mon| [:DEINO, :ZWEILOUS, :HYDREIGON].include?(mon.species)} 
       $game_switches[814]=false
      end
    end
    $game_screen.start_flash(Color.new(255,255,255,128), 15)
    pbSEPlay("Saint3.ogg",100,100)
    #$game_switches[814]=0 no i'm not turning off the switch this is your life now.
    pbRemoveDependency(newEvent)
  end
}

def okayAmeliaYouCanStopNow
  for i in 0...$game_variables[:AmeliaWhatTheFuckYouCantDoThat].length
    pbAddPokemonSilent($game_variables[:AmeliaWhatTheFuckYouCantDoThat][i])
    $game_variables[:AmeliaWhatTheFuckYouCantDoThat]=[]
  end
end

def yumilamend
  globaltext =""
  for n in 1..999
    map_name = sprintf("Data/Map%03d.rxdata", n)
    next if !(File.open(map_name,"rb") { true } rescue false)
    next if n== 77
    map = load_data(map_name)
    for i in map.events.keys.sort
      event = map.events[i]
      for j in 0...event.pages.length
        page = event.pages[j]
        list = page.list
        index = 0 
        while index < list.length - 1
          params = list[index].parameters
          for l in 0..params.length
            text =params[l].to_s
            if (text.include?("pbStorePokemon(poke)"))
              map.events[i].pages[j].list[index].parameters[l].gsub! 'pbStorePokemon(poke)', 'pbAddPokemon(poke)'
						  savemap = true
            end
          end
          index += 1
        end
      end
    end
    if savemap
			save_data(map,sprintf("Data/Map%03d.rxdata", n))
		end
  end
end
def amendicons
  i =1
  if File.exists?("Scripts/"+GAMEFOLDER+"/itemtext.rb")
    file = File.open("Scripts/"+GAMEFOLDER+"/itemtext.rb", "r+")
    file_data = file.read
	  file_data.each_line {|line|
      if line.include?(":ID => ")
          file_data[line]= "\t:ID => " + i.to_s + ",\n"
          i+=1
      end
    }
    file.truncate(0)
    file.rewind
    file.write(file_data)
    file.close
  else
    puts "uuuh why is there no itemtext.rb file found"
  end
end



def fixtrainertext
  if File.exists?("Scripts/"+GAMEFOLDER+"/trainertext.rb")
    file = File.open("Scripts/"+GAMEFOLDER+"/trainertext.rb", "r+")
    file_data = file.read
    blackjack="" #and hookers
	  file_data.each_line {|line|
      if line.include?(":form => ")
        species = blackjack.split(":species => :")[-1].split(",")[0].intern
        oldabilities = [$cache.pkmn[species].Abilities[0],
        $cache.pkmn[species].Abilities[1] ? $cache.pkmn[species].Abilities[1] : nil,
        $cache.pkmn[species].Abilities[2] ? $cache.pkmn[species].Abilities[2] : nil,]
        oldabil = oldabilities.index(blackjack.split(":ability => :")[-1].split(",")[0].intern)
        form = line.split(":form => ")[1][0]
        formnames = $cache.pkmn[species].forms
        puts formnames
        name = formnames.fetch(form.to_i) if formnames
        v = $cache.pkmn[@species].formData.dig(name, :Abilities)
        abilities = v if v
        if !abilities.nil?
          abilities = [abilities,abilities,abilities] if !abilities.is_a?(Array)
          abilities[2] = abilities[0] if abilities[2] == 0 || abilities[2].nil?
          abilities[1] = abilities[2] if abilities[1] == 0 || abilities[1].nil?
          ability = oldabil ? oldabil : 0
          newabil = abilities[ability.to_i]
          puts newabil
          pattern =":ability => :"+blackjack.split(":ability => :")[-1].split(",")[0]+","
          replacement =":ability => :" + newabil.to_s + ","
          blackjack = blackjack.reverse.sub(pattern.reverse, replacement.reverse).reverse
        end
        blackjack+=line
      else
        blackjack+=line
      end
    }
    file.truncate(0)
    file.rewind
    file.write(blackjack)
    file.close
  else
    puts "uuuh why is there no trainertext.rb file found"
  end
end

def dreamscapeAmend
  globaltext =""
  for n in [327,328,331,332,333,334,343,329,330,396,452,398,400,453,399,450,406,397,451]
    map_name = sprintf("Data/Map%03d.rxdata", n)
    next if !(File.open(map_name,"rb") { true } rescue false)
    map = load_data(map_name)
    for i in map.events.keys.sort
      event = map.events[i]
      for j in (event.pages.length-1).downto(0)
        page = event.pages[j]
        list = page.list
        index = 0 
        while index < list.length - 1
          params = list[index].parameters
          for l in 0..params.length
            text =params[l].to_s
            if (text.include?("pbWildBattle(:"))          
						  page2=page.clone
              page2.condition = page.condition.clone
              page2.condition.switch2_valid = true
              page2.condition.switch2_id = 904
              page2.trigger=0
              event.pages.push(page2)
              savemap=true
            end
          end
          index += 1
        end
      end
    end
    if savemap
			save_data(map,sprintf("Data/Map%03d.rxdata", n))
		end
  end
end

unless System.platform == "Android"
  require 'socket'
end

def desolationCheckRemoteVersion()
  begin
    host = 'www.rebornevo.com'
    port = 80
    path = "/downloads/rebornremote/Desolation6/version.txt"

    # This is the HTTP request we send to fetch a file
    request = "GET #{path} HTTP/1.0\r\n\r\n"

    socket = TCPSocket.open(host, port) # Connect to server
    socket.print(request)               # Send request
    response = socket.read              # Read complete response
    # Split response at first blank line into headers and body
    headers, body = response.split("\r\n\r\n", 2)
    remoteVer = body.strip
  rescue
    return
  end

  localVer = nil
  if File.exist?("version.txt")
    f = File.open("version.txt", "rb")
    f.each_line { |line|
      localVer = line.strip
    }
    f.close
  end

  if localVer.nil?
    return
  end

  remoteVersion = parseSemVerExpression(remoteVer)
  localVersion = parseSemVerExpression(localVer)

  if remoteVersion.nil? || localVersion.nil?
    return
  end

  if remoteVersion.length < localVersion.length || (remoteVersion <=> localVersion) > 0
    print "A new update has been detected!\n\nCurrent version: #{localVer}\nNew version: #{remoteVer}\n\nPlease close the game and run updater to get the new version."
  end
end

def parseSemVerExpression(version)
  regex = /^(?<major>[0-9]+)\.(?<minor>[0-9]+)\.(?<patch>[0-9]+)(-(?<stage>alpha|beta|rc)\.(?<pre>[0-9]+))?$/
  match = version.match(regex)

  return nil unless match

  return [
    match['major'].to_i,
    match['minor'].to_i,
    match['patch'].to_i,
    match['stage'].nil? ? 'stable' : match['stage'],
    match['pre'].to_i,
  ]
end
