class PokeBattle_ZMoves < PokeBattle_Move
  attr_accessor(:move)
  attr_reader(:battle)
  attr_reader(:name)
  attr_reader(:function)
# UPDATE 11/21/2013
# Changed from immutable to mutable to allow for sheer force
# changed from: attr_reader(:basedamage)
  attr_accessor(:basedamage)
  attr_reader(:type)
  attr_reader(:accuracy)
  attr_reader(:addlEffect)
  attr_reader(:target)
  attr_reader(:priority)
  attr_reader(:flags)
  attr_reader(:category)
  attr_reader(:basemove)
  attr_accessor(:pp)
  attr_accessor(:totalpp)
  attr_reader(:oldmove)
  attr_reader(:status)
  attr_reader(:oldname)
  attr_accessor(:zmove)

################################################################################
# Z Move data
################################################################################

  def pbZMoveSymbol(crystal,moveindex=0)
    if @status
      return @oldmove.move
    else
      crystal_to_zmove ={                        :NORMALIUMZ => :BREAKNECKBLITZ,
      :FIGHTINIUMZ => :ALLOUTPUMMELING,          :FLYINIUMZ => :SUPERSONICSKYSTRIKE,
      :POISONIUMZ => :ACIDDOWNPOUR,              :GROUNDIUMZ => :TECTONICRAGE,
      :ROCKIUMZ => :CONTINENTALCRUSH,            :BUGINIUMZ => :SAVAGESPINOUT,
      :GHOSTIUMZ => :NEVERENDINGNIGHTMARE,       :STEELIUMZ => :CORKSCREWCRASH,
      :FIRIUMZ => :INFERNOOVERDRIVE,             :WATERIUMZ => :HYDROVORTEX,
      :GRASSIUMZ => :BLOOMDOOM,                  :ELECTRIUMZ => :GIGAVOLTHAVOC,
      :PSYCHIUMZ => :SHATTEREDPSYCHE,            :ICIUMZ => :SUBZEROSLAMMER,
      :DRAGONIUMZ => :DEVASTATINGDRAKE,          :DARKINIUMZ => :BLACKHOLEECLIPSE,
      :FAIRIUMZ => :TWINKLETACKLE,               :ALORAICHIUMZ => :STOKEDSPARKSURFER,
      :DECIDIUMZ => :SINISTERARROWRAID,          :INCINIUMZ => :MALICIOUSMOONSAULT,
      :PRIMARIUMZ => :OCEANICOPERETTA,           :EEVIUMZ => :EXTREMEEVOBOOST,
      :PIKANIUMZ => :CATASTROPIKA,               :SNORLIUMZ => :PULVERIZINGPANCAKE,
      :MEWNIUMZ => :GENESISSUPERNOVA,            :TAPUNIUMZ => :GUARDIANOFALOLA,
      :MARSHADIUMZ => :SOULSTEALING7STARSTRIKE,  :KOMMONIUMZ => :CLANGOROUSSOULBLAZE,
      :LYCANIUMZ => :SPLINTEREDSTORMSHARDS,      :MIMIKIUMZ => :LETSSNUGGLEFOREVER,
      :SOLGANIUMZ => :SEARINGSUNRAZESMASH,       :LUNALIUMZ => :MENACINGMOONRAZEMAELSTROM,
      :ULTRANECROZIUMZ => :LIGHTTHATBURNSTHESKY,
      }
      return crystal_to_zmove[crystal]
    end
  end

  ZMOVENAMES = {:BREAKNECKBLITZ =>"Breakneck Blitz",:ALLOUTPUMMELING =>"All-Out Pummeling",
  :SUPERSONICSKYSTRIKE =>"Supersonic Skystrike", :ACIDDOWNPOUR =>"Acid Downpour", :TECTONICRAGE => "Tectonic Rage",
  :CONTINENTALCRUSH => "Continental Crush", :SAVAGESPINOUT => "Savage Spin-Out", :NEVERENDINGNIGHTMARE =>"Never-Ending Nightmare",
  :CORKSCREWCRASH => "Corkscrew Crash", :INFERNOOVERDRIVE => "Inferno Overdrive",
  :HYDROVORTEX => "Hydro Vortex", :BLOOMDOOM => "Bloom Doom", :GIGAVOLTHAVOC => "Gigavolt Havoc", 
  :SHATTEREDPSYCHE => "Shattered Psyche", :SUBZEROSLAMMER => "Subzero Slammer",
  :DEVASTATINGDRAKE => "Devastating Drake", :BLACKHOLEECLIPSE => "Black Hole Eclipse", :TWINKLETACKLE => "Twinkle Tackle",
  :STOKEDSPARKSURFER => "Stoked Sparksurfer", :SINISTERARROWRAID => "Sinister Arrow Raid",
  :MALICIOUSMOONSAULT => "Malicious Moonsault", :OCEANICOPERETTA => "Oceanic Operetta", :EXTREMEEVOBOOST => "Extreme Evoboost",
  :CATASTROPIKA => "Catastropika", :PULVERIZINGPANCAKE =>"Pulverizing Pancake", :GENESISSUPERNOVA => "Genesis Supernova",
  :GUARDIANOFALOLA => "Guardian of Alola", :SOULSTEALING7STARSTRIKE => "Soul-Stealing 7-Star Strike", :CLANGOROUSSOULBLAZE => "Clangorous Soulblaze",
  :SPLINTEREDSTORMSHARDS => "Splintered Stormshards", :LETSSNUGGLEFOREVER => "Let's Snuggle Forever",
  :SEARINGSUNRAZESMASH => "Searing Sunraze Smash", :MENACINGMOONRAZEMAELSTROM => "Menacing Moonraze Maelstrom",
  :LIGHTTHATBURNSTHESKY=> "Light That Burns The Sky"}

  ZMOVEFLAGS = ["f","f","f","f","f","f","f","f","f","f","f","f","f","f","f","f","f","f","f","f","af","f","","","af","af","","af","kf","f","f","f","f","f","f","f","f","f"] #good luck

