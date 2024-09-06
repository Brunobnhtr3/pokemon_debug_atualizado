class Scene_Pokegear
    #-----------------------------------------------------------------------------
    # initialize
    #-----------------------------------------------------------------------------
    def initialize(menu_index = 0)
      @menu_index = menu_index
    end
    #-----------------------------------------------------------------------------
    # main
    #-----------------------------------------------------------------------------
    def main
      commands=[]
      # OPTIONS - If you change these, you should also change update_command below.
      @cmdMap=-1
      @cmdPhone=-1
      @cmdJukebox=-1
      @cmdQuest=-1
      @cmdNotes=-1
      @cmdJinx=-1
      if $game_switches[713]
        commands[@cmdQuest=commands.length]=_INTL("Quest Log")
      end
      if $game_switches[802]
        commands[@cmdJinx=commands.length]=_INTL("Jinx Scent")
      end
      if $game_switches[854]
        commands[@cmdNotes=commands.length]=_INTL("Field Notes")
      end
      commands[@cmdMap=commands.length]=_INTL("Map")
      commands[@cmdJukebox=commands.length]=_INTL("Jukebox")
      
      @viewport=Viewport.new(0,0,Graphics.width,Graphics.height)
      @viewport.z=99999
      @button=AnimatedBitmap.new("Graphics/Pictures/pokegearButton")
      @sprites={}
      @sprites["background"] = IconSprite.new(0,0)
      femback=pbResolveBitmap(sprintf("Graphics/Pictures/pokegearbgf"))
      if $Trainer.isFemale? && femback
        @sprites["background"].setBitmap("Graphics/Pictures/pokegearbgf")
      else
        @sprites["background"].setBitmap("Graphics/Pictures/pokegearbg")
      end
      @sprites["command_window"] = Window_CommandPokemon.new(commands,160)
      @sprites["command_window"].index = @menu_index
      @sprites["command_window"].x = Graphics.width
      @sprites["command_window"].y = -3000 #0
      for i in 0...commands.length
        x=118
        y=196 - (commands.length*24) + (i*48)
        @sprites["button#{i}"]=PokegearButton.new(x,y,commands[i],i,@viewport)
        @sprites["button#{i}"].selected=(i==@sprites["command_window"].index)
        @sprites["button#{i}"].update
      end
      Graphics.transition
      loop do
        Graphics.update
        Input.update
        update
        if $scene != self
          break
        end
      end
      Graphics.freeze
      pbDisposeSpriteHash(@sprites)
    end
    #-----------------------------------------------------------------------------
    # update the scene
    #-----------------------------------------------------------------------------
    def update
      for i in 0...@sprites["command_window"].commands.length
        sprite=@sprites["button#{i}"]
        sprite.selected=(i==@sprites["command_window"].index) ? true : false
      end
      pbUpdateSpriteHash(@sprites)
      #update command window and the info if it's active
      if @sprites["command_window"].active
        update_command
        return
      end
    end
    #-----------------------------------------------------------------------------
    # update the command window
    #-----------------------------------------------------------------------------
    def update_command
      if Input.trigger?(Input::B)
        pbPlayCancelSE()
        $scene = Scene_Map.new
        return
      end
      if Input.trigger?(Input::C)
        if @cmdMap>=0 && @sprites["command_window"].index==@cmdMap
          pbPlayDecisionSE()               
          pbShowMap(-1,false)
        end
        if @cmdPhone>=0 && @sprites["command_window"].index==@cmdPhone
          pbPlayDecisionSE()
          pbFadeOutIn(99999) {
              PokemonPhoneScene.new.start
          }
        end
        if @cmdJukebox>=0 && @sprites["command_window"].index==@cmdJukebox
          pbPlayDecisionSE()
          $scene = Scene_Jukebox.new
        end
        if @cmdQuest>=0 && @sprites["command_window"].index==@cmdQuest
          pbPlayDecisionSE()
          $game_variables[:QuestLogLastSide] ||= 0
          $game_variables[:QuestLogLastMain] ||= 0
          if ($game_variables[:QuestLogMainOrSide]!=true && $game_variables[:QuestLogMainOrSide]!=false)
            $game_variables[:QuestLogMainOrSide]=true
          end
          if $game_variables[:QuestLogMainOrSide]
        pbFadeOutIn(99999) {
          scene = QuestLog_Scene.new($game_variables[:QuestLogLastSide])
          screen = QuestLogScreen.new(scene)
          screen.pbStartScreen
        }
          else
        pbFadeOutIn(99999) {
          scene = QuestLog_Scene.new($game_variables[:QuestLogLastMain])
          screen = QuestLogScreen.new(scene)
          screen.pbStartScreen
        }
          end
        end
        if @cmdNotes>=0 && @sprites["command_window"].index==@cmdNotes
          pbPlayDecisionSE()
          $scene = Scene_FieldNotes.new
        end
        if @cmdJinx>=0 && @sprites["command_window"].index==@cmdJinx
          pbPlayDecisionSE()
          $scene = Scene_EncounterRate.new
        return
      end
    end
  end
end

  

    
  class Scene_EncounterRate
   
    def initialize(menu_index = 0)
      @menu_index = menu_index
    end
    def main
      if !defined?($game_variables[:EncounterRateModifier]) || $game_switches[:FirstUse]!=true
        $game_variables[:EncounterRateModifier]=1
      end
      fadein = true
      @sprites={}
      @viewport=Viewport.new(0,0,Graphics.width,Graphics.height)
      @viewport.z=99999
      @sprites["background"] = IconSprite.new(0,0)
      @sprites["background"].setBitmap("Graphics/Pictures/jinxscentbg")
      @sprites["background"].z=255
      
      Graphics.transition
      params=ChooseNumberParams.new
      params.setRange(0,9999)
      params.setInitialValue($game_variables[:EncounterRateModifier].to_f*100)
      params.setCancelValue($game_variables[:EncounterRateModifier].to_f*100)
      $game_variables[:EncounterRateModifier]=Kernel.pbMessageChooseNumberCentered(params).to_f/100
      if $game_variables[:EncounterRateModifier]==0
        $game_switches[904]=true
      else
        $game_switches[904]=false
      end
      $game_switches[:FirstUse]=true
      if defined?($game_map.map_id)
        $PokemonEncounters.setup($game_map.map_id)
      end
      $scene = Scene_Pokegear.new
      Graphics.freeze
      pbDisposeSpriteHash(@sprites)
      @viewport.dispose
    end
  end
  