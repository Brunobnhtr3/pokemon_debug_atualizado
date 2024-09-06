$GamePokemonForms = {

=begin
TEMPLATE
    
:POKEMON => {
    :FormName => {
        0 => "Normal",
        1 => "Mega",
        2 => "Ligma"
    },
    :DefaultForm => 0,
    :MegaForm => 1,

    :OnCreation => proc{
        maps=[]
        # Map IDs for Ligma form
        if $game_map && maps.include?($game_map.map_id)
            next 2
        else
            next 0
        end
    },

    "Ligma" => {
        :DexEntry => "Long description.",
        :Height => 69,
        :Weight => 420,
        :Type1 => :NORMAL,
        :Type2 => :NORMAL,
        :Ability => [:BLAZE,:DAMP,:FRISK],
        :EVs => [3,0,0,0,0,0],
        :BaseStats => [10,20,30,40,50,60],
        :Movelist => [[1,:POUND],[4,:HARDEN],[12,:BITE],[26,:FLING],
            [32,:CRUNCH],[37,:SCREECH],[46,:BELCH],[48,:MEMENTO]],
        :EggMoves => [:CURSE,:IMPRISON,:MEANLOOK,
            :PURSUIT,:SCARYFACE,:SPITE,:SPITUP],
        :WildHoldItems => [nil,:CELLBATTERY,nil],
        :GetEvo => [[101,7,15]]		# [Mon, Method, Condition]
    }
},

=end

###################### Deso Megas ######################

# 160
:FERALIGATR =>{
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:FERALIGATRITE => 1
	},
	"Mega" => {
		:Type2 => :POISON,
		:Ability => :SHEERFORCE,
		:BaseStats => [85,145,130,79,93,98]
	},
},

# 262
:MIGHTYENA =>{
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:MIGHTYENITE => 1
	},
	"Mega" => {
		:Type2 => :GHOST,
		:Ability => :DARKSURGE,
		:BaseStats => [70,125,70,60,70,125]
	},
},

# 405
:LUXRAY =>{
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:LUXRITE => 1
	},
	"Mega" => {
		:Type2 => :DARK,
		:Ability => :STRONGJAW,
		:BaseStats => [80,145,99,95,79,125]
	},
},

# 454
:TOXICROAK =>{
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:TOXICROAKITE => 1
	},
	"Mega" => {
		:Ability => :ADAPTABILITY,
		:BaseStats => [83,136,70,116,70,115]
	},

},

# 573
:CINCCINO=>{
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:CINCCINITE => 1,
	},
	"Mega" => {
		:Type2 => :FAIRY,
		:Ability => :SKILLLINK,
		:BaseStats => [75,135,110,55,75,120]
	}
},

###################### Deso Perfection ######################

# 197
:UMBREON=>{
	:FormName => {
		0 => "Normal",
		1 => "Perfection"
	},
	:PerfectionForm => 1,
	"Perfection" => {
		:Type2 => :PSYCHIC,
		:Ability => :MAGICBOUNCE,
		:BaseStats => [95,65,150,130,160,75]
	}
},

# 491
:DARKRAI =>{
	:FormName => {
		0 => "Normal",
		1 => "Perfection"
	},
	:PerfectionForm => 1,
	"Perfection" => {
		:Weight => 1011,
		:Type2 => :GHOST,
		:Ability => :BADDREAMS,
		:BaseStats => [70,90,95,165,100,170]
	}
},

###################### Other ######################

:DEERLING => {
	:OnCreation => proc{
		maps=Deerling
		case rand(2)
			when 0 then next $game_map && maps.include?($game_map.map_id) ? 2 : 0
			when 1 then next $game_map && maps.include?($game_map.map_id) ? 3 : 1
		end
	}
},

:SAWSBUCK => {
	:OnCreation => proc{
		maps=Deerling
		case rand(2)
			when 0 then next $game_map && maps.include?($game_map.map_id) ? 2 : 0
			when 1 then next $game_map && maps.include?($game_map.map_id) ? 3 : 1
		end
	}
},

:STUNFISK =>{
    :OnCreation => proc{
    maps=Stunfisk
    if $game_map && maps.include?($game_map.map_id) && $game_switches[797]
        next 1
    else
        next 0
    end
    },

}
}