################################################################################
# Creating a z move
################################################################################
  def initialize(battle,battler,move,crystal,simplechoice=false,setup=false,moveindex=0)
    @status     = isStatusZmove?(move,crystal,moveindex)
    @oldmove    = move
    @oldname    = move.name
    @move       = pbZMoveSymbol(crystal,moveindex)
    @battle     = battle
    @name       = pbZMoveName(crystal)
    # Get data on the move
    oldmovedata = $cache.moves[move.move]
    @function   = pbZMoveFunction(crystal)
    @basedamage = pbZMoveBaseDamage(crystal)
    @type       = pbZMoveType(crystal,battler,move.type)
    @accuracy   = pbZMoveAccuracy(crystal)
    @effect = 0 #pbZMoveAddlEffectChance(move,crystal)
    if crystal == :INTERCEPTZ
      @target   = :User
      @target   = :SingleNonUser if @basedamage > 0
    elsif crystal == :KOMMONIUMZ
      @target   = :AllOpposing
    elsif crystal == :EEVIUMZ
      @target   = :User
    else
      @target   = move.target
      @target   = :SingleNonUser if @basedamage > 0
    end
    @priority   = @oldmove.priority
    @flags      = pbZMoveFlags(crystal)
    @category   = oldmovedata.category
    @category   = @oldmove.pbIsPhysical? ? 0 : 1 if @move == :LIGHTTHATBURNSTHESKY
    @pp         = 1
    @totalpp    = 1
    @basemove   = self #move
    @zmove      = true
    if !@status
      @priority = 0
    end
    battler.pbBeginTurn(self)
    if crystal == :INTERCEPTZ
      @battle.pbDisplayBrief(_INTL("{1} unleashed the Interceptor's power!",battler.pbThis))
      @battle.pbDisplayBrief(_INTL("{1}!",@name))
    elsif !@status
      @battle.pbDisplayBrief(_INTL("{1} unleashed its full force Z-Move!",battler.pbThis))
      @battle.pbDisplayBrief(_INTL("{1}!",@name))
    end
    zchoice=@battle.choices[battler.index] #[0,0,move,move.target]
    zchoice[2]=self
    zchoice[2]=oldmove if @basedamage == 0
    if simplechoice!=false
      zchoice=simplechoice
    end
    ztargets=[]
    battler.pbFindUser(zchoice,ztargets)
    user = battler
    user.lastRoundMoved = @battle.turncount
    if @basemove.target==:AllOpposing && crystal==:KOMMONIUMZ && ztargets.length!=0
      user.pbAddTarget(ztargets,ztargets[0].pbPartner)
    end
    if user.ability == (:MOLDBREAKER) || user.ability == (:TERAVOLT) || user.ability == (:TURBOBLAZE) ||
       @move==:SEARINGSUNRAZESMASH || @move==:MENACINGMOONRAZEMAELSTROM || @move==:LIGHTTHATBURNSTHESKY # Solgaluna/crozma signatures
      for battlers in ztargets
        battlers.moldbroken = true
      end
    else
      for battlers in ztargets
        battlers.moldbroken = false
      end
    end
    for target in ztargets
      target.damagestate.reset
      if target.hasWorkingItem(:FOCUSBAND) && @battle.pbRandom(10)==0
        target.damagestate.focusband=true
      end
      if target.hasWorkingItem(:FOCUSSASH)
        target.damagestate.focussash=true
      end
      if target.crested && target.species == :RAMPARDOS && !target.effects[:RampCrestUsage]
        target.damagestate.rampcrest=true
      end
    end
    protype=@type
    if battler.ability == :PROTEAN || battler.ability == :LIBERO
      prot1 = battler.type1
      prot2 = battler.type2
      if !battler.hasType?(protype) || (defined?(prot2) && prot1 != prot2)
        battler.type1=protype
        battler.type2=protype
        @battle.pbDisplay(_INTL("{1} had its type changed to {3}!",battler.pbThis,getAbilityName(battler.ability),protype.capitalize))
      end
    end
    if battler.ability == :STANCECHANGE
      battler.pbCheckForm(self)
    end
    ###
    if ztargets.length==0
      if @basemove.target==:SingleNonUser ||
         @basemove.target==:RandomOpposing ||
         @basemove.target==:AllOpposing ||
         @basemove.target==:AllNonUsers ||
         @basemove.target==:Partner ||
         @basemove.target==:UserOrPartner ||
         @basemove.target==:SingleOpposing ||
         @basemove.target==:OppositeOpposing
        @battle.pbDisplay(_INTL("But there was no target..."))
      else
        #selftarget status moves here
        pbZStatus(@move,battler)
        if crystal != :INTERCEPTZ
          zchoice[2].name = @name
          battler.pbUseMove(zchoice)
          @oldmove.name = @oldname
        end
      end
    else
      if @status
        #targeted status Z's here
        pbZStatus(@move,battler)
        if crystal != :INTERCEPTZ
          zchoice[2].name = @name
          battler.pbUseMove(zchoice)
          @oldmove.name = @oldname
        end
      else
        movesucceeded=false
        showanimation=true
        flags = {totaldamage: 0}
        #looping through all targets
        for i in 0...ztargets.length
          userandtarget=[user,ztargets[i]]
          if battler.effects[:Powder] && (@type == :FIRE)
            @battle.pbDisplay(_INTL("The powder around {1} exploded!",battler.pbThis))
            @battle.pbCommonAnimation("Powder",battler,nil)
            battler.pbReduceHP((battler.totalhp/4.0).floor)
            battler.pbFaint if battler.hp<1
            zchoice[2]=oldmove
            return false
          end
          success = battler.pbChangeTarget(@basemove,userandtarget,ztargets)
          next if !success
          hitcheck = battler.pbProcessMoveAgainstTarget(@basemove,user,ztargets[i],1,flags,false,nil,showanimation) #This is the problem
          showanimation=false unless (hitcheck==0 && (@basemove.pbIsSpecial?(basemove.type) || @basemove.pbIsPhysical?(basemove.type)))
          movesucceeded = true if hitcheck && hitcheck > 0
        end
        if movesucceeded         
          if @move == :CLANGOROUSSOULBLAZE
            if !user.pbCanIncreaseStatStage?(PBStats::SPATK,false) &&
              !user.pbCanIncreaseStatStage?(PBStats::SPDEF,false) &&
              !user.pbCanIncreaseStatStage?(PBStats::SPEED,false) &&
              !user.pbCanIncreaseStatStage?(PBStats::ATTACK,false) &&
              !user.pbCanIncreaseStatStage?(PBStats::DEFENSE,false)
              @battle.pbDisplay(_INTL("{1}'s stats won't go any higher!",user.pbThis))
            end
            for stat in 1..5
              if user.pbCanIncreaseStatStage?(stat,false)
                user.pbIncreaseStat(stat,1,abilitymessage:false)
              end
            end
          end
          if user.forcedSwitch
            #remove gem when forced switching out mid attack
            user.forcedSwitch = false
            party=@battle.pbParty(user.index)
            j=-1
            until j!=-1
              j=@battle.pbRandom(party.length)
              if !((user.isFainted? || j!=user.pokemonIndex) && (user.pbPartner.isFainted? || j!=user.pbPartner.pokemonIndex) && party[j] && !party[j].isEgg? && party[j].hp>0)
                  j=-1
              end
              if !@battle.pbCanSwitchLax?(user.index,j,false)
                j=-1
              end
            end
            newpoke=j
            user.vanished=false
            user.pbResetForm
            @battle.pbReplace(user.index,newpoke,false)
            @battle.pbDisplay(_INTL("{1} was dragged out!",user.pbThis))
            @battle.pbOnActiveOne(user)
            user.pbAbilitiesOnSwitchIn(true)
            user.forcedSwitchEarlier = true
          end
        end
        @battle.fieldEffectAfterMove(@basemove,user)
        battler.pbReducePPOther(@oldmove)
        for i in 0...ztargets.length
          if ztargets[i].userSwitch
            ztargets[i].userSwitch = false
            @battle.pbDisplay(_INTL("{1} went back to {2}!",ztargets[i].pbThis,@battle.pbGetOwner(ztargets[0].index).name))
            newpoke=0
            newpoke=@battle.pbSwitchInBetween(ztargets[i].index,true,false)
            @battle.pbMessagesOnReplace(ztargets[i].index,newpoke)
            ztargets[i].vanished=false
            ztargets[i].pbResetForm
            @battle.pbReplace(ztargets[i].index,newpoke,false)
            @battle.pbOnActiveOne(ztargets[i])
            ztargets[i].pbAbilitiesOnSwitchIn(true)
          end
        end
        # End of move usage
        @battle.pbGainEXP
        battler.pbEndTurn(zchoice)
        @battle.pbJudgeSwitch
      end
    end
    zchoice[2]=oldmove
  end


  def pbZMoveName(crystal=nil)
    if @status && crystal != :INTERCEPTZ
      return "Z-" + @oldname
    else
      return PokeBattle_ZMoves::ZMOVENAMES[@move]
    end
  end

  def pbZMoveFunction(crystal)
    if @status && crystal != :INTERCEPTZ
      return @oldmove.function
    else
      "Z"
    end
  end

  def pbZMoveBaseDamage(crystal)
    if @status
      return 0
    else
      case crystal
      when :ALORAICHIUMZ    then return 175
      when :DECIDIUMZ       then return 180
      when :INCINIUMZ       then return 180
      when :PRIMARIUMZ      then return 195
      when :EEVIUMZ         then return 0
      when :PIKANIUMZ       then return 210
      when :SNORLIUMZ       then return 210
      when :MEWNIUMZ        then return 185
      when :TAPUNIUMZ       then return 0
      when :MARSHADIUMZ     then return 195
      when :KOMMONIUMZ      then return 185
      when :LYCANIUMZ       then return 190
      when :MIMIKIUMZ       then return 190
      when :SOLGANIUMZ      then return 200
      when :LUNALIUMZ       then return 200
      when :ULTRANECROZIUMZ then return 200
      when :INTERCEPTZ      then return interceptzbasedamage
      else
        case @oldmove.move
        when :MEGADRAIN      then return 120
        when :WEATHERBALL    then return 160
        when :HEX            then return 160
        when :GEARGRIND      then return 180
        when :VCREATE        then return 220
        when :FLYINGPRESS    then return 170
        when :COREENFORCER   then return 140
        # Variable Power Moves from now
        when :CRUSHGRIP      then return 190
        when :FLAIL          then return 160
        when :FRUSTRATION    then return 160
        when :NATURALGIFT    then return 160
        when :PRESENT        then return 100
        when :RETURN         then return 160
        when :SPITUP         then return 100
        when :TRUMPCARD      then return 160
        when :WRINGOUT       then return 190
        when :BEATUP         then return 100
        when :FLING          then return 100
        when :POWERTRIP      then return 160
        when :PUNISHMENT     then return 160
        when :ELECTROBALL    then return 160
        when :ERUPTION       then return 200
        when :HEATCRASH      then return 160
        when :GRASSKNOT      then return 160
        when :GYROBALL       then return 160
        when :HEAVYSLAM      then return 160
        when :LOWKICK        then return 160
        when :REVERSAL       then return 160
        when :MAGNITUDE      then return 140
        when :STOREDPOWER    then return 160
        when :WATERSPOUT     then return 200
        end
        check=@oldmove.basedamage
        if check<56
          return 100
        elsif check<66
          return 120
        elsif check<76
          return 140
        elsif check<86
          return 160
        elsif check<96
          return 175
        elsif check<101
          return 180
        elsif check<111
          return 185
        elsif check<126
          return 190
        elsif check<131
          return 195
        elsif check>139
          return 200
        end
      end
    end
  end

  def pbZMoveAccuracy(crystal)
    if @status && crystal != :INTERCEPTZ
      return @oldmove.accuracy
    else
      return 0 #Z Moves can't miss
    end
  end

  def pbZMoveType(crystal,battler,type)
    return type
  end

  def isStatusZmove?(move,crystal,moveindex)
    if !(move.pbIsPhysical?(move.type) || move.pbIsSpecial?(move.type))
      return true
    end
    return false
  end

  def pbZMoveFlags(crystal)
    if @status && crystal != :INTERCEPTZ
      return $cache.moves[@oldmove.move].flags
    else
      flaglist = 0
      tempflag = PokeBattle_ZMoves::ZMOVEFLAGS[PokeBattle_ZMoves::ZMOVENAMES.find_index { |k,_| k== @move }]
      flaglist|=1 if tempflag.include?("a")
      flaglist|=2 if tempflag.include?("b")
      flaglist|=4 if tempflag.include?("c")
      flaglist|=8 if tempflag.include?("d")
      flaglist|=16 if tempflag.include?("e")
      flaglist|=32 if tempflag.include?("f")
      flaglist|=64 if tempflag.include?("g")
      flaglist|=128 if tempflag.include?("h")
      flaglist|=256 if tempflag.include?("i")
      flaglist|=512 if tempflag.include?("j")
      flaglist|=1024 if tempflag.include?("k")
      flaglist|=2048 if tempflag.include?("l")
      flaglist|=4096 if tempflag.include?("m")
      flaglist|=8192 if tempflag.include?("n")
      flaglist|=16384 if tempflag.include?("o")
      flaglist|=32768 if tempflag.include?("p")
      return flaglist
    end
  end

  def hasFlags?(flag)
    # must be a string
    return false if !flag.is_a? String
    flag.each_byte do |c|
      # must be a lower case letter
      return false if c > 122 || c < 97
      n = c - 97 # number of bits to shift
      # if the nth bit isn't set
      return false if (@flags & (1 << n)) == 0
    end
    return true
  end

################################################################################
# PokeBattle_Move Features needed for move use
################################################################################
  def pbModifyDamage(damagemult,attacker,opponent)
    if !opponent.effects[:ProtectNegation] && (opponent.pbOwnSide.effects[:MatBlock] ||
      opponent.effects[:Protect] || opponent.effects[:KingsShield] || opponent.effects[:Obstruct] ||
      opponent.effects[:SpikyShield] || opponent.effects[:BanefulBunker] ||
      opponent.pbOwnSide.effects[:WideGuard] && (@target == :AllOpposing || @target == :AllNonUsers))
      @battle.pbDisplay(_INTL("{1} couldn't fully protect itself!",opponent.pbThis))
      return (damagemult/4.0)
    else
      return damagemult
    end
  end

  def pbZMoveEffects(attacker,opponent)
    if @move == :STOKEDSPARKSURFER
      if opponent.pbCanParalyze?(false)
        opponent.pbParalyze(attacker)
        @battle.pbDisplay(_INTL("{1} is paralyzed! It may be unable to move!",opponent.pbThis))
      end
      if @battle.canChangeFE?(:ELECTERRAIN)
        @battle.setField(:ELECTERRAIN,3)
        @battle.pbDisplay(_INTL("The terrain became electrified!"))
      end
    elsif @move == :BLOOMDOOM
      if @battle.canChangeFE?([:GRASSY,:FOREST,:FLOWERGARDEN1,:FLOWERGARDEN2,:FLOWERGARDEN3,:FLOWERGARDEN4,:FLOWERGARDEN5])
        @battle.setField(:GRASSY,3)
        @battle.pbDisplay(_INTL("The terrain became grassy!"))
      end
    elsif @move == :ACIDDOWNPOUR
      if @battle.FE == :WASTELAND # Wasteland
        if ((!opponent.hasType?(:POISON) && !opponent.hasType?(:STEEL)) || opponent.corroded) &&
         !(opponent.ability == :TOXICBOOST) &&
         !(opponent.ability == :POISONHEAL) && !(opponent.species == :ZANGOOSE && opponent.crested)
         (!(opponent.ability == :IMMUNITY) && !(opponent.moldbroken))
          rnd=@battle.pbRandom(4)
          case rnd
          when 0
            if opponent.pbCanBurn?(false)
              opponent.pbBurn(attacker)
              @battle.pbDisplay(_INTL("{1} was burned!",opponent.pbThis))
            end
          when 1
            if opponent.pbCanFreeze?(false)
              opponent.pbFreeze
              @battle.pbDisplay(_INTL("{1} was frozen solid!",opponent.pbThis))
            end
          when 2
            if opponent.pbCanParalyze?(false)
              opponent.pbParalyze(attacker)
              @battle.pbDisplay(_INTL("{1} is paralyzed! It may be unable to move!",opponent.pbThis))
            end
          when 3
            if opponent.pbCanPoison?(false)
              opponent.pbPoison(attacker)
              @battle.pbDisplay(_INTL("{1} was poisoned!",opponent.pbThis))
            end
          end
        end
      end
    elsif @move == :GENESISSUPERNOVA && @battle.canChangeFE?(:PSYTERRAIN)
      @battle.setField(:PSYTERRAIN,5)
      @battle.pbDisplay(_INTL("The terrain became mysterious!"))
    elsif @move == :SHATTEREDPSYCHE && @battle.FE == :PSYTERRAIN
      if opponent.pbCanConfuse?(false)
        opponent.effects[:Confusion]=2+@battle.pbRandom(4)
        @battle.pbCommonAnimation("Confusion",opponent,nil)
        @battle.pbDisplay(_INTL("The field got too weird for {1}!",opponent.pbThis(true)))
      end
    elsif @move == :SPLINTEREDSTORMSHARDS # Splintered Stormshards
      if @battle.canChangeFE?
        @battle.breakField
        @battle.pbDisplay(_INTL("The field was devastated!"))
      end
    elsif Rejuv
      interceptZeffectcheck(attacker,opponent)
    end
  end
################################################################################
# PokeBattle_ActualScene Feature for playing animation (based on common anims)
################################################################################

  #only Guardian of Alola at the moment
  def pbEffectFixedDamage(damage,attacker,opponent,hitnum=0,alltargets=nil,showanimation=true)
    type=pbType(attacker)
    typemod=pbTypeModMessages(type,attacker,opponent)
    opponent.damagestate.critical=false
    opponent.damagestate.typemod=0
    opponent.damagestate.calcdamage=0
    opponent.damagestate.hplost=0
    name=@name
    if @move==:GUARDIANOFALOLA
      index = attacker.pokemon.species-:TAPUKOKO
      name = index >=0 && index <= 3 ? @name + ["KOKO", "LELE", "BULU", "FINI"][index] : @name + "KOKO"
    end
    if typemod!=0
      opponent.damagestate.calcdamage=damage
      opponent.damagestate.typemod=4
      pbShowAnimation(name,attacker,opponent,hitnum,alltargets,showanimation)
      damage=1 if damage<1 # HP reduced can't be less than 1
      damage=pbReduceHPDamage(damage,attacker,opponent)
      pbEffectMessages(attacker,opponent)
      pbOnDamageLost(damage,attacker,opponent)
      return damage
    end
    return 0
  end

  def pbShowAnimation(movename,user,target,hitnum=0,alltargets=nil,showanimation=true,move=nil)
    return if !showanimation
    if @battle.battlescene
      animname=movename.to_s
      $cache.animations = load_data("Data/PkmnAnimations.rxdata") if !$cache.animations
      i = $cache.animations.length
      until i == 0 do
        if user.index&1==0  #Player side
          if $cache.animations[i] && $cache.animations[i].name=="ZMove:"+animname
            @battle.scene.pbAnimationCore($cache.animations[i],user,(target!=nil) ? target : user,@move)
            return
          end
        else
          if $cache.animations[i] && $cache.animations[i].name=="OppZMove:"+animname
            @battle.scene.pbAnimationCore($cache.animations[i],target,(user!=nil) ? user : target,@move)
            return
          elsif $cache.animations[i] && $cache.animations[i].name=="ZMove:"+animname
            @battle.scene.pbAnimationCore($cache.animations[i],user,(target!=nil) ? target : user,@move)
            return
          end
        end
        i-=1
      end
    end
  end

################################################################################
# Z Status Effect check
################################################################################

  def pbZStatus(move,attacker)
    z_effect_hash = pbHashForwardizer({
      [PBStats::ATTACK,1] => [:BULKUP,:HONECLAWS,:HOWL,:LASERFOCUS,:LEER,:MEDITATE,:ODORSLEUTH,:POWERTRICK,:ROTOTILLER,:SCREECH,:SHARPEN,
        :TAILWHIP, :TAUNT,:TOPSYTURVY,:WILLOWISP,:WORKUP,:COACHING],
      [PBStats::ATTACK,2] =>   [:MIRRORMOVE,:OCTOLOCK],
      [PBStats::ATTACK,3] =>   [:SPLASH],
      [PBStats::DEFENSE,1] =>   [:AQUARING,:BABYDOLLEYES,:BANEFULBUNKER,:BLOCK,:CHARM,:DEFENDORDER,:FAIRYLOCK,:FEATHERDANCE,
        :FLOWERSHIELD,:GRASSYTERRAIN,:GROWL,:HARDEN,:MATBLOCK,:NOBLEROAR,:PAINSPLIT,:PLAYNICE,:POISONGAS,
        :POISONPOWDER,:QUICKGUARD,:REFLECT,:ROAR,:SPIDERWEB,:SPIKES,:SPIKYSHIELD,:STEALTHROCK,:STRENGTHSAP,
        :TEARFULLOOK,:TICKLE,:TORMENT,:TOXIC,:TOXICSPIKES,:VENOMDRENCH,:WIDEGUARD,:WITHDRAW],
      [PBStats::SPATK,1] => [:CONFUSERAY,:ELECTRIFY,:EMBARGO,:FAKETEARS,:GEARUP,:GRAVITY,:GROWTH,:INSTRUCT,:IONDELUGE,
        :METALSOUND,:MINDREADER,:MIRACLEEYE,:NIGHTMARE,:PSYCHICTERRAIN,:REFLECTTYPE,:SIMPLEBEAM,:SOAK,:SWEETKISS,
        :TEETERDANCE,:TELEKINESIS,:MAGICPOWDER],
      [PBStats::SPATK,2] => [:HEALBLOCK,:PSYCHOSHIFT,:TARSHOT],
      [PBStats::SPATK,3] => [],
      [PBStats::SPDEF,1] => [:CHARGE,:CONFIDE,:COSMICPOWER,:CRAFTYSHIELD,:EERIEIMPULSE,:ENTRAINMENT,:FLATTER,:GLARE,:INGRAIN,
        :LIGHTSCREEN,:MAGICROOM,:MAGNETICFLUX,:MEANLOOK,:MISTYTERRAIN,:MUDSPORT,:SPOTLIGHT,:STUNSPORE,:THUNDERWAVE,
        :WATERSPORT,:WHIRLWIND,:WISH,:WONDERROOM,:CORROSIVEGAS],
      [PBStats::SPDEF,2] => [:AROMATICMIST,:CAPTIVATE,:IMPRISON,:MAGICCOAT,:POWDER],
      [PBStats::SPEED,1] => [:AFTERYOU,:AURORAVEIL,:ELECTRICTERRAIN,:ENCORE,:GASTROACID,:GRASSWHISTLE,:GUARDSPLIT,:GUARDSWAP,
        :HAIL,:HYPNOSIS,:LOCKON,:LOVELYKISS,:POWERSPLIT,:POWERSWAP,:QUASH,:RAINDANCE,:ROLEPLAY,:SAFEGUARD,
        :SANDSTORM,:SCARYFACE,:SING,:SKILLSWAP,:SLEEPPOWDER,:SPEEDSWAP,:STICKYWEB,:STRINGSHOT,:SUNNYDAY,
        :SUPERSONIC,:TOXICTHREAD,:WORRYSEED,:YAWN],
      [PBStats::SPEED,2] => [:ALLYSWITCH,:BESTOW,:MEFIRST,:RECYCLE,:SNATCH,:SWITCHEROO,:TRICK],
      [PBStats::ACCURACY,1]   => [:COPYCAT,:DEFENSECURL,:DEFOG,:FOCUSENERGY,:MIMIC,:SWEETSCENT,:TRICKROOM],
      [PBStats::EVASION,1]   => [:CAMOUFLAGE,:DETECT,:FLASH,:KINESIS,:LUCKYCHANT,:MAGNETRISE,:SANDATTACK,:SMOKESCREEN],
      [:allstat1]  => [:CONVERSION,:FORESTSCURSE,:GEOMANCY,:PURIFY,:SKETCH,:TRICKORTREAT,:CELEBRATE,:TEATIME,:STUFFCHEEKS],
      [:crit1]  => [:ACUPRESSURE,:FORESIGHT,:HEARTSWAP,:SLEEPTALK,:TAILWIND],
      [:reset]  => [:ACIDARMOR,:AGILITY,:AMNESIA,:ATTRACT,:AUTOTOMIZE,:BARRIER,:BATONPASS,:CALMMIND,:COIL,:COTTONGUARD,
        :COTTONSPORE,:DARKVOID,:DISABLE,:DOUBLETEAM,:DRAGONDANCE,:ENDURE,:FLORALHEALING,:FOLLOWME,:HEALORDER,
        :HEALPULSE,:HELPINGHAND,:IRONDEFENSE,:KINGSSHIELD,:LEECHSEED,:MILKDRINK,:MINIMIZE,:MOONLIGHT,:MORNINGSUN,
        :NASTYPLOT,:PERISHSONG,:PROTECT,:QUIVERDANCE,:RAGEPOWDER,:RECOVER,:REST,:ROCKPOLISH,:ROOST,:SHELLSMASH,
        :SHIFTGEAR,:SHOREUP,:SHELLSMASH,:SHIFTGEAR,:SHOREUP,:SLACKOFF,:SOFTBOILED,:SPORE,:SUBSTITUTE,:SWAGGER,
        :SWALLOW,:SWORDSDANCE,:SYNTHESIS,:TAILGLOW,:CLANGOROUSSOUL,:NORETREAT,:OBSTRUCT,:COURTCHANGE,:JUNGLEHEALING],
      [:heal]   => [:AROMATHERAPY,:BELLYDRUM,:CONVERSION2,:HAZE,:HEALBELL,:MIST,:PSYCHUP,:REFRESH,:SPITE,:STOCKPILE,
        :TELEPORT,:TRANSFORM,:DECORATE,:LIFEDEW],
      [:heal2]  => [:MEMENTO,:PARTINGSHOT],
      [:centre] => [:DESTINYBOND,:GRUDGE],
    })
    z_effect_hash.default=[]
    z_effect = z_effect_hash[move]

    # Single stat boosting z-move
    if z_effect.length==2 
      if attacker.pbCanIncreaseStatStage?(z_effect[0],false)
        attacker.pbIncreaseStat(z_effect[0],z_effect[1],abilitymessage:false)
        boostlevel = ["","sharply ", "drastically "]
        @battle.pbDisplayBrief(_INTL("{1}'s Z-Power {2}boosted its {3}!",attacker.pbThis,boostlevel[z_effect[1]-1],attacker.pbGetStatName(z_effect[0])))
        return
      end
    end

    #Special effect
    case z_effect[0]
    when :allstat1
      for stat in [PBStats::ATTACK,PBStats::DEFENSE,PBStats::SPATK,PBStats::SPDEF,PBStats::SPEED]
        if attacker.pbCanIncreaseStatStage?(stat,false)
          attacker.pbIncreaseStat(stat,1,abilitymessage:false)
        end
      end
      @battle.pbDisplayBrief(_INTL("{1}'s Z-Power boosted its stats!",attacker.pbThis))
    when :crit1
      if attacker.effects[:FocusEnergy]<3
        attacker.effects[:FocusEnergy]+=2
        attacker.effects[:FocusEnergy]=3 if attacker.effects[:FocusEnergy]>3
        @battle.pbDisplayBrief(_INTL("{1}'s Z-Power is getting it pumped!",attacker.pbThis))
      end
    when :reset
      for i in [PBStats::ATTACK,PBStats::DEFENSE,
                PBStats::SPEED,PBStats::SPATK,PBStats::SPDEF,
                PBStats::EVASION,PBStats::ACCURACY]
        if attacker.stages[i]<0
          attacker.stages[i]=0
        end
      end
      @battle.pbDisplayBrief(_INTL("{1}'s Z-Power returned its decreased stats to normal!",attacker.pbThis))
    when :heal
      attacker.pbRecoverHP(attacker.totalhp,false)
      @battle.pbDisplayBrief(_INTL("{1}'s Z-Power restored its health!",attacker.pbThis))
    when :heal2
      attacker.effects[:ZHeal]=true
    when :centre
      attacker.effects[:FollowMe]=true
      if !attacker.pbPartner.isFainted?
        attacker.pbPartner.effects[:FollowMe]=false
        attacker.pbPartner.effects[:RagePowder]=false
        @battle.pbDisplayBrief(_INTL("{1}'s Z-Power made it the centre of attention!",attacker.pbThis))
      end
    end
  end
end