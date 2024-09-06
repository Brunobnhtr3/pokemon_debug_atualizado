FormCopy = [
	[:FLABEBE,:FLOETTE],
	[:FLABEBE,:FLORGES],
	[:SHELLOS,:GASTRODON],
	[:DEERLING,:SAWSBUCK]
]
#this is the hash that will become the full multforms hash
$PokemonForms = {

:UNOWN => {
	:OnCreation => proc{rand(28)},
	:FormName => {
		0 => "A",
		1 => "B",
		2 => "C",
		3 => "D",
		4 => "E",
		5 => "F",
		6 => "G",
		7 => "H",
		8 => "I",
		9 => "J",
		10 => "K",
		11 => "L",
		12 => "M",
		13 => "N",
		14 => "O",
		15 => "P",
		16 => "Q",
		17 => "R",
		18 => "S",
		19 => "T",
		20 => "U",
		21 => "V",
		22 => "W",
		23 => "X",
		24 => "Y",
		25 => "Z",
		26 => "?",
		27 => "!",
	}
},

:FLABEBE => {
	:OnCreation => proc{rand(5)},
	:FormName => {
		0 => "Red Flower",
		1 => "Yellow Flower",
		2 => "Orange Flower",
		3 => "Blue Flower",
		4 => "White Flower",
	}
},

:CASTFORM => {
	:FormName => {
		0 => "Normal Form",
		1 => "Sunny Form",
		2 => "Rainy Form",
		3 => "Snowy Form"
	},

	"Sunny Form" => {
		:Type1 => :FIRE,
	},
	"Rainy Form" => {
		:Type1 => :WATER,
	},
	"Snowy Form" => {
		:Type1 => :ICE,
	}
},

:DEOXYS => {
	:FormName => {
		0 => "Normal Forme",
		1 => "Attack Forme",
		2 => "Defense Forme",
		3 => "Speed Forme"
	},

	"Attack Forme" => {
		:BaseStats => [50,180,20,180,20,150],
		:EVs => [0,2,0,0,1,0],
		:Movelist => [[1,:LEER],[1,:WRAP],[7,:NIGHTSHADE],[13,:TELEPORT],
		[19,:TAUNT],[25,:PURSUIT],[31,:PSYCHIC],[37,:SUPERPOWER],
		[43,:PSYCHOSHIFT],[49,:ZENHEADBUTT],[55,:COSMICPOWER],
		[61,:ZAPCANNON],[67,:PSYCHOBOOST],[73,:HYPERBEAM]],
	},

	"Defense Forme" => {
		:BaseStats => [50, 70,160, 70,160, 90],
		:EVs => [0,0,2,0,0,1],
		:Movelist => [[1,:LEER],[1,:WRAP],[7,:NIGHTSHADE],[13,:TELEPORT],
		[19,:KNOCKOFF],[25,:SPIKES],[31,:PSYCHIC],[37,:SNATCH],
		[43,:PSYCHOSHIFT],[49,:ZENHEADBUTT],[55,:IRONDEFENSE],
		[55,:AMNESIA],[61,:RECOVER],[67,:PSYCHOBOOST],
		[73,:COUNTER],[73,:MIRRORCOAT]],
	},

	"Speed Forme" => {
		:BaseStats => [50, 95, 90, 95, 90,180],
		:EVs => [0,0,0,3,0,0],
		:Movelist => [[1,:LEER],[1,:WRAP],[7,:NIGHTSHADE],[13,:DOUBLETEAM],
		[19,:KNOCKOFF],[25,:PURSUIT],[31,:PSYCHIC],[37,:SWIFT],
		[43,:PSYCHOSHIFT],[49,:ZENHEADBUTT],[55,:AGILITY],
		[61,:RECOVER],[67,:PSYCHOBOOST],[73,:EXTREMESPEED]],
	}
},

:BURMY => {
	:FormName => {
		0 => "Plant Cloak",
		1 => "Sandy Cloak",
		2 => "Trash Cloak"
	},

	:OnCreation => proc{
		begin #horribly stupid section to make the battle stress test work
			if PBFields::TRASHCLOAK.include?(@battle.FE)
				next 2 # Trash Cloak
			elsif PBFields::PLANTCLOAK.include?(@battle.FE)
				next 0 # Plant Cloak
			elsif PBFields::SANDYCLOAK.include?(@battle.FE)
				next 1 #Sandy Cloak
			else
				env=pbGetEnvironment()
				if env==:Sand || env==:Rock || env==:Cave
					next 1 # Sandy Cloak
				elsif $cache.mapdata[$game_map.map_id].Outdoor
					next 2 # Trash Cloak
				else
					next 0 # Plant Cloak
				end
			end
		rescue
			next 0
		end
	}
},

:WORMADAM => {
	:FormName => {
		0 => "Plant Cloak",
		1 => "Sandy Cloak",
		2 => "Trash Cloak"
	},

	:OnCreation => proc{
		begin #horribly stupid section to make the battle stress test work
			if PBFields::TRASHCLOAK.include?(@battle.FE)
				next 2 # Trash Cloak
			elsif PBFields::PLANTCLOAK.include?(@battle.FE)
				next 0 # Plant Cloak
			elsif PBFields::SANDYCLOAK.include?(@battle.FE)
				next 1 #Sandy Cloak
			else
				env=pbGetEnvironment()
				if env==:Sand || env==:Rock || env==:Cave
					next 1 # Sandy Cloak
				elsif $cache.mapdata[$game_map.map_id].Outdoor
					next 2 # Trash Cloak
				else
					next 0 # Plant Cloak
				end
			end
		rescue
			next 0
		end
	},

	"Sandy Cloak" => {
		:BaseStats => [60,79,105,59,85,36],
		:EVs => [0,0,2,0,0,0],
		:Type2 => :GROUND,
		:Movelist => [[0,:QUIVERDANCE],[1,:SUCKERPUNCH],
		[1,:TACKLE],[1,:PROTECT],[1,:BUGBITE],
		[10,:PROTECT],[15,:BUGBITE],[20,:HIDDENPOWER],
		[23,:CONFUSION],[26,:ROCKBLAST],[29,:HARDEN],[32,:PSYBEAM],
		[35,:CAPTIVATE],[38,:FLAIL],[41,:ATTRACT],[44,:PSYCHIC],
		[47,:FISSURE],[50,:BUGBUZZ]],
		:compatiblemoves => [:ALLYSWITCH,:BUGBITE,:BUGBUZZ,:BULLDOZE,:DREAMEATER,
			:EARTHPOWER,:EARTHQUAKE,:ELECTROWEB,:ENDEAVOR,:GIGAIMPACT,:HYPERBEAM,
			:INFESTATION,:MUDSHOT,:MUDSLAP,:PSYCHIC,:PSYCHUP,:RAINDANCE,:ROCKBLAST,
			:ROCKTOMB,:ROLLOUT,:SAFEGUARD,:SANDSTORM,:SANDTOMB,:SHADOWBALL,:SIGNALBEAM,
			:SKILLSWAP,:STEALTHROCK,:SUCKERPUNCH,:SUNNYDAY,:TELEKINESIS,:THIEF,:UPROAR,
			:VENOSHOCK],
		:moveexceptions => [],
	},

	"Trash Cloak" => {
		:BaseStats => [60,69,95,69,95,36],
		:EVs => [0,0,1,0,0,1],
		:Type2 => :STEEL,
		:Movelist => [[0,:QUIVERDANCE],[1,:METALBURST],[1,:SUCKERPUNCH],
		[1,:TACKLE],[1,:PROTECT],[1,:BUGBITE],[10,:PROTECT],
		[15,:BUGBITE],[20,:HIDDENPOWER],[23,:CONFUSION],[26,:MIRRORSHOT],
		[29,:METALSOUND],[32,:PSYBEAM],[35,:CAPTIVATE],[38,:FLAIL],
		[41,:ATTRACT],[44,:PSYCHIC],[47,:IRONHEAD],[50,:BUGBUZZ]],
		:compatiblemoves => [:ALLYSWITCH,:BUGBITE,:BUGBUZZ,:DIG,:DOUBLETEAM,
			:DREAMEATER,:ELECTROWEB,:ENDEAVOR,:FLASHCANNON,:GIGAIMPACT,:GUNKSHOT,
			:GYROBALL,:HYPERBEAM,:INFESTATION,:IRONDEFENSE,:IRONHEAD,:MAGNETRISE,
			:PSYCHIC,:PSYCHUP,:RAINDANCE,:SAFEGUARD,:SHADOWBALL,:SIGNALBEAM,:SKILLSWAP,
			:STEALTHROCK,:SUCKERPUNCH,:SUNNYDAY,:TELEKINESIS,:THIEF,:UPROAR,:VENOSHOCK],
		:moveexceptions => [],
	}
},

:CHERRIM => {
	:FormName => {
		0 => "Overcast Form",
		1 => "Sunshine Form",
	}
},

:SHELLOS => {
	:FormName => {
		0 => "West Sea",
		1 => "East Sea"
	},

	:OnCreation => proc{
		
		# Map IDs for second form
		if $game_map && Shellos.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	}
},

:ROTOM => {
	:FormName => {
		0 => "Rotom",
		1 => "Heat Rotom",
		2 => "Wash Rotom",
		3 => "Frost Rotom",
		4 => "Fan Rotom",
		5 => "Mow Rotom"
	},

	"Heat Rotom" => {
		:Type2 => :FIRE,
		:BaseStats => [50,65,107,105,107,86]
	},
	"Wash Rotom" => {
		:Type2 => :WATER,
		:BaseStats => [50,65,107,105,107,86]
	},
	"Frost Rotom" => {
		:Type2 => :ICE,
		:BaseStats => [50,65,107,105,107,86]
	},
	"Fan Rotom" => {
		:Type2 => :FLYING,
		:BaseStats => [50,65,107,105,107,86]
	},
	"Mow Rotom" => {
		:Type2 => :GRASS,
		:BaseStats => [50,65,107,105,107,86]
	}
},

:DIALGA => {
	:FormName => {
		0 => "Dialga",
		1 => "Origin Forme"
	},

	"Origin Forme" => {
		:BaseStats => [100,100,120,150,120,90],
		:Height => 70,
		:Weight => 8500
	}
},

:PALKIA => {
	:FormName => {
		0 => "Palkia",
		1 => "Origin Forme"
	},

	"Origin Forme" => {
		:BaseStats => [90,100,100,150,120,120],
		:Height => 63,
		:Weight => 6600
	}
},

:GIRATINA => {
	:FormName => {
		0 => "Altered Forme",
		1 => "Origin Forme"
	},

	"Origin Forme" => {
		:BaseStats => [150,120,100,120,100,90],
		:Ability => :LEVITATE,
		:Height => 69,
		:Weight => 6500
	}
},

:SHAYMIN => {
	:FormName => {
		0 => "Land Forme",
		1 => "Sky Forme"
	},

	"Sky Forme" => {
		:BaseStats => [100,103,75,120,75,127],
		:EVs => [0,0,0,3,0,0],
		:Type2 => :FLYING,
		:Ability => :SERENEGRACE,
		:Movelist => [[1,:GROWTH],[10,:MAGICALLEAF],[19,:LEECHSEED],[28,:QUICKATTACK],
		[37,:SWEETSCENT],[46,:NATURALGIFT],[55,:WORRYSEED],[64,:AIRSLASH],
		[73,:ENERGYBALL],[82,:SWEETKISS],[91,:LEAFSTORM],[100,:SEEDFLARE]],
		:compatiblemoves => [:AIRCUTTER,:AIRSLASH,:BULLETSEED,:CHARM,:COVET,
			:DAZZLINGGLEAM,:ENERGYBALL,:FLASH,:GIGADRAIN,:GIGAIMPACT,:GRASSKNOT,
			:HEADBUTT,:HURRICANE,:HYPERBEAM,:LASERFOCUS,:LASTRESORT,:LEAFBLADE,
			:LEAFSTORM,:MAGICALLEAF,:MUDSLAP,:NATUREPOWER,:OMINOUSWIND,:PSYCHIC,
			:PSYCHUP,:SAFEGUARD,:SEEDBOMB,:SOLARBEAM,:SOLARBLADE,:SUNNYDAY,:SWIFT,
			:SWORDSDANCE,:SYNTHESIS,:TAILWIND,:WORRYSEED,:ZENHEADBUTT],
		:moveexceptions => [],
		:Height => 04,
		:Weight => 52
	}
},

:BASCULIN => {
	:OnCreation => proc{rand(2)},
	:FormName => {
		0 => "Red-Striped",
		1 => "Blue-Striped",
		#2 => "White-Striped"
	},

	"Blue-Striped" => {
		:Ability => [:ROCKHEAD,:ADAPTABILITY,:MOLDBREAKER],
		:WildHoldItems => [nil,:DEEPSEASCALE,nil]
	},

	#"White-Striped" => {
	#	:DexEntry => "Though it differs from other Basculin in several respects, including demeanor—this one is gentle—I have categorized it as a regional form given the vast array of shared qualities.",  
	#	:Ability => [:RATTLED,:ADAPTABILITY,:MOLDBREAKER],
	#	:Movelist => [[1,:TACKLE],[6,:AQUAJET],[11,:BITE],[18,:ZENHEADBUTT],
	#	[25,:CRUNCH],[34,:WAVECRASH],[43,:DOUBLEEDGE]],
	#	:compatiblemoves => [:AGILITY,:AQUATAIL,:BLIZZARD,:CRUNCH,:DOUBLEEDGE,:ENDEAVOR,
	#		:HEADBUTT,:HYDROPUMP,:ICEBEAM,:ICEFANG,:ICYWIND,:LIQUIDATION,:MUDSHOT,:PSYCHICFANGS,
	#		:RAINDANCE,:SCARYFACE,:SURF,:SWIFT,:TAKEDOWN,:UPROAR,:WATERFALL,:WATERPULSE,
	#		:ZENHEADBUTT],
	#	:moveexceptions => [],
	#	:GetEvo => [[:BASCULEIGON,:HasMove,:DOUBLEEDGE]]  # [Basculegion, HasMove, Double-Edge]
	#}
},

:DARUMAKA => {
	:FormName => {
		2 => "Galarian"
	},

	:OnCreation => proc{
		# Map IDs for Galarian form
		if $game_map && Darumaka.include?($game_map.map_id)
			next 2
		else
			next 0
		end
	},

	"Galarian" => {
		:DexEntry => "It lived in snowy areas for so long that its fire sac cooled off and atrophied. It now has an organ that generates cold instead.",
		:Type1 => :ICE,
		:Movelist => [[1,:TACKLE],[1,:POWDERSNOW],[4,:TAUNT],[8,:BITE],
		[12,:AVALANCHE],[16,:WORKUP],[20,:ICEFANG],[24,:HEADBUTT],[28,:ICEPUNCH],
		[32,:UPROAR],[36,:BELLYDRUM],[40,:BLIZZARD],[44,:THRASH],[48,:SUPERPOWER]],
		:EggMoves => [:FLAMEWHEEL,:FOCUSPUNCH,:FREEZEDRY,:HAMMERARM,
		:INCINERATE,:POWERUPPUNCH,:TAKEDOWN,:YAWN],
		:compatiblemoves => [:AVALANCHE,:BLIZZARD,:BRICKBREAK,:DIG,:ENCORE,:FIREBLAST,
			:FIREFANG,:FIREPUNCH,:FIRESPIN,:FLAMETHROWER,:FLAREBLITZ,:FLING,:FOCUSENERGY,
			:FOCUSPUNCH,:GRASSKNOT,:GYROBALL,:HEADBUTT,:HEATWAVE,:ICEBEAM,:ICEFANG,
			:ICEPUNCH,:INCINERATE,:MEGAKICK,:MEGAPUNCH,:OVERHEAT,:POWERUPPUNCH,:ROCKSLIDE,
			:ROCKTOMB,:SOLARBEAM,:SUNNYDAY,:SUPERPOWER,:TAUNT,:THIEF,:UPROAR,:UTURN,:WILLOWISP,
			:WORKUP,:ZENHEADBUTT],
		:moveexceptions => [],
	}
},

:DARMANITAN => {
	:FormName => {
		0 => "Standard Mode",
		1 => "Zen Mode",
		2 => "Galarian Standard Mode",
		3 => "Galarian Zen Mode"
	},

	:OnCreation => proc{
		# Map IDs for Galarian form
		if $game_map && Darumaka.include?($game_map.map_id)
			next 2
		else
			next 0
		end
	},

	"Zen Mode" => {
		:DexEntry => "When wounded, it stops moving. It goes as still as stone to meditate, sharpening its mind and spirit.",
		:BaseStats => [105,30,105,140,105,55],
		:EVs => [0,0,0,0,2,0],
		:Type2 => :PSYCHIC
	},

	"Galarian Standard Mode" => {
		:DexEntry => "Though it has a gentle disposition, it’s also very strong. It will quickly freeze the snowball on its head before going for a headbutt.",
		:Type1 => :ICE,
		:Ability => [:GORILLATACTICS,:GORILLATACTICS,:ZENMODE],
		:Movelist => [[0,:ICICLECRASH],[1,:ICICLECRASH],[1,:POWDERSNOW],[1,:TACKLE],[1,:TAUNT],[1,:BITE],
		[12,:AVALANCHE],[16,:WORKUP],[20,:ICEFANG],[24,:HEADBUTT],
		[28,:ICEPUNCH],[32,:UPROAR],[38,:BELLYDRUM],
		[44,:BLIZZARD],[50,:THRASH],[56,:SUPERPOWER]],
		:compatiblemoves => [:AVALANCHE,:BLIZZARD,:BODYPRESS,:BODYSLAM,:BRICKBREAK,:BULKUP,
			:BULLDOZE,:BURNINGJEALOUSY,:DIG,:EARTHQUAKE,:ENCORE,:FIREBLAST,:FIREFANG,:FIREPUNCH,
			:FIRESPIN,:FLAMETHROWER,:FLAREBLITZ,:FLING,:FOCUSBLAST,:FOCUSENERGY,:FOCUSPUNCH,
			:GIGAIMPACT,:GRASSKNOT,:GYROBALL,:HEADBUTT,:HEATWAVE,:HYPERBEAM,:ICEBEAM,:ICEFANG,
			:ICEPUNCH,:INCINERATE,:IRONDEFENSE,:IRONHEAD,:LASHOUT,:MEGAKICK,:MEGAPUNCH,:OVERHEAT,
			:PAYBACK,:POWERUPPUNCH,:PSYCHIC,:REVERSAL,:ROCKSLIDE,:ROCKTOMB,:SOLARBEAM,:STONEEDGE,
			:SUNNYDAY,:SUPERPOWER,:TAUNT,:THIEF,:UPROAR,:UTURN,:WILLOWISP,:WORKUP,:ZENHEADBUTT],
		:moveexceptions => [],
		:Height => 1.7,
		:Weight => 120,
		:preevo => {
			:species => :DARUMAKA,
			:form => 2, 
		  },
	},

	"Galarian Zen Mode" => {
		:DexEntry => "Darmanitan takes this form when enraged. It won't stop spewing flames until its rage has settled, even if its body starts to melt.",
		:BaseStats => [105,160,55,30,55,135],
		:EVs => [0,0,0,0,2,0],
		:Type1 => :ICE,
		:Type2 => :FIRE,
		:Ability => [:GORILLATACTICS,:GORILLATACTICS,:ZENMODE],
		:Movelist => [[0,:ICICLECRASH],[1,:ICICLECRASH],[1,:POWDERSNOW],[1,:TACKLE],[1,:TAUNT],[1,:BITE],
		[12,:AVALANCHE],[16,:WORKUP],[20,:ICEFANG],[24,:HEADBUTT],
		[28,:ICEPUNCH],[32,:UPROAR],[38,:BELLYDRUM],
		[44,:BLIZZARD],[50,:THRASH],[56,:SUPERPOWER]],
		:compatiblemoves => [:AVALANCHE,:BLIZZARD,:BODYPRESS,:BODYSLAM,:BRICKBREAK,:BULKUP,
			:BULLDOZE,:BURNINGJEALOUSY,:DIG,:EARTHQUAKE,:ENCORE,:FIREBLAST,:FIREFANG,:FIREPUNCH,
			:FIRESPIN,:FLAMETHROWER,:FLAREBLITZ,:FLING,:FOCUSBLAST,:FOCUSENERGY,:FOCUSPUNCH,
			:GIGAIMPACT,:GRASSKNOT,:GYROBALL,:HEADBUTT,:HEATWAVE,:HYPERBEAM,:ICEBEAM,:ICEFANG,
			:ICEPUNCH,:INCINERATE,:IRONDEFENSE,:IRONHEAD,:LASHOUT,:MEGAKICK,:MEGAPUNCH,:OVERHEAT,
			:PAYBACK,:POWERUPPUNCH,:PSYCHIC,:REVERSAL,:ROCKSLIDE,:ROCKTOMB,:SOLARBEAM,:STONEEDGE,
			:SUNNYDAY,:SUPERPOWER,:TAUNT,:THIEF,:UPROAR,:UTURN,:WILLOWISP,:WORKUP,:ZENHEADBUTT],
		:moveexceptions => [],
		:Height => 1.7,
		:Weight => 120
	}
},

:DEERLING => {
	:FormName => {
		0 => "Spring Form",
		1 => "Summer Form",
		2 => "Autumn Form",
		3 => "Winter Form"
	}
},

:TORNADUS => {
	:FormName => {
		0 => "Incarnate Forme",
		1 => "Therian Forme"
	},

	"Therian Forme" => {
		:BaseStats => [79,100,80,110,90,121],
		:EVs => [0,0,0,3,0,0],
		:Ability => :REGENERATOR,
		:Height => 14
	}
},

:THUNDURUS => {
	:FormName => {
		0 => "Incarnate Forme",
		1 => "Therian Forme"
	},
	
	"Therian Forme" => {
		:BaseStats => [79,105,70,145,80,101],
		:EVs => [0,0,0,0,3,0],
		:Ability => :VOLTABSORB,
		:Height => 30
	}
},

:LANDORUS => {
	:FormName => {
		0 => "Incarnate Forme",
		1 => "Therian Forme"
	},
	
	"Therian Forme" => {
		:BaseStats => [89,145,90,105,80,91],
		:EVs => [0,3,0,0,0,0],
		:Ability => :INTIMIDATE,
		:Height => 13
	}
},

# :ENAMORUS => {
# 	:FormName => {
# 		0 => "Incarnate Forme",
# 		1 => "Therian Forme"
# 	},
	
# 	"Therian Forme" => {
# 		:BaseStats => [74,115,110,135,100,46],
# 		:EVs => [0,0,0,3,0,0],
# 		:Ability => :OVERCOAT
# 	}
# },

:KYUREM => {
	:FormName => {
		0 => "Kyurem",
		1 => "White Kyurem",
		2 => "Black Kyurem"
	},
	
	"White Kyurem" => {
		:BaseStats => [125,120,90,170,100,95],
		:EVs => [0,0,0,0,3,0],
		:Movelist => [[1,:ICYWIND],[1,:DRAGONRAGE],[8,:IMPRISON],
		[15,:ANCIENTPOWER],[22,:ICEBEAM],[29,:DRAGONBREATH],
		[36,:SLASH],[43,:FUSIONFLARE],[50,:ICEBURN],
		[57,:DRAGONPULSE],[64,:NOBLEROAR],[71,:ENDEAVOR],
		[78,:BLIZZARD],[85,:OUTRAGE],[92,:HYPERVOICE]],
		:Ability => :TURBOBLAZE,
		:toobig => true,
		:Height => 36
	},

	"Black Kyurem" => {
		:BaseStats => [125,170,100,120,90,95],
		:EVs => [0,3,0,0,0,0],
		:Movelist => [[1,:ICYWIND],[1,:DRAGONRAGE],[8,:IMPRISON],
		[15,:ANCIENTPOWER],[22,:ICEBEAM],[29,:DRAGONBREATH],
		[36,:SLASH],[43,:FUSIONBOLT],[50,:FREEZESHOCK],
		[57,:DRAGONPULSE],[64,:NOBLEROAR],[71,:ENDEAVOR],
		[78,:BLIZZARD],[85,:OUTRAGE],[92,:HYPERVOICE]],
		:Ability => :TERAVOLT,
		:toobig => true,
		:Height => 33
	}
},

:KELDEO => {
	:FormName => {
		0 => "Ordinary Form",
		1 => "Resolute Form"
	}
},

:MELOETTA => {
	:FormName => {
		0 => "Aria Forme",
		1 => "Pirouette Forme"
	},
	
	"Pirouette Forme" => {
		:BaseStats => [100,128,90,77,77,128],
		:EVs => [0,1,1,1,0,0],
		:Type2 => :FIGHTING,
	}
},

:GENESECT => {
	:FormName => {
		0 => "Normal",
		1 => "Shock Drive",
		2 => "Burn Drive",
		3 => "Chill Drive",
		4 => "Douse Drive",
	}
},

:MEOWSTIC => {
	:FormName => {
		0 => "Male",
		1 => "Female"
	},

	"Female" => {
		:Movelist => [[1,:STOREDPOWER],[1,:MEFIRST],[1,:MAGICALLEAF],[1,:SCRATCH],
			[1,:LEER],[1,:COVET],[1,:CONFUSION],[5,:COVET],[9,:CONFUSION],[13,:LIGHTSCREEN],
			[17,:PSYBEAM],[19,:FAKEOUT],[22,:DISARMINGVOICE],[25,:PSYSHOCK],[28,:CHARGEBEAM],
			[31,:SHADOWBALL],[35,:EXTRASENSORY],[40,:PSYCHIC],
			[43,:ROLEPLAY],[45,:SIGNALBEAM],[48,:SUCKERPUNCH],
			[50,:FUTURESIGHT],[53,:STOREDPOWER]],
		:compatiblemoves => [:ALLYSWITCH,:CALMMIND,:CHARGEBEAM,:CHARM,:COVET,
			:CUT,:DARKPULSE,:DIG,:DREAMEATER,:ECHOEDVOICE,:ENERGYBALL,:EXPANDINGFORCE,
			:FAKEOUT,:FAKETEARS,:FLASH,:FUTURESIGHT,:GIGAIMPACT,:GRAVITY,:HEALBELL,
			:HELPINGHAND,:HYPERBEAM,:IRONTAIL,:LIGHTSCREEN,:MAGICALLEAF,:MAGICCOAT,
			:MAGICROOM,:NASTYPLOT,:PAYBACK,:PAYDAY,:PLAYROUGH,:POWERUPPUNCH,:PSYCHIC,
			:PSYCHICTERRAIN,:PSYCHUP,:PSYSHOCK,:RAINDANCE,:RECYCLE,:REFLECT,:ROLEPLAY,
			:SAFEGUARD,:SHADOWBALL,:SHOCKWAVE,:SIGNALBEAM,:SKILLSWAP,:SNATCH,:STOREDPOWER,
			:SUCKERPUNCH,:SUNNYDAY,:SWIFT,:TAILSLAP,:TELEKINESIS,:THUNDERBOLT,:THUNDERWAVE,
			:TORMENT,:TRICK,:TRICKROOM,:WONDERROOM,:WORKUP,:ZENHEADBUTT],
		:moveexceptions => [],
		:Ability => [:KEENEYE, :INFILTRATOR, :COMPETITIVE]
	}
},

:PUMPKABOO => {
	:OnCreation => proc{rand(2)},
	:FormName => {
		0 => "Normal", 
		1 => "Small"
	},

	"Small" => {
		:BaseStats => [44,66,70,44,55,56],
		:Height => 03,
		:Weight => 35
	}
},

:GOURGEIST => {
	:OnCreation => proc{rand(2)},
	:FormName => {
		0 => "Normal", 
		1 => "Small"
	},

	"Small" => {
		:BaseStats => [55,85,122,58,75,99],
		:Height => 07,
		:Weight => 95
	}
},

:AEGISLASH => {
	:FormName => {
		0 => "Shield Forme",
		1 => "Blade Forme"
	},

	"Blade Forme" => {
		:BaseStats => [60,140,50,140,50,60]
	}
},

:ZYGARDE => {
	:FormName => {
		0 => "50% Forme",
		1 => "10% Forme",
		2 => "Complete Forme"
	},

	"10% Forme" => {
		:DexEntry => "Its sharp fangs make short work of finishing off its enemies, but it's unable to maintain this body indefinitely. After a period of time, it falls apart.",
		:BaseStats => [54,100,71,61,85,115],
		:Height => 12,
		:Weight => 335
	},

	"Complete Forme" => {
		:DexEntry => "This is Zygarde's form at times when it uses its overwhelming power to suppress those who endanger the ecosystem.",
		:BaseStats => [216,100,121,91,95,85],
		:Height => 45,
		:Weight => 6100
	}
},

:HOOPA => {
	:FormName => {
		0 => "Hoopa Confined",
		1 => "Hoopa Unbound"
	},

	"Hoopa Unbound" => {
		:BaseStats => [80,160,60,170,130,80],
		:Type2 => :DARK,
		:Movelist => [[1,:HYPERSPACEFURY],[1,:TRICK],[1,:DESTINYBOND],[1,:ALLYSWITCH],
		[1,:CONFUSION],[6,:ASTONISH],[10,:MAGICCOAT],[15,:LIGHTSCREEN],
		[19,:PSYBEAM],[25,:SKILLSWAP],[29,:POWERSPLIT],[29,:GUARDSPLIT],
		[46,:KNOCKOFF],[50,:WONDERROOM],[50,:TRICKROOM],[55,:DARKPULSE],
		[75,:PSYCHIC],[85,:HYPERSPACEFURY]],
		:Height => 65,
		:Weight => 4900
	}
},

:ORICORIO => {
	:FormName => {
		0 => "Balie Style",
		1 => "Pom-Pom Style",
		2 => "Pa'u Style",
		3 => "Sensu Style"
	},

	"Pom-Pom Style" => {
		:DexEntry => "It creates an electric charge by rubbing its feathers together. It dances over to its enemies and delivers shocking electrical punches.",
		:Type1 => :ELECTRIC,
		:Type2 => :FLYING,
	},

	"Pa'u Style" => {
		:DexEntry => "This Oricorio relaxes by swaying gently. This increases its psychic energy, which it then fires at its enemies.",
		:Type1 => :PSYCHIC,
		:Type2 => :FLYING,
	},

	"Sensu Style" => {
		:DexEntry => "It summons the dead with its dreamy dancing. From their malice, it draws power with which to curse its enemies.",
		:Type1 => :GHOST,
		:Type2 => :FLYING,
	}
},

:LYCANROC => {
	:FormName => {
		0 => "Midday Form",
		1 => "Midnight Form",
		2 => "Dusk Form"
	},

	:OnCreation => proc{
		daytime = PBDayNight.isDay?(pbGetTimeNow)
		dusktime = PBDayNight.isDusk?(pbGetTimeNow)
		# Map IDs for second form
		if dusktime
			next 2
		elsif daytime
			next 0
		else
			next 1
		end
	},

	"Midnight Form" => {
		:DexEntry => "It goads its enemies into attacking, withstands the hits, and in return, delivers a headbutt, crushing their bones with its rocky mane.",
		:BaseStats => [85,115,75,55,75,82],
		:Ability => [:KEENEYE,:VITALSPIRIT,:NOGUARD],
		:Movelist => [[0,:COUNTER],[1,:REVERSAL],[1,:TAUNT],
		[1,:TACKLE],[1,:LEER],[1,:SANDATTACK],
		[1,:BITE],[4,:SANDATTACK],[7,:BITE],[12,:HOWL],
		[15,:ROCKTHROW],[18,:ODORSLEUTH],[23,:ROCKTOMB],
		[26,:ROAR],[29,:STEALTHROCK],[34,:ROCKSLIDE],
		[37,:SCARYFACE],[40,:CRUNCH],[45,:ROCKCLIMB],
		[48,:STONEEDGE]],
		:compatiblemoves => [:BRICKBREAK,:BULKUP,:CLOSECOMBAT,:COUNTER,
			:COVET,:CRUNCH,:DUALCHOP,:EARTHPOWER,:ECHOEDVOICE,:ENDEAVOR,
			:FIREFANG,:FIREPUNCH,:FOCUSPUNCH,:FOULPLAY,:GIGAIMPACT,
			:HYPERVOICE,:IRONDEFENSE,:IRONHEAD,:IRONTAIL,:LASERFOCUS,
			:LASHOUT,:LASTRESORT,:LOWSWEEP,:MEGAKICK,:MEGAPUNCH,:OUTRAGE,
			:PAYBACK,:PLAYROUGH,:PSYCHICFANGS,:REVENGE,:REVERSAL,:ROAR,
			:ROCKBLAST,:ROCKCLIMB,:ROCKPOLISH,:ROCKSLIDE,:ROCKTOMB,:SANDSTORM,
			:SCARYFACE,:SNARL,:STEALTHROCK,:STOMPINGTANTRUM,:STONEEDGE,
			:SUCKERPUNCH,:SWORDSDANCE,:TAUNT,:THROATCHOP,:THUNDERFANG,
			:THUNDERPUNCH,:UPROAR,:ZENHEADBUTT],
		:moveexceptions => [],
		:Height => 11,
	},

	"Dusk Form" => {
		:DexEntry => "Bathed in the setting sun of evening, Lycanroc has undergone a special kind of evolution. An intense fighting spirit underlies its calmness.",
		:BaseStats => [75,117,65,55,65,110],
		:Ability => [:TOUGHCLAWS,:TOUGHCLAWS,:TOUGHCLAWS],
		:Movelist => [[0,:THRASH],[1,:ACCELEROCK],[1,:COUNTER],
		[1,:TACKLE],[1,:LEER],[1,:SANDATTACK],
		[1,:BITE],[4,:SANDATTACK],[7,:BITE],[12,:HOWL],
		[15,:ROCKTHROW],[18,:ODORSLEUTH],[23,:ROCKTOMB],
		[26,:ROAR],[29,:STEALTHROCK],[34,:ROCKSLIDE],
		[37,:SCARYFACE],[40,:CRUNCH],[45,:ROCKCLIMB],
		[48,:STONEEDGE]],
		:compatiblemoves => [:BRICKBREAK,:BULKUP,:CLOSECOMBAT,:COUNTER,
			:COVET,:CRUNCH,:DRILLRUN,:EARTHPOWER,:ECHOEDVOICE,:ENDEAVOR,
			:FIREFANG,:FOCUSENERGY,:GIGAIMPACT,:HYPERVOICE,:IRONDEFENSE,
			:IRONHEAD,:IRONTAIL,:LASTRESORT,:OUTRAGE,:PLAYROUGH,
			:PSYCHICFANGS,:ROAR,:REVERSAL,:ROCKBLAST,:ROCKCLIMB,:ROCKPOLISH,
			:ROCKSLIDE,:ROCKTOMB,:SANDSTORM,:SCARYFACE,:SNARL,:STEALTHROCK,
			:STOMPINGTANTRUM,:STONEEDGE,:SUCKERPUNCH,:SWORDSDANCE,:TAILSLAP,
			:TAUNT,:THUNDERFANG,:WORKUP,:ZENHEADBUTT],
		:moveexceptions => [],
	}
},

:WISHIWASHI => {
	:FormName => {
		0 => "Solo Form",
		1 => "School Form"
	},

	"School Form" => {
		:DexEntry => "At their appearance, even Gyarados will flee. When they team up to use Water Gun, its power exceeds that of Hydro Pump.",
		:BaseStats => [45,140,130,140,135,30],
		:Height => 82,
 		:Weight => 786,
	}
},

:MINIOR => {
	:OnCreation => proc{rand(7)},
	:FormName => {
		0 => "Red Core",
		1 => "Blue Core",
		2 => "Green Core",
		3 => "Indigo Core",
		4 => "Orange Core",	
		5 => "Yellow Core",
		6 => "Violet Core",
		7 => "Meteor Form",
	},

	"Meteor Form" => {
		:BaseStats => [60,60,100,60,100,60],
		:EVs => [0,1,0,0,1,0],
 		:Weight => 400,
		:CatchRate => 30
	}
},

:NECROZMA => {
	:FormName => {
		0 => "Necrozma",
		1 => "Dusk Mane",
		2 => "Dawn Wings",
		3 => "Ultra Necrozma"
	},
	:UltraForm => 3,

	"Dusk Mane" => {
		:DexEntry => "This is its form while it is devouring the light of Solgaleo. It pounces on foes and then slashes them with the claws on its four limbs and back.",
		:BaseStats => [97,157,127,113,109,77],
		:EVs => [0,3,0,0,0,0],
		:Type2 => :STEEL,
		:Height => 38,
		:toobig => true,
		:Weight => 4600
	},

	"Dawn Wings" => {
		:DexEntry => "This is its form while it's devouring the light of Lunala. It grasps foes in its giant claws and rips them apart with brute force.",
		:BaseStats => [97,113,109,157,127,77],
		:EVs => [0,0,0,0,3,0],
		:Type2 => :GHOST,
		:Height => 42,
		:toobig => true,
		:Weight => 3500
	},

	"Ultra Necrozma" => {
		:DexEntry => "The light pouring out from all over its body affects living things and nature, impacting them in various ways.",
		:BaseStats => [97,167,97,167,97,129],
		:EVs => [0,1,0,1,1,0],
		:Type2 => :DRAGON,
		:Ability => :NEUROFORCE,
		:Height => 75,
		:toobig => true,
		:Weight => 2300
	}
},

:TOXTRICITY => {
	:FormName => {
		0 => "Amped", 
		1 => "Low Key"
	},

	"Low Key" => {
		:Ability => [:PUNKROCK,:MINUS,:TECHNICIAN],
		:Movelist => [[0,:SPARK],[1,:SPARK],[1,:EERIEIMPULSE],[1,:BELCH],[1,:TEARFULLOOK],
			[1,:NUZZLE],[1,:GROWL],[1,:FLAIL],[1,:ACID],[1,:THUNDERSHOCK],
			[1,:ACIDSPRAY],[1,:LEER],[1,:NOBLEROAR],[4,:CHARGE],
			[8,:SHOCKWAVE],[12,:SCARYFACE],[16,:TAUNT],[20,:VEMONDRENCH],
			[24,:SCREECH],[28,:SWAGGER],[32,:TOXIC],[36,:DISCHARGE],
			[40,:POISONJAB],[44,:OVERDRIVE],[48,:BOOMBURST],[52,:MAGNETICFLUX]]
	}
},

:EISCUE => {
	:FormName => {
		0 => "Ice Face",
		1 => "Noice Face"
	},
	"Noice Face" => {
		:BaseStats => [75,80,70,65,50,130]
	}
},

:INDEEDEE => {
	:FormName => {
		0 => "Male",
		1 => "Female"
	},

	"Female" => {
		:DexEntry => "These intelligent Pokémon touch horns with each other to share information between them.",
		:BaseStats => [70,55,65,95,105,85],
		:Ability => [:OWNTEMPO,:SYNCHRONIZE,:PSYCHICSURGE],
		:Movelist => [[1,:STOREDPOWER],[1,:PLAYNICE],[5,:BATONPASS],
			[10,:DISARMINGVOICE],[15,:PSYBEAM],[20,:HELPINGHAND],
			[25,:FOLLOWME],[30,:AROMATHERAPY],[35,:PSYCHIC],
			[40,:CALMMIND],[45,:GUARDSPLIT],[50,:PSYCHICTERRAIN],
			[55,:HEALINGWISH]],
		:compatiblemoves => [:ALLYSWITCH,:BATONPASS,:CALMMIND,:DAZZLINGGLEAM,
			:DRAININGKISS,:DRAINPUNCH,:ENERGYBALL,:EXPANDINGFORCE,:FUTURESIGHT,
			:GUARDSWAP,:HELPINGHAND,:HYPERVOICE,:IMPRISON,:LIGHTSCREEN,:MAGICALLEAF,
			:METRONOME,:MYSTICALFIRE,:PAYDAY,:PLAYROUGH,:PSYCHIC,:PSYCHICTERRAIN,
			:PSYSHOCK,:REFLECT,:SAFEGUARD,:SHADOWBALL,:STOREDPOWER,:SWIFT,:TERRAINPULSE,
			:TRICK,:ZENHEADBUTT],
		:moveexceptions => [],
	}
},

:MORPEKO => {
	:FormName => {
		0 => "Full Belly Mode",
		1 => "Hangry Mode"
	},

	"Hangry Mode" => {
		:DexEntry => "Intense hunger drives it to extremes of violence, and the electricity in its cheek sacs has converted into a Dark-type energy.",
	}
},

:ZACIAN => {
	:FormName => {
		0 => "Hero of Many Battles",
		1 => "Crowned Sword"
	},

	"Crowned Sword" => {
		:DexEntry => "Now armed with a weapon it used in ancient times, this Pokémon needs only a single strike to fell even Gigantamax Pokémon.",  
		:Type2 => :STEEL,
		:Weight => 3550,
		:BaseStats => [92,170,115,80,115,148]
	}
},

:ZAMAZENTA => {
	:FormName => {
		0 => "Hero of Many Battles",
		1 => "Crowned Shield"
	},

	"Crowned Shield" => {
		:DexEntry => "Its ability to deflect any attack led to it being known as the Fighting Master's Shield. It was feared and respected by all.",   
		:Type2 => :STEEL,
		:Weight => 7850,
		:BaseStats => [92,130,145,80,145,128]
	}
},

:ETERNATUS => {
	:FormName => {
		0 => "Eternatus",
		1 => "Eternamax"
	},

	"Eternamax" => {
		:DexEntry => "Infinite amounts of energy pour from this Pokémon’s enlarged core, warping the surrounding space-time.",
		:Height => 1000,
		:Weight => 9500,
		:BaseStats => [255,115,250,125,250,130]
	}
},

:URSHIFU => {
	:FormName => {
		0 => "Single Strike Style",
		1 => "Rapid Strike Style"
	},

	"Rapid Strike Style" => {
		:DexEntry => "This form of Urshifu is a strong believer in defeating foes by raining many blows down on them. Its strikes are nonstop, flowing like a river.",
		:Type2 => :WATER,
		:Movelist => [[0,:SURGINGSTRIKES],[1,:SURGINGSTRIKES],[1,:AQUAJET],
		[1,:ROCKSMASH],[1,:LEER],[1,:ENDURE],[1,:FOCUSENERGY],[12,:AERIALACE],
		[16,:SCARYFACE],[20,:HEADBUTT],[24,:BRICKBREAK],[28,:DETECT],[32,:BULKUP],
		[36,:IRONHEAD],[40,:DYNAMICPUNCH],[44,:COUNTER],[48,:CLOSECOMBAT],
		[52,:FOCUSPUNCH]],
		:compatiblemoves => [:ACROBATICS,:AURASPHERE,:BODYPRESS,:BODYSLAM,:BRICKBREAK,
			:BRINE,:BULKUP,:CLOSECOMBAT,:COACHING,:DIG,:DIVE,:DRAINPUNCH,:FALSESWIPE,
			:FIREPUNCH,:FOCUSBLAST,:FOCUSENERGY,:FOULPLAY,:GIGAIMPACT,:HELPINGHAND,
			:ICEPUNCH,:IRONDEFENSE,:IRONHEAD,:LIQUIDATION,:LOWKICK,:LOWSWEEP,:MEGAKICK,
			:MEGAPUNCH,:POISONJAB,:RAINDANCE,:RETALIATE,:REVENGE,:REVERSAL,:ROCKSLIDE,
			:ROCKTOMB,:SCALD,:SCARYFACE,:STONEEDGE,:SUPERPOWER,:SWIFT,:TAUNT,:THUNDERPUNCH,
			:UTURN,:WATERFALL,:WHIRLPOOL,:WORKUP,:ZENHEADBUTT],
		:moveexceptions => [],

	}
},

:CALYREX => {
	:FormName => {
		0 => "Calyrex",
		1 => "Ice Rider",
		2 => "Shadow Rider"
	},

	"Ice Rider" => {
		:DexEntry => "According to lore, this Pokémon showed no mercy to those who got in its way, yet it would heal its opponents’ wounds after battle.",
		:BaseStats => [100,165,150,85,130,50],
		:EVs => [0,3,0,0,0,0],
		:Type2 => :ICE,
		:Ability => [:ASONE],
		:Height => 24,
		:Weight => 8091,
		:Movelist => [[1,:GLACIALLANCE],[1,:TACKLE],[1,:TAILWHIP],
		[1,:DOUBLEKICK],[1,:AVALANCHE],[1,:STOMP],[1,:TORMENT],[1,:MIST],
		[1,:ICICLECRASH],[1,:TAKEDOWN],[1,:IRONDEFENSE],[1,:THRASH],[1,:TAUNT],
		[1,:DOUBLEEDGE],[1,:SWORDSDANCE],[1,:POUND],[1,:MEGADRAIN],[1,:CONFUSION],
		[1,:GROWTH],[8,:LIFEDEW],[16,:GIGADRAIN],[24,:PSYSHOCK],[32,:HELPINGHAND],
		[40,:AROMATHERAPY],[48,:ENERGYBALL],[56,:PSYCHIC],[64,:LEECHSEED],
		[72,:HEALPULSE],[80,:SOLARBEAM],[88,:FUTURESIGHT]],
		:compatiblemoves => [:AGILITY,:ALLYSWITCH,:ASSURANCE,:AVALANCHE,:BATONPASS,
			:BLIZZARD,:BODYPRESS,:BODYSLAM,:BULLDOZE,:BULLETSEED,:CALMMIND,:CLOSECOMBAT,
			:CRUNCH,:DRAININGKISS,:ENCORE,:ENERGYBALL,:EXPANDINGFORCE,:FUTURESIGHT,
			:GIGADRAIN,:GIGAIMPACT,:GRASSKNOT,:GRASSYTERRAIN,:GUARDSWAP,:HAIL,:HEAVYSLAM,
			:HELPINGHAND,:HIGHHORSEPOWER,:HYPERBEAM,:ICEBEAM,:ICICLESPEAR,:ICYWIND,:IMPRISON,
			:IRONDEFENSE,:LASHOUT,:LEAFSTORM,:LIGHTSCREEN,:MAGICALLEAF,:MAGICROOM,:MEGAHORN,
			:METRONOME,:MUDSHOT,:OUTRAGE,:PAYBACK,:PAYDAY,:POLLENPUFF,:POWERSWAP,:PSYCHIC,
			:PSYCHICTERRAIN,:PSYSHOCK,:REFLECT,:SAFEGUARD,:SCARYFACE,:SEEDBOMB,:SKILLSWAP,
			:SMARTSTRIKE,:SNARL,:SOLARBEAM,:SOLARBLADE,:SPEEDSWAP,:STOMPINGTANTRUM,:STOREDPOWER,
			:SUNNYDAY,:SUPERPOWER,:SWIFT,:SWORDSDANCE,:TAUNT,:THROATCHOP,:TRIATTACK,:TRICK,
			:TRICKROOM,:UPROAR,:WONDERROOM,:ZENHEADBUTT],
		:moveexceptions => [],
	},

	"Shadow Rider" => {
		:DexEntry => "Legend says that by using its power to see all events from past to future, this Pokémon saved the creatures of a forest from a meteorite strike.",
		:BaseStats => [100,85,80,165,100,150],
		:EVs => [0,0,0,3,0,0],
		:Type2 => :GHOST,
		:Ability => [:ASONE],
		:Height => 24,
		:Weight => 536,
		:Movelist => [[1,:ASTRALBARRAGE],[1,:TACKLE],[1,:TAILWHIP],
		[1,:DOUBLEKICK],[1,:HEX],[1,:STOMP],[1,:CONFUSERAY],[1,:HAZE],
		[1,:SHADOWBALL],[1,:TAKEDOWN],[1,:AGILITY],[1,:THRASH],[1,:DISABLE],
		[1,:DOUBLEEDGE],[1,:NASTYPLOT],[1,:POUND],[1,:MEGADRAIN],[1,:CONFUSION],
		[1,:GROWTH],[8,:LIFEDEW],[16,:GIGADRAIN],[24,:PSYSHOCK],[32,:HELPINGHAND],
		[40,:AROMATHERAPY],[48,:ENERGYBALL],[56,:PSYCHIC],[64,:LEECHSEED],
		[72,:HEALPULSE],[80,:SOLARBEAM],[88,:FUTURESIGHT]],
		:compatiblemoves => [:AGILITY,:ALLYSWITCH,:ASSURANCE,:BATONPASS,:BODYSLAM,
			:BULLDOZE,:BULLETSEED,:CALMMIND,:CRUNCH,:DARKPULSE,:DRAININGKISS,:ENCORE,
			:ENERGYBALL,:EXPANDINGFORCE,:FOULPLAY,:FUTURESIGHT,:GIGADRAIN,:GIGAIMPACT,
			:GRASSKNOT,:GRASSYTERRAIN,:GUARDSWAP,:HELPINGHAND,:HEX,:HYPERBEAM,:IMPRISON,
			:LASHOUT,:LEAFSTORM,:LIGHTSCREEN,:MAGICALLEAF,:MAGICROOM,:METRONOME,:MUDSHOT,
			:NASTYPLOT,:PAYBACK,:PAYDAY,:PHANTOMFORCE,:POLLENPUFF,:POWERSWAP,:PSYCHIC,
			:PSYCHICTERRAIN,:PSYCHOCUT,:PSYSHOCK,:REFLECT,:SAFEGUARD,:SCARYFACE,:SEEDBOMB,
			:SHADOWBALL,:SKILLSWAP,:SNARL,:SOLARBEAM,:SOLARBLADE,:SPEEDSWAP,:STOMPINGTANTRUM,
			:STOREDPOWER,:SUNNYDAY,:SWIFT,:TAUNT,:TRIATTACK,:TRICK,:TRICKROOM,:UPROAR,:WILLOWISP,
			:WONDERROOM,:ZENHEADBUTT],
		:moveexceptions => [],
	}
},


###################### Regional Variants ######################

:RATTATA => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		next $game_map && Rattata.include?($game_map.map_id) ? 1 : 0
 	},

	"Alolan" => {
		:DexEntry => "With its incisors, it gnaws through doors and infiltrates people's homes. Then, with a twitch of its whiskers, it steals whatever food it finds.",
		:Type1 => :DARK,
		:Type2 => :NORMAL,
		:Weight => 38,
		:Ability => [:GLUTTONY,:HUSTLE,:THICKFAT],
		:Movelist => [[1,:TACKLE],[1,:TAILWHIP],[4,:QUICKATTACK],
			[7,:FOCUSENERGY],[10,:BITE],[13,:PURSUIT],
			[16,:HYPERFANG],[19,:ASSURANCE],[22,:CRUNCH],
			[25,:SUCKERPUNCH],[29,:SUPERFANG],[31,:DOUBLEEDGE],
			[34,:ENDEAVOR]] ,
		:EggMoves => [:COUNTER,:FINALGAMBIT,:FURYSWIPES,:MEFIRST,
				:REVENGE,:REVERSAL,:SNATCH,:STOCKPILE,
				:SWALLOW,:SWITCHEROO,:UPROAR],
		:compatiblemoves => [:ASSURANCE,:BLIZZARD,:COUNTER,:COVET,:CRUNCH,
			:DARKPULSE,:EMBARGO,:ENDEAVOR,:FOCUSENERGY,:GRASSKNOT,:HEADBUTT,
			:ICEBEAM,:ICYWIND,:IRONTAIL,:LASTRESORT,:QUASH,:RAINDANCE,:REVENGE,:REVERSAL,
			:SHADOWBALL,:SHADOWCLAW,:SHOCKWAVE,:SLUDGEBOMB,:SNARL,:SNATCH,:SUCKERPUNCH,
			:SUNNYDAY,:SUPERFANG,:TAUNT,:THIEF,:TORMENT,:UPROAR,:UTURN,:ZENHEADBUTT],
		:moveexceptions => [],
		:WildHoldItems => [nil,:PECHABERRY,nil],
		:GetEvo => [[:RATICATE,:LevelNight,20]]		# [A-Raticate, LevelNight, 20]
	}
},

:RATICATE => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		next $game_map && Rattata.include?($game_map.map_id) ? 1 : 0
 	},

	"Alolan" => {
		:DexEntry => "It forms a group of Rattata, which it assumes command of. Each group has its own territory, and disputes over food happen often.",
		:Type1 => :DARK,
		:Type2 => :NORMAL,
		:BaseStats => [75,71,70,40,80,77],
		:Weight => 255,
		:Ability => [:GLUTTONY,:HUSTLE,:THICKFAT],
		:Movelist => [[0,:SCARYFACE],[1,:SWORDSDANCE],[1,:TACKLE],
			[1,:TAILWHIP],[1,:QUICKATTACK],[1,:FOCUSENERGY],
			[4,:QUICKATTACK],[7,:FOCUSENERGY],[10,:BITE],[13,:PURSUIT],
			[16,:HYPERFANG],[19,:ASSURANCE],[24,:CRUNCH],
			[29,:SUCKERPUNCH],[34,:SUPERFANG],[39,:DOUBLEEDGE],
			[44,:ENDEAVOR]],
		:compatiblemoves => [:AGILITY,:ASSURANCE,:BEATUP,:BLIZZARD,:BULKUP,:COUNTER,:COVET,
			:CRUNCH,:DARKPULSE,:EMBARGO,:ENDEAVOR,:FIREFANG,:FOCUSENERGY,:GIGAIMPACT,
			:GRASSKNOT,:HEADBUTT,:HYPERBEAM,:ICEBEAM,:ICYWIND,:IRONTAIL,:KNOCKOFF,:LASTRESORT,
			:PLAYROUGH,:QUASH,:RAINDANCE,:REVENGE,:REVERSAL,:ROAR,:SCARYFACE,:SHADOWBALL,:SHADOWCLAW,
			:SHOCKWAVE,:SLUDGEBOMB,:SLUDGEWAVE,:SNARL,:SNATCH,:STOMPINGTANTRUM,:SUCKERPUNCH,:SUNNYDAY,
			:SUPERFANG,:SWORDSDANCE,:TAUNT,:THIEF,:THROATCHOP,:TORMENT,:UPROAR,:UTURN,:VENOSHOCK,
			:ZENHEADBUTT],
		:moveexceptions => [],
		:WildHoldItems => [nil,:PECHABERRY,nil],
		:preevo => {
			:species => :RATTATA,
			:form => 1, 
		  },
	}
},

:RAICHU => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	"Alolan" => {
		:DexEntry => "It uses psychokinesis to control electricity. It hops aboard its own tail, using psychic power to lift the tail and move about while riding it.",
		:Type2 => :PSYCHIC,
		:BaseStats => [60,85,50,95,85,110],
		:Height => 7,
		:Weight => 210,
		:Ability => [:SURGESURFER],
		:Movelist => [[0,:PSYCHIC],[1,:SPEEDSWAP],[1,:THUNDERSHOCK],
			[1,:TAILWHIP],[1,:QUICKATTACK],[1,:THUNDERBOLT]],
		:compatiblemoves => [:AGILITY,:ALLYSWITCH,:BABYDOLLEYES,:BIDE,:BODYSLAM,
			:BRICKBREAK,:CALMMIND,:CHARGEBEAM,:CHARM,:COUNTER,:COVET,:CURSE,
			:DEFENSECURL,:DETECT,:DIG,:DOUBLEEDGE,:DRAININGKISS,:DYNAMICPUNCH,
			:ECHOEDVOICE,:ELECTRICTERRAIN,:ELECTROBALL,:ELECTROWEB,:ENCORE,:ENDEAVOR,
			:EXPANDINGFORCE,:EXTREMESPEED,:FAKEOUT,:FLASH,:FLING,:FOCUSBLAST,
			:FOCUSPUNCH,:FUTURESIGHT,:GIGAIMPACT,:GRASSKNOT,:HAPPYHOUR,:HEADBUTT,
			:HELPINGHAND,:HOLDHANDS,:HYPERBEAM,:IRONTAIL,:KNOCKOFF,:LASERFOCUS,
			:LIGHTSCREEN,:MAGICCOAT,:MAGICROOM,:MAGNETRISE,:MEGAKICK,:MEGAPUNCH,:MIMIC,
			:MUDSLAP,:NASTYPLOT,:PAYDAY,:PLAYROUGH,:PSYCHIC,:PSYSHOCK,:RAGE,:RAINDANCE,
			:RECYCLE,:REFLECT,:REVERSAL,:RISINGVOLTAGE,:ROCKSMASH,:ROLLOUT,:SAFEGUARD,
			:SEISMICTOSS,:SHOCKWAVE,:SIGNALBEAM,:SKULLBASH,:SPEEDSWAP,:STOREDPOWER,
			:STRENGTH,:SUBMISSION,:SURF,:SWEETSCENT,:SWIFT,:TAKEDOWN,:TELEKINESIS,
			:TELEPORT,:THIEF,:THUNDER,:THUNDERBOLT,:THUNDERPUNCH,:THUNDERWAVE,:UPROAR,
			:VOLTSWITCH,:VOLTTACKLE,:WILDCHARGE,:ZAPCANNON],
		:moveexceptions => [],
	}
},

:SANDSHREW => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		next $game_map && Sandshrew.include?($game_map.map_id) ? 1 : 0
	},

	"Alolan" => {
		:DexEntry => "It lives on snowy mountains. Its steel shell is very hard—so much so, it can't roll its body up into a ball.",
		:Type1 => :ICE,
		:Type2 => :STEEL,
		:BaseStats => [50,75,90,10,35,40],
		:Height => 6,
		:Weight => 400,
		:Ability => [:SNOWCLOAK,:SLUSHRUSH],
		:Movelist => [[1,:SCRATCH],[1,:DEFENSECURL],[3,:BIDE],
			[5,:POWDERSNOW],[7,:ICEBALL],[9,:RAPIDSPIN],
			[11,:FURYCUTTER],[14,:METALCLAW],[17,:SWIFT],
			[20,:FURYSWIPES],[23,:IRONDEFENSE],[26,:SLASH],
			[30,:IRONHEAD],[34,:GYROBALL],[38,:SWORDSDANCE],
			[42,:HAIL],[46,:BLIZZARD]],
		:EggMoves => [:AMNESIA,:CHIPAWAY,:COUNTER,:CRUSHCLAW,:CURSE,
				:ENDURE,:FLAIL,:HONECLAWS,:ICICLECRASH,:ICICLESPEAR,
				:METALCLAW,:NIGHTSLASH],
		:compatiblemoves => [:AERIALACE,:AMNESIA,:AQUATAIL,:AURORAVEIL,:AVALANCHE,
			:BLIZZARD,:BODYSLAM,:BRICKBREAK,:BULLDOZE,:COUNTER,:COVET,:DEFENSECURL,
			:DIG,:EARTHQUAKE,:FLING,:FOCUSPUNCH,:FROSTBREATH,:FURYCUTTER,:GYROBALL,
			:HAIL,:HEADBUTT,:HONECLAWS,:ICEBALL,:ICEBEAM,:ICEPUNCH,:ICICLESPEAR,
			:ICYWIND,:IRONDEFENSE,:IRONHEAD,:IRONTAIL,:KNOCKOFF,:LEECHLIFE,:POISONJAB,
			:ROCKSLIDE,:ROCKTOMB,:ROLLOUT,:SAFEGUARD,:SEISMICTOSS,:SHADOWCLAW,
			:STEALTHROCK,:STEELBEAM,:STEELROLLER,:SUNNYDAY,:SUPERFANG,:SWIFT,
			:SWORDSDANCE,:THIEF,:THROATCHOP,:TRIPLEAXEL,:WORKUP,:XSCISSOR],
		:moveexceptions => [],
		:WildHoldItems => [nil,:PECHABERRY,nil],
		:GetEvo => [[:SANDSLASH,:Item,:ICESTONE]]		# [A-Sandslash, Item, Ice Stone]
	}
},

:SANDSLASH => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		next $game_map && Sandshrew.include?($game_map.map_id) ? 1 : 0
	},

	"Alolan" => {
		:DexEntry => "This Pokémon's steel spikes are sheathed in ice. Stabs from these spikes cause deep wounds and severe frostbite as well.",
		:Type1 => :ICE,
		:Type2 => :STEEL,
		:BaseStats => [75,100,120,25,65,65],
		:Height => 12,
		:Weight => 550,
		:Ability => [:SNOWCLOAK,:SLUSHRUSH],
		:Movelist => [[0,:ICICLESPEAR],[1,:METALBURST],[1,:ICICLECRASH],
			[1,:SLASH],[1,:DEFENSECURL],[1,:ICEBALL],
			[1,:METALCLAW]],
		:compatiblemoves => [:AERIALACE,:AGILITY,:AMNESIA,:AQUATAIL,:AURORAVEIL,
			:AVALANCHE,:BLIZZARD,:BODYSLAM,:BRICKBREAK,:BULLDOZE,:COUNTER,
			:COVET,:DEFENSECURL,:DIG,:DRILLRUN,:EARTHQUAKE,:FLING,:FOCUSBLAST,
			:FOCUSPUNCH,:FROSTBREATH,:FURYCUTTER,:GIGAIMPACT,:GYROBALL,:HAIL,
			:HEADBUTT,:HONECLAWS,:HYPERBEAM,:ICEBALL,:ICEBEAM,:ICEPUNCH,:ICICLESPEAR,
			:ICYWIND,:IRONDEFENSE,:IRONHEAD,:IRONTAIL,:KNOCKOFF,:LEECHLIFE,
			:PINMISSILE,:POISONJAB,:ROCKSLIDE,:ROCKTOMB,:ROLLOUT,:SAFEGUARD,
			:SEISMICTOSS,:SHADOWCLAW,:SPIKES,:STEALTHROCK,:STEELBEAM,:STEELROLLER,
			:SUNNYDAY,:SUPERFANG,:SWIFT,:SWORDSDANCE,:THIEF,:THROATCHOP,:TRIPLEAXEL,
			:WORKUP,:XSCISSOR],
		:moveexceptions => [],
		:WildHoldItems => [nil,:PECHABERRY,nil],
		:preevo => {
			:species => :SANDSHREW,
			:form => 1, 
		  },
	}
},

:VULPIX => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		next $game_map && Vulpix.include?($game_map.map_id) ? 1 : 0
 	},

	"Alolan" => {
		:DexEntry => "In hot weather, this Pokémon makes ice shards with its six tails and sprays them around to cool itself off.",
		:Type1 => :ICE,
		:Ability => [:SNOWCLOAK,:SNOWWARNING],
		:Movelist => [[1,:POWDERSNOW],[4,:TAILWHIP],[7,:ROAR],
			[9,:BABYDOLLEYES],[10,:ICESHARD],[12,:CONFUSERAY],
			[15,:ICYWIND],[18,:PAYBACK],[20,:MIST],
			[23,:FEINTATTACK],[26,:HEX],[28,:AURORABEAM],
			[31,:EXTRASENSORY],[34,:SAFEGUARD],[36,:ICEBEAM],
			[39,:IMPRISON],[42,:BLIZZARD],[44,:GRUDGE],
			[47,:CAPTIVATE],[50,:SHEERCOLD]],
		:EggMoves => [:AGILITY,:CHARM,:DISABLE,:ENCORE,
				:EXTRASENSORY,:FLAIL,:FREEZEDRY,:HOWL,
				:HYPNOSIS,:MOONBLAST,:POWERSWAP,:SPITE,
				:SECRETPOWER,:TAILSLAP],
		:compatiblemoves => [:AGILITY,:AQUATAIL,:AURORAVEIL,:BABYDOLLEYES,
			:BLIZZARD,:BODYSLAM,:CHARM,:COVET,:DARKPULSE,:DAZZLINGGLEAM,
			:DIG,:DRAININGKISS,:ENCORE,:ENERGYBALL,:FEINTATTACK,:FOULPLAY,
			:FROSTBREATH,:HAIL,:HEADBUTT,:HEALBELL,:HEX,:HYPNOSIS,:ICEBEAM,
			:ICEFANG,:ICYWIND,:IMPRISON,:IRONTAIL,:NASTYPLOT,:PAINSPLIT,
			:PAYBACK,:POWERSWAP,:PSYCHUP,:RAINDANCE,:REFLECT,:ROAR,
			:ROLEPLAY,:SAFEGUARD,:SPITE,:SWIFT,:TAILSLAP,:WEATHERBALL,:ZENHEADBUTT],
		:moveexceptions => [],
		:WildHoldItems => [nil,:SNOWBALL,nil],
		:GetEvo => [[:NINETALES,:Item,:ICESTONE]]		# [A-Ninetales, Item, Ice Stone]
	}
},

:NINETALES => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		next $game_map && Vulpix.include?($game_map.map_id) ? 1 : 0
 	},

	"Alolan" => {
		:DexEntry => "Possessing a calm demeanor, this Pokémon was revered as a deity incarnate before it was identified as a regional variant of Ninetales.",
		:Type1 => :ICE,
		:Type2 => :FAIRY,
		:BaseStats => [73,67,75,81,100,109],
		:EVs => [0,0,0,2,0,0],
		:Ability => [:SNOWCLOAK,:SNOWWARNING],
		:Movelist => [[0,:DAZZLINGGLEAM],[1,:IMPRISON],[1,:NASTYPLOT],
			[1,:ICEBEAM],[1,:ICESHARD],[1,:CONFUSERAY],
			[1,:SAFEGUARD]],
		:compatiblemoves => [:AGILITY,:AQUATAIL,:AURORAVEIL,:AVALANCHE,:BABYDOLLEYES,
			:BLIZZARD,:BODYSLAM,:CALMMIND,:CHARM,:COVET,:DARKPULSE,:DAZZLINGGLEAM,
			:DIG,:DRAININGKISS,:DREAMEATER,:ENCORE,:ENERGYBALL,:FAKETEARS,
			:FEINTATTACK,:FOULPLAY,:FROSTBREATH,:GIGAIMPACT,:HAIL,:HEADBUTT,
			:HEALBELL,:HEX,:HYPERBEAM,:HYPNOSIS,:ICEBEAM,:ICEFANG,:ICYWIND,
			:IMPRISON,:IRONTAIL,:LASERFOCUS,:MISTYTERRAIN,:NASTYPLOT,:PAINSPLIT,
			:PAYBACK,:POWERSWAP,:PSYCHUP,:PSYSHOCK,:RAINDANCE,:REFLECT,:ROAR,
			:ROLEPLAY,:SAFEGUARD,:SOLARBEAM,:SPITE,:STOREDPOWER,:SWIFT,:TAILSLAP,
			:TRIPLEAXEL,:WEATHERBALL,:WONDERROOM,:ZENHEADBUTT],
		:moveexceptions => [],
		:WildHoldItems => [nil,:SNOWBALL,nil],
		:preevo => {
			:species => :VULPIX,
			:form => 1, 
		  },
	}
},

:DIGLETT => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		next $game_map && Diglett.include?($game_map.map_id) ? 1 : 0
 	},

	"Alolan" => {
		:DexEntry => "Its head sports an altered form of whiskers made of metal. When in communication with its comrades, its whiskers wobble to and fro.",
		:Type2 => :STEEL,
		:BaseStats => [10,55,30,35,40,90],
		:Ability => [:SANDVEIL,:TANGLINGHAIR,:SANDFORCE],
		:Movelist => [[1,:SANDATTACK],[1,:METALCLAW],[4,:GROWL],
			[7,:ASTONISH],[10,:MUDSLAP],[14,:MAGNITUDE],
			[18,:BULLDOZE],[22,:SUCKERPUNCH],[25,:MUDBOMB],
			[28,:EARTHPOWER],[31,:DIG],[35,:IRONHEAD],
			[39,:EARTHQUAKE],[43,:FISSURE]],
		:EggMoves => [:ANCIENTPOWER,:BEATUP,:ENDURE,:FEINTATTACK,
				:FINALGAMBIT,:HEADBUTT,:MEMENTO,:METALSOUND,
				:PURSUIT,:REVERSAL,:FLASH],
		:compatiblemoves => [:AERIALACE,:AGILITY,:ALLYSWITCH,:ANCIENTPOWER,:ASSURANCE,
			:BEATUP,:BODYSLAM,:BULLDOZE,:DIG,:EARTHPOWER,:EARTHQUAKE,
			:ECHOEDVOICE,:FEINTATTACK,:FISSURE,:FLASHCANNON,:HEADBUTT,
			:HONECLAWS,:IRONDEFENSE,:IRONHEAD,:MUDSLAP,:REVERSAL,:ROCKSLIDE,
			:ROCKTOMB,:SANDSTORM,:SCORCHINGSANDS,:SCREECH,:SHADOWCLAW,
			:SLUDGEBOMB,:STEALTHROCK,:STEELBEAM,:STOMPINGTANTRUM,:SUCKERPUNCH,
			:SUNNYDAY,:THIEF,:UPROAR,:WORKUP],
		:moveexceptions => [],
		:Weight => 10
	}
},

:DUGTRIO => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		next $game_map && Diglett.include?($game_map.map_id) ? 1 : 0
 	},

	"Alolan" => {
		:DexEntry => "Its shining gold hair provides it with protection. It's reputed that keeping any of its fallen hairs will bring bad luck.",
		:Type2 => :STEEL,
		:BaseStats => [35,100,60,50,70,110],
		:EVs => [0,2,0,0,0,0],
		:Ability => [:SANDVEIL,:TANGLINGHAIR,:SANDFORCE],
		:Movelist => [[0,:SANDTOMB],[1,:ROTOTILLER],[1,:NIGHTSLASH],
			[1,:TRIATTACK],[1,:SANDATTACK],[1,:METALCLAW],[1,:GROWL],
			[4,:GROWL],[7,:ASTONISH],[10,:MUDSLAP],[14,:MAGNITUDE],
			[18,:BULLDOZE],[22,:SUCKERPUNCH],[25,:MUDBOMB],
			[30,:EARTHPOWER],[35,:DIG],[41,:IRONHEAD],
			[47,:EARTHQUAKE],[53,:FISSURE]],
		:compatiblemoves => [:AERIALACE,:AGILITY,:ALLYSWITCH,:ANCIENTPOWER,:ASSURANCE,
			:BEATUP,:BODYSLAM,:BULLDOZE,:DIG,:EARTHPOWER,:EARTHQUAKE,
			:ECHOEDVOICE,:FEINTATTACK,:FISSURE,:FLASHCANNON,:GIGAIMPACT,
			:HEADBUTT,:HIGHHORSEPOWER,:HONECLAWS,:HYPERBEAM,:IRONDEFENSE,
			:IRONHEAD,:MUDSLAP,:REVERSAL,:ROCKSLIDE,:ROCKTOMB,:SANDSTORM,
			:SANDTOMB,:SCORCHINGSANDS,:SCREECH,:SHADOWCLAW,:SLUDGEBOMB,
			:SLUDGEWAVE,:STEALTHROCK,:STEELBEAM,:STOMPINGTANTRUM,:STONEEDGE,
			:SUCKERPUNCH,:SUNNYDAY,:THIEF,:TRIATTACK,:UPROAR,:WORKUP],
		:moveexceptions => [],
		:Weight => 666,
		:preevo => {
			:species => :DIGLETT,
			:form => 1, 
		  },
	}
},

:MEOWTH => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan",
		2 => "Galarian"
	},

	:OnCreation => proc{
		# Map IDs for alolan and galarian forms respectively
		if $game_map && Rattata.include?($game_map.map_id) #rattata includes meowth
			next 1
		elsif $game_map && Meowth.include?($game_map.map_id)
			next 2
		else
			next 0
		end
	},

	"Alolan" => {
		:DexEntry => "When its delicate pride is wounded, or when the gold coin on its forehead is dirtied, it flies into a hysterical rage.",
		:Type1 => :DARK,
		:BaseStats => [40,35,35,50,40,90],
		:EVs => [0,2,0,0,0,0],
		:Ability => [:PICKUP,:TECHNICIAN,:RATTLED],
		:Movelist => [[1,:SCRATCH],[1,:GROWL],[6,:BITE],
			[9,:FAKEOUT],[14,:FURYSWIPES],[17,:SCREECH],
			[22,:FEINTATTACK],[25,:TAUNT],[30,:PAYDAY],
			[33,:SLASH],[38,:NASTYPLOT],[41,:ASSURANCE],
			[46,:CAPTIVATE],[49,:NIGHTSLASH],[50,:FEINT],
			[55,:DARKPULSE]],
		:EggMoves => [:AMNESIA,:ASSIST,:CHARM,:COVET,:FLAIL,:FLATTER,
			:FOULPLAY,:HYPNOSIS,:PARTINGSHOT,:PUNISHMENT,
			:SNATCH,:SPITE],
		:compatiblemoves => [:AERIALACE,:AMNESIA,:ASSURANCE,:BODYSLAM,:CHARM,:COVET,
			:DARKPULSE,:DIG,:DREAMEATER,:ECHOEDVOICE,:EMBARGO,:FAKEOUT,
			:FEINTATTACK,:FOULPLAY,:GUNKSHOT,:HEADBUTT,:HYPERVOICE,:HYPNOSIS,
			:ICYWIND,:IRONTAIL,:KNOCKOFF,:LASHOUT,:LASTRESORT,:NASTYPLOT,
			:PAYBACK,:PAYDAY,:PLAYROUGH,:PSYCHUP,:QUASH,:RAINDANCE,:RETALIATE,
			:SCREECH,:SEEDBOMB,:SHADOWBALL,:SHADOWCLAW,:SHOCKWAVE,:SNATCH,:SPITE,
			:SUNNYDAY,:SWIFT,:TAUNT,:THIEF,:THROATCHOP,:THUNDER,:THUNDERBOLT,
			:TORMENT,:UPROAR,:UTURN,:WATERPULSE,:WORKUP],
		:moveexceptions => [],
		:GetEvo => [[:PERSIAN,:Happiness,0]]		# [A-Meowth, Happiness, 0]
	},

	"Galarian" => {
		:DexEntry => "These daring Pokémon have coins on their foreheads. Darker coins are harder, and harder coins garner more respect among Meowth.",
		:Type1 => :STEEL,
		:BaseStats => [50,65,55,40,40,40],
		:EVs => [0,2,0,0,0,0],
		:Ability => [:PICKUP,:TOUGHCLAWS,:UNNERVE],
		:Movelist => [[1,:FAKEOUT],[1,:GROWL],[4,:HONECLAWS],[8,:SCRATCH],
		[12,:PAYDAY],[16,:METALCLAW],[20,:TAUNT],[24,:SWAGGER],
		[29,:FURYSWIPES],[32,:SCREECH],[36,:SLASH],[40,:METALSOUND],
		[44,:THRASH]],
		:EggMoves => [:COVET,:FLAIL,:SPITE,:DOUBLEEDGE,:CURSE,:NIGHTSLASH],
		:compatiblemoves => [:AMNESIA,:ASSURANCE,:BODYSLAM,:COVET,:CRUNCH,:DARKPULSE,
			:DIG,:FAKEOUT,:FOULPLAY,:GUNKSHOT,:GYROBALL,:HONECLAWS,:HYPERVOICE,
			:IRONDEFENSE,:IRONHEAD,:IRONTAIL,:LASHOUT,:NASTYPLOT,:PAYBACK,
			:PAYDAY,:PLAYROUGH,:RAINDANCE,:RETALIATE,:SCREECH,:SEEDBOMB,
			:SHADOWBALL,:SHADOWCLAW,:SPITE,:STEELBEAM,:SUNNYDAY,:SWORDSDANCE,
			:TAUNT,:THIEF,:THROATCHOP,:THUNDER,:THUNDERBOLT,:UPROAR,:UTURN,:WORKUP],
		:moveexceptions => [],
		:GetEvo => [[:PERRSERKER,:Level,28]]		# [G-Meowth, Level, 28]
	}
},

:PERSIAN => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		if $game_map && Rattata.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Alolan" => {
		:DexEntry => "It looks down on everyone other than itself. Its preferred tactics are sucker punches and blindside attacks.",
		:Type1 => :DARK,
		:BaseStats => [65,60,60,75,65,115],
		:EVs => [0,2,0,0,0,0],
		:Ability => [:FURCOAT,:TECHNICIAN,:RATTLED],
		:Movelist => [[0,:SWIFT],[1,:QUASH],[1,:PLAYROUGH],[1,:SWITCHEROO],
			[1,:SCRATCH],[1,:GROWL],[1,:BITE],[1,:FAKEOUT],[6,:BITE],
			[9,:FAKEOUT],[14,:FURYSWIPES],[17,:SCREECH],
			[22,:FEINTATTACK],[25,:TAUNT],[32,:POWERGEM],
			[37,:SLASH],[44,:NASTYPLOT],[49,:ASSURANCE],
			[56,:CAPTIVATE],[61,:NIGHTSLASH],[65,:FEINT],
			[69,:DARKPULSE]],
		:compatiblemoves => [:AERIALACE,:AMNESIA,:ASSURANCE,:BEATUP,:BODYSLAM,
			:BURNINGJEALOUSY,:CHARM,:COVET,:DARKPULSE,:DIG,:DREAMEATER,
			:ECHOEDVOICE,:EMBARGO,:FAKEOUT,:FAKETEARS,:FEINTATTACK,
			:FOULPLAY,:GIGAIMPACT,:GUNKSHOT,:HEADBUTT,:HYPERBEAM,:HYPERVOICE,
			:HYPNOSIS,:ICYWIND,:IRONTAIL,:KNOCKOFF,:LASHOUT,:LASTRESORT,
			:NASTYPLOT,:PAYBACK,:PAYDAY,:PLAYROUGH,:POWERGEM,:PSYCHUP,
			:QUASH,:RAINDANCE,:RETALIATE,:ROAR,:SCREECH,:SEEDBOMB,
			:SHADOWBALL,:SHADOWCLAW,:SHOCKWAVE,:SKITTERSMACK,:SNARL,
			:SNATCH,:SPITE,:SUNNYDAY,:SWIFT,:TAUNT,:THIEF,:THROATCHOP,
			:THUNDER,:THUNDERBOLT,:TORMENT,:UPROAR,:UTURN,:WATERPULSE,:WORKUP],
		:moveexceptions => [],
		:Height => 11,
		:Weight => 330,
		:preevo => {
			:species => :MEOWTH,
			:form => 1, 
		  },
	}
},

:GEODUDE => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		maps=[]
		# Map IDs for alolan form
		if $game_map && Geodude.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Alolan" => {
		:DexEntry => "If you accidentally step on a Geodude sleeping on the ground, you'll hear a crunching sound and feel a shock ripple through your entire body.",
		:Type2 => :ELECTRIC,
		:Ability => [:MAGNETPULL,:STURDY,:GALVANIZE],
		:Movelist => [[1,:TACKLE],[1,:DEFENSECURL],[4,:CHARGE],
			[6,:ROCKPOLISH],[10,:ROLLOUT],[12,:SPARK],
			[16,:ROCKTHROW],[18,:SMACKDOWN],[22,:THUNDERPUNCH],
			[24,:SELFDESTRUCT],[28,:STEALTHROCK],[30,:ROCKBLAST],
			[34,:DISCHARGE],[36,:EXPLOSION],[40,:DOUBLEEDGE],
			[42,:STONEEDGE]],
		:EggMoves => [:AUTOTOMIZE,:BLOCK,:COUNTER,:CURSE,:ENDURE,:FLAIL, :MAGNETRISE,:ROCKCLIMB,:SCREECH,:WIDEGUARD],
		:compatiblemoves => [:BLOCK,:BRICKBREAK,:BRUTALSWING,:BULLDOZE,:CHARGEBEAM,:COUNTER,
			:DEFENSECURL,:DIG,:EARTHPOWER,:EARTHQUAKE,:ELECTROWEB,:EXPLOSION,:FIREBLAST,
			:FIREPUNCH,:FLAMETHROWER,:FLING,:FOCUSPUNCH,:GYROBALL,:HEADBUTT,:IRONDEFENSE,
			:MAGNETRISE,:NATUREPOWER,:ROCKBLAST,:ROCKCLIMB,:ROCKPOLISH,:ROCKSLIDE,:ROCKTOMB,
			:ROLLOUT,:SANDSTORM,:SCREECH,:SEISMICTOSS,:SELFDESTRUCT,:SMACKDOWN,:STEALTHROCK,
			:STONEEDGE,:SUNNYDAY,:SUPERPOWER,:THUNDER,:THUNDERBOLT,:THUNDERPUNCH,:VOLTSWITCH],
		:moveexceptions => [],
		:Weight => 203,
		:WildHoldItems => [nil,:CELLBATTERY,nil]
	}
},

:GRAVELER => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		if $game_map && Geodude.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Alolan" => {
		:DexEntry => "They eat rocks and often get into a scrap over them. The shock of Graveler smashing together causes a flash of light and a booming noise.",
		:Type2 => :ELECTRIC,
		:Ability => [:MAGNETPULL,:STURDY,:GALVANIZE],
		:Movelist => [[1,:TACKLE],[1,:DEFENSECURL],[4,:CHARGE],[1,:ROCKPOLISH],
			[1,:CHARGE],[6,:ROCKPOLISH],[10,:ROLLOUT],[12,:SPARK],
			[16,:ROCKTHROW],[18,:SMACKDOWN],[22,:THUNDERPUNCH],
			[24,:SELFDESTRUCT],[30,:STEALTHROCK],[34,:ROCKBLAST],
			[40,:DISCHARGE],[44,:EXPLOSION],[50,:DOUBLEEDGE],
			[54,:STONEEDGE]],
		:compatiblemoves => [:BLOCK,:BRICKBREAK,:BRUTALSWING,:BULLDOZE,:CHARGEBEAM,:COUNTER,
			:DEFENSECURL,:DIG,:EARTHPOWER,:EARTHQUAKE,:ELECTROWEB,:EXPLOSION,:FIREBLAST,
			:FIREPUNCH,:FLAMETHROWER,:FLING,:FOCUSPUNCH,:GYROBALL,:HEADBUTT,:IRONDEFENSE,
			:MAGNETRISE,:NATUREPOWER,:ROCKBLAST,:ROCKCLIMB,:ROCKPOLISH,:ROCKSLIDE,:ROCKTOMB,
			:ROLLOUT,:SANDSTORM,:SCREECH,:SEISMICTOSS,:SELFDESTRUCT,:SMACKDOWN,:STEALTHROCK,
			:STONEEDGE,:SUNNYDAY,:SUPERPOWER,:THUNDER,:THUNDERBOLT,:THUNDERPUNCH,:THUNDERWAVE,
			:VOLTSWITCH],
		:moveexceptions => [],
		:Weight => 1100,
		:WildHoldItems => [nil,:CELLBATTERY,nil],
		:preevo => {
			:species => :GEODUDE,
			:form => 1, 
		  },
	}
},

:GOLEM => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		if $game_map && Geodude.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Alolan" => {
		:DexEntry => "Because it can't fire boulders at a rapid pace, it's been known to seize nearby Geodude and fire them from its back.",
		:Type2 => :ELECTRIC,
		:Ability => [:MAGNETPULL,:STURDY,:GALVANIZE],
		:Movelist => [[1,:TACKLE],[1,:DEFENSECURL],[4,:CHARGE],[1,:ROCKPOLISH],
			[1,:CHARGE],[6,:ROCKPOLISH],[10,:ROLLOUT],[12,:SPARK],
			[16,:ROCKTHROW],[18,:SMACKDOWN],[22,:THUNDERPUNCH],
			[24,:SELFDESTRUCT],[30,:STEALTHROCK],[34,:ROCKBLAST],
			[40,:DISCHARGE],[44,:EXPLOSION],[50,:DOUBLEEDGE],
			[54,:STONEEDGE]],
		:compatiblemoves => [:ALLYSWITCH,:BLOCK,:BODYPRESS,:BRICKBREAK,:BRUTALSWING,:BULLDOZE,
			:CHARGEBEAM,:COUNTER,:DEFENSECURL,:DIG,:EARTHPOWER,:EARTHQUAKE,:ECHOEDVOICE,
			:ELECTROWEB,:EXPLOSION,:FIREBLAST,:FIREPUNCH,:FLAMETHROWER,:FLING,:FOCUSBLAST,
			:FOCUSPUNCH,:GIGAIMPACT,:GYROBALL,:HEADBUTT,:HEAVYSLAM,:HYPERBEAM,:IRONDEFENSE,
			:IRONHEAD,:MAGNETRISE,:MEGAPUNCH,:METEORBEAM,:NATUREPOWER,:POWERGEM,:ROAR,
			:ROCKBLAST,:ROCKCLIMB,:ROCKPOLISH,:ROCKSLIDE,:ROCKTOMB,:ROLLOUT,:SANDSTORM,
			:SCREECH,:SEISMICTOSS,:SELFDESTRUCT,:SHOCKWAVE,:SMACKDOWN,:STEALTHROCK,:STONEEDGE,
			:SUNNYDAY,:SUPERPOWER,:THUNDER,:THUNDERBOLT,:THUNDERPUNCH,:THUNDERWAVE,:VOLTSWITCH,
			:WILDCHARGE],
		:moveexceptions => [],
		:Height => 17,
		:Weight => 3160,
		:WildHoldItems => [nil,:CELLBATTERY,nil],
		:preevo => {
			:species => :GRAVELER,
			:form => 1, 
		  },
	}
},

:PONYTA => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	},

	:OnCreation => proc {
		# Map IDs for alt form
		if $game_map && Ponyta.include?($game_map.map_id) 
		  next 1
		else
		  next 0
		end
	},

	"Galarian" => {
		:DexEntry => "This Pokémon will look into your eyes and read the contents of your heart. If it finds evil there, it promptly hides away.",  
		:Ability => [:RUNAWAY,:PASTELVEIL,:ANTICIPATION],
		:Type1 => :PSYCHIC,
		:Movelist => [[1,:GROWL],[1,:TACKLE],[5,:TAILWHIP],[10,:CONFUSION],
			[15,:FAIRYWIND],[20,:AGILITY],[25,:PSYBEAM],[30,:STOMP],[35,:HEALPULSE],
			[41,:TAKEDOWN],[45,:DAZZLINGGLEAM],[50,:PSYCHIC],[55,:HEALINGWISH]],
		:compatiblemoves => [:AGILITY,:ALLYSWITCH,:BODYSLAM,:BOUNCE,:CALMMIND,:CHARM,
			:DAZZLINGGLEAM,:EXPANDINGFORCE,:FUTURESIGHT,:HIGHHORSEPOWER,:HORNDRILL,
			:HYPNOSIS,:IMPRISON,:IRONTAIL,:LOWKICK,:MYSTICALFIRE,:PLAYROUGH,:PSYCHIC,
			:STOREDPOWER,:SWIFT,:WILDCHARGE,:ZENHEADBUTT],
		:moveexceptions => [],
	}
},

:RAPIDASH => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	},

	:OnCreation => proc {
		# Map IDs for alt form
		if $game_map && Ponyta.include?($game_map.map_id) 
			next 1
		  else
			next 0
		  end
	},

	"Galarian" => {
		:DexEntry => "Brave and prideful, this Pokémon dashes airily through the forest, its steps aided by the psychic power stored in the fur on its fetlocks.",  
		:Ability => [:RUNAWAY,:PASTELVEIL,:ANTICIPATION],
		:Type1 => :PSYCHIC,
		:Type2 => :FAIRY,
		:Movelist => [[0,:PSYCHOCUT],[1,:CONFUSION],[1,:MEGAHORN],[1,:GROWL],
			[1,:QUICKATTACK],[1,:TACKLE],[1,:TAILWHIP],[15,:FAIRYWIND],[20,:AGILITY],
			[25,:PSYBEAM],[30,:STOMP],[35,:HEALPULSE],[43,:TAKEDOWN],[49,:DAZZLINGGLEAM],
			[56,:PSYCHIC],[63,:HEALINGWISH]],
		:compatiblemoves => [:AGILITY,:ALLYSWITCH,:BATONPASS,:BODYSLAM,:BOUNCE,:CALMMIND,:CHARM,
			:DAZZLINGGLEAM,:DRILLRUN,:EXPANDINGFORCE,:FUTURESIGHT,:GIGAIMPACT,
			:HIGHHORSEPOWER,:HORNDRILL,:HYPERBEAM,:HYPNOSIS,:IMPRISON,:IRONTAIL,
			:LOWKICK,:MAGICROOM,:MEGAHORN,:MISTYTERRAIN,:MYSTICALFIRE,:PAYDAY,:PLAYROUGH,
			:PSYCHIC,:PSYCHICTERRAIN,:PSYCHOCUT,:SMARTSTRIKE,:STOREDPOWER,:SWIFT,:SWORDSDANCE,
			:THROATCHOP,:TRICKROOM,:WILDCHARGE,:WONDERROOM,:ZENHEADBUTT],
		:moveexceptions => [],
		:preevo => {
			:species => :PONYTA,
			:form => 1, 
		  },
	}
},

:SLOWPOKE => {
	:FormName => {
		0 => "Normal",
		2 => "Galarian"
	},

	"Galarian" => {
		:DexEntry => "Although this Pokémon is normally zoned out, its expression abruptly sharpens on occasion. The cause for this seems to lie in Slowpoke’s diet.",
		:Type1 => :PSYCHIC,
		:Movelist => [[1,:TACKLE],[1,:CURSE],[3,:GROWL],[6,:ACID],[9,:YAWN],
		[12,:CONFUSION],[15,:DISABLE],[18,:WATERPULSE],[21,:HEADBUTT],
		[24,:ZENHEADBUTT],[27,:AMNESIA],[30,:SURF],[33,:SLACKOFF],[36,:PSYCHIC],
		[39,:PSYCHUP],[42,:RAINDANCE],[45,:HEALPULSE]],
		:compatiblemoves => [:AGILITY,:ALLYSWITCH,:BATONPASS,:BODYSLAM,:BOUNCE,:CALMMIND,:CHARM,
			:DAZZLINGGLEAM,:DRILLRUN,:EXPANDINGFORCE,:FUTURESIGHT,:GIGAIMPACT,
			:HIGHHORSEPOWER,:HORNDRILL,:HYPERBEAM,:HYPNOSIS,:IMPRISON,:IRONTAIL,
			:LOWKICK,:MAGICROOM,:MEGAHORN,:MISTYTERRAIN,:MYSTICALFIRE,:PAYDAY,:PLAYROUGH,
			:PSYCHIC,:PSYCHICTERRAIN,:PSYCHOCUT,:SMARTSTRIKE,:STOREDPOWER,:SWIFT,:SWORDSDANCE,
			:THROATCHOP,:TRICKROOM,:WILDCHARGE,:WONDERROOM,:ZENHEADBUTT],
		:moveexceptions => [],
		:GetEvo => [[:SLOWBRO,:Item,:GALARICACUFF],[:SLOWKING,:Item,:GALARICAWREATH]]	
	}
},

:SLOWKING => {
	:FormName => {
		0 => "Normal",
		2 => "Galarian"
	},

	"Galarian" => {
		:DexEntry => "A combination of toxins and the shock of evolving has increased Shellder’s intelligence to the point that Shellder now controls Slowking.",
		:Type1 => :POISON, 
        :Type2 => :PSYCHIC,
		:BaseStats => [95,65,80,110,110,30],
		:Ability => [:CURIOUSMEDICINE, :OWNTEMPO, :REGENERATOR], 
		:Movelist => [[0,:EERIESPELL],[1,:EERIESPELL],[1,:POWERGEM],[1,:SWAGGER],[1,:TACKLE],[1,:CURSE],[1,:GROWL],
		    [1,:NASTYPLOT],[1,:ACID],[9,:YAWN],[12,:CONFUSION],[15,:DISABLE],[18,:WATERPULSE],[21,:HEADBUTT],
			[24,:ZENHEADBUTT],[27,:AMNESIA],[30,:SURF],[33,:SLACKOFF],[36,:PSYCHIC],
			[39,:PSYCHUP],[42,:RAINDANCE],[45,:HEALPULSE]],
		:compatiblemoves => [:AMNESIA,:AVALANCHE,:BLIZZARD,:BODYSLAM,:BRICKBREAK,:BRINE,
			:BULLDOZE,:CALMMIND,:DIG,:DIVE,:DRAINPUNCH,:EARTHQUAKE,:EXPANDINGFORCE,
			:FIREBLAST,:FLAMETHROWER,:FLING,:FOCUSBLAST,:FOULPLAY,:FUTURESIGHT,:GIGAIMPACT,
			:GRASSKNOT,:HAIL,:HEX,:HYDROPUMP,:HYPERBEAM,:ICEBEAM,:ICEPUNCH,:ICYWIND,:IMPRISON,
			:IRONDEFENSE,:IRONTAIL,:LIGHTSCREEN,:LIQUIDATION,:MEGAKICK,:MEGAPUNCH,:MIMIC,
			:MUDDYWATER,:MUDSHOT,:NASTYPLOT,:PAYDAY,:POWERGEM,:PSYCHIC,:PSYCHICTERRAIN,:PSYSHOCK,
			:RAINDANCE,:RAZORSHELL,:SAFEGUARD,:SCALD,:SHADOWBALL,:SKILLSWAP,:SLUDGEBOMB,:SLUDGEWAVE,
			:STOREDPOWER,:SUNNYDAY,:SURF,:SWIFT,:THUNDERWAVE,:TRIATTACK,:TRICK,:TRICKROOM,:VENOMDRENCH,
			:VENOSHOCK,:WEATHERBALL,:WHIRLPOOL,:WONDERROOM,:ZENHEADBUTT],
		:moveexceptions => [],
		:preevo => {
			:species => :SLOWPOKE,
			:form => 2, 
		  },
	}
},

:FARFETCHD => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	},

	:OnCreation => proc {
		# Map IDs for alt form
		if $game_map && Farfetchd.include?($game_map.map_id)
		  next 1
		else
		  next 0
		end
	},

	"Galarian" => {
		:DexEntry => "The Farfetch’d of the Galar region are brave warriors, and they wield thick, tough leeks in battle.",
		:Type1 => :FIGHTING,
		:BaseStats => [52,95,55,58,62,55],
		:Ability => [:STEADFAST,:SCRAPPY],
		:Movelist => [[1,:PECK],[1,:SANDATTACK],[5,:LEER],[10,:FURYCUTTER],
		[15,:ROCKSMASH],[20,:BRUTALSWING],[25,:DETECT],[30,:KNOCKOFF],[35,:DEFOG],
		[40,:BRICKBREAK],[45,:SWORDSDANCE],[50,:SLAM],[55,:LEAFBLADE],
		[60,:FINALGAMBIT],[65,:BRAVEBIRD]],
		:compatiblemoves => [:ASSURANCE,:BODYSLAM,:BRAVEBIRD,:BRICKBREAK,:BRUTALSWING,:CLOSECOMBAT,
			:COUNTER,:COVET,:DEFOG,:DETECT,:DUALWINGBEAT,:FOCUSENERGY,:FURYCUTTER,
			:HELPINGHAND,:KNOCKOFF,:LEAFBLADE,:POISONJAB,:RETALIATE,:REVENGE,:ROCKSMASH,
			:SKYATTACK,:SOLARBLADE,:STEELWING,:SUNNYDAY,:SUPERPOWER,:SWORDSDANCE,:THROATCHOP,:WORKUP],
		:moveexceptions => [],
		:GetEvo => [[:SIRFETCHD,:LandCritical,3]] 	# [Sirfetch'd, LandCritical, 3]
	}
},

:GRIMER => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		if $game_map && Grimer.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Alolan" => {
		:DexEntry => "The crystals on Grimer's body are lumps of toxins. If one falls off, lethal poisons leak out.",
		:Type2 => :DARK,
		:Ability => [:POISONTOUCH,:GLUTTONY,:POWEROFALCHEMY],
		:Movelist => [[1,:POUND],[1,:POISONGAS],[4,:HARDEN],[7,:BITE],
			[12,:DISABLE],[15,:ACIDSPRAY],[18,:POISONFANG],
			[21,:MINIMIZE],[26,:FLING],[29,:KNOCKOFF],[32,:CRUNCH],
			[37,:SCREECH],[40,:GUNKSHOT],[43,:ACIDARMOR],
			[46,:BELCH],[48,:MEMENTO]],
		:EggMoves => [:ASSURANCE,:CLEARSMOG,:CURSE,:IMPRISON,:MEANLOOK,:POWERUPPUNCH,
			:PURSUIT,:SCARYFACE,:SHADOWSNEAK,:SPITE,
			:SPITUP,:STOCKPILE,:SWALLOW],
		:compatiblemoves => [:ASSURANCE,:BRUTALSWING,:CRUNCH,:DIG,:EMBARGO,:EXPLOSION,:FIREBLAST,
			:FIREPUNCH,:FLAMETHROWER,:FLING,:GASTROACID,:GIGADRAIN,:GUNKSHOT,:HEADBUTT,
			:HELPINGHAND,:ICEPUNCH,:IMPRISON,:INFESTATION,:KNOCKOFF,:MEGADRAIN,:PAINSPLIT,
			:PAYBACK,:POISONJAB,:POWERUPPUNCH,:QUASH,:RAINDANCE,:ROCKPOLISH,:ROCKSLIDE,:ROCKTOMB,
			:SCARYFACE,:SCREECH,:SELFDESTRUCT,:SHADOWBALL,:SHOCKWAVE,:SLUDGEBOMB,:SLUDGEWAVE,
			:SNARL,:SPITE,:STONEEDGE,:SUNNYDAY,:TAUNT,:THIEF,:THUNDERPUNCH,:TORMENT,:VENOSHOCK],
		:moveexceptions => [],
		:Height => 7,
		:Weight => 420
	}
},

:MUK => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan",
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		if $game_map && Grimer.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Alolan" => {
		:DexEntry => "While it's unexpectedly quiet and friendly, if it's not fed any trash for a while, it will smash its Trainer's furnishings and eat up the fragments.",
		:Type2 => :DARK,
		:Ability => [:POISONTOUCH,:GLUTTONY,:POWEROFALCHEMY],
		:Movelist => [[0,:VENOMDRENCH],[1,:POUND],
			[1,:POISONGAS],[1,:HARDEN],
			[4,:HARDEN],[7,:BITE],
			[12,:DISABLE],[15,:ACIDSPRAY],[18,:POISONFANG],
			[21,:MINIMIZE],[26,:FLING],[29,:KNOCKOFF],[32,:CRUNCH],
			[37,:SCREECH],[40,:GUNKSHOT],[46,:ACIDARMOR],
			[52,:BELCH],[57,:MEMENTO]],
		:compatiblemoves => [:ASSURANCE,:BLOCK,:BODYSLAM,:BRICKBREAK,:BRUTALSWING,:CORROSIVEGAS,
			:CRUNCH,:DARKPULSE,:DIG,:EMBARGO,:EXPLOSION,:FIREBLAST,:FIREPUNCH,:FLAMETHROWER,
			:FLING,:FOCUSBLAST,:FOCUSPUNCH,:FOULPLAY,:GASTROACID,:GIGADRAIN,:GIGAIMPACT,
			:GUNKSHOT,:HEADBUTT,:HELPINGHAND,:HEX,:HYPERBEAM,:ICEPUNCH,:IMPRISON,:INFESTATION,
			:KNOCKOFF,:MEGADRAIN,:MEGAPUNCH,:PAINSPLIT,:PAYBACK,:POISONJAB,:POWERUPPUNCH,
			:QUASH,:RAINDANCE,:RECYCLE,:ROCKPOLISH,:ROCKSLIDE,:ROCKTOMB,:SCARYFACE,:SCREECH,
			:SELFDESTRUCT,:SHADOWBALL,:SHOCKWAVE,:SLUDGEBOMB,:SLUDGEWAVE,:SNARL,:SPITE,
			:STONEEDGE,:SUNNYDAY,:TAUNT,:THIEF,:THUNDERPUNCH,:TORMENT,:VENOMDRENCH,:VENOSHOCK],
		:moveexceptions => [],
		:Height => 10,
		:Weight => 520,
		:preevo => {
			:species => :GRIMER,
			:form => 1, 
		  },
	}
},

:EXEGGUTOR => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	"Alolan" => {
		:DexEntry => "As it grew taller and taller, it outgrew its reliance on psychic powers, while within it awakened the power of the sleeping dragon.",
		:Type2 => :DRAGON,
		:BaseStats => [95,105,85,125,75,45],
		:Ability => [:FRISK,:FRISK,:HARVEST],
		:Movelist => [[0,:DRAGONHAMMER],[1,:SEEDBOMB],[1,:BARRAGE],
			[1,:HYPNOSIS],[1,:CONFUSION],[17,:PSYSHOCK],
			[27,:EGGBOMB],[37,:WOODHAMMER],[47,:LEAFSTORM]],
		:compatiblemoves => [:ANCIENTPOWER,:BIDE,:BLOCK,:BREAKINGSWIPE,:BRICKBREAK,
			:BRUTALSWING,:BULLDOZE,:BULLETSEED,:CELEBRATE,:CURSE,:DOUBLEEDGE,
			:DRACOMETEOR,:DRAGONPULSE,:DRAGONTAIL,:DREAMEATER,:EARTHQUAKE,
			:ENERGYBALL,:EXPLOSION,:FLAMETHROWER,:FLASH,:GIGADRAIN,:GIGAIMPACT,
			:GRASSKNOT,:GRASSYGLIDE,:GRASSYTERRAIN,:GRAVITY,:HEADBUTT,:HYPERBEAM,
			:HYPNOSIS,:INFESTATION,:IRONHEAD,:IRONTAIL,:KNOCKOFF,:LEAFSTORM,
			:LIGHTSCREEN,:LOWKICK,:MAGICALLEAF,:MEGADRAIN,:MIMIC,:NATUREPOWER,
			:NIGHTMARE,:OUTRAGE,:POWERSWAP,:POWERWHIP,:PSYCHIC,:PSYCHUP,:PSYSHOCK,
			:PSYWAVE,:RAGE,:REFLECT,:ROLLOUT,:SEEDBOMB,:SELFDESTRUCT,:SKILLSWAP,
			:SLUDGEBOMB,:SOLARBEAM,:STOMPINGTANTRUM,:STRENGTH,:SUNNYDAY,:SUPERPOWER,
			:SWEETSCENT,:SWORDSDANCE,:SYNTHESIS,:TAKEDOWN,:TELEKINESIS,:TELEPORT,
			:TERRAINPULSE,:THIEF,:TRICKROOM,:UPROAR,:WORRYSEED,:ZENHEADBUTT],
		:moveexceptions => [],
		:Height => 109,
		:Weight => 4156,
		:toobig => true,
	}
},

:MAROWAK => {
	:FormName => {
		0 => "Normal",
		1 => "Alolan"
	},

	:OnCreation => proc{
		# Map IDs for alolan form
		if $game_map && Cubone.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Alolan" => {
		:DexEntry => "The bones it possesses were once its mother's. Its mother's regrets have become like a vengeful spirit protecting this Pokémon.",
		:Type1 => :FIRE,
		:Type2 => :GHOST,
		:BaseStats => [60,80,110,50,80,45],
		:Ability => [:CURSEDBODY,:LIGHTNINGROD,:ROCKHEAD],
		:Movelist => [[1,:GROWL],[1,:TAILWHIP],[1,:BONECLUB],[1,:FLAMEWHEEL],
			[3,:TAILWHIP],[7,:BONECLUB],[11,:FLAMEWHEEL],[13,:LEER],
			[17,:HEX],[21,:BONEMERANG],[23,:WILLOWISP],
			[27,:SHADOWBONE],[33,:THRASH],[37,:FLING],
			[43,:STOMPINGTANTRUM],[49,:ENDEAVOR],[53,:FLAREBLITZ],
			[59,:RETALIATE],[65,:BONERUSH]],
		:compatiblemoves => [:AERIALACE,:ALLYSWITCH,:ANCIENTPOWER,:BIDE,:BLIZZARD,
			:BODYSLAM,:BRICKBREAK,:BRUTALSWING,:BUBBLEBEAM,:BULLDOZE,:BURNINGJEALOUSY,
			:COUNTER,:CURSE,:DARKPULSE,:DETECT,:DIG,:DOUBLEEDGE,:DREAMEATER,
			:DYNAMICPUNCH,:EARTHPOWER,:EARTHQUAKE,:ECHOEDVOICE,:ENDEAVOR,:FALSESWIPE,
			:FIREBLAST,:FIREPUNCH,:FIRESPIN,:FISSURE,:FLAMECHARGE,:FLAMETHROWER,
			:FLAREBLITZ,:FLING,:FOCUSBLAST,:FOCUSENERGY,:FOCUSPUNCH,:FURYCUTTER,
			:GIGAIMPACT,:HEADBUTT,:HEATWAVE,:HEX,:HYPERBEAM,:ICEBEAM,:ICYWIND,:IMPRISON,
			:INCINERATE,:IRONDEFENSE,:IRONHEAD,:IRONTAIL,:KNOCKOFF,:LASERFOCUS,:LOWKICK,
			:MEGAKICK,:MEGAPUNCH,:MIMIC,:MUDSLAP,:OUTRAGE,:PAINSPLIT,:POLTERGEIST,
			:POWERUPPUNCH,:RAGE,:RAINDANCE,:RETALIATE,:ROCKCLIMB,:ROCKSLIDE,:ROCKSMASH,
			:ROCKTOMB,:SANDSTORM,:SCORCHINGSANDS,:SCREECH,:SEISMICTOSS,:SHADOWBALL,
			:SKULLBASH,:SMACKDOWN,:SPITE,:STEALTHROCK,:STOMPINGTANTRUM,:STONEEDGE,:STRENGTH,
			:SUBMISSION,:SUNNYDAY,:SWIFT,:SWORDSDANCE,:TAKEDOWN,:THIEF,:THROATCHOP,
			:THUNDER,:THUNDERBOLT,:THUNDERPUNCH,:UPROAR,:WATERGUN,:WILLOWISP],
		:moveexceptions => [],
		:Weight => 340
	}
},

:WEEZING => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	}, 

	:OnCreation => proc {
		# Map IDs for galarian form
		if $game_map && Weezing.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Galarian" => {
		:DexEntry => "This Pokémon consumes particles that contaminate the air. Instead of leaving droppings, it expels clean air.",
		:Height => 30,
		:Weight => 160,
		:Type2 => :FAIRY,
		:Ability => [:LEVITATE,:NEUTRALIZINGGAS,:MISTYSURGE],
		:Movelist => [[0,:DOUBLEHIT],[1,:AROMATICMIST],[1,:POISONGAS],[1,:DEFOG],
			[1,:SMOG],[1,:SMOKESCREEN],[1,:FAIRYWIND],[1,:HAZE],[1,:HEATWAVE],[1,:STRANGESTEAM],
			[1,:TACKLE],[12,:CLEARSMOG],[16,:ASSURANCE],[20,:SLUDGE],
			[24,:AROMATHERAPY],[28,:SELFDESTRUCT],[32,:SLUDGEBOMB],[38,:TOXIC],[44,:BELCH],
			[50,:EXPLOSION],[56,:MEMENTO],[62,:DESTINYBOND],[68,:MISTYTERRAIN]],
		:compatiblemoves => [:ASSURANCE,:BIDE,:BRUTALSWING,:CORROSIVEGAS,:CURSE,:DARKPULSE,
			:DAZZLINGGLEAM,:DEFOG,:EXPLOSION,:FIREBLAST,:FLAMETHROWER,:FLASH,:GIGAIMPACT,
			:GYROBALL,:HEADBUTT,:HEATWAVE,:HYPERBEAM,:INCINERATE,:INFESTATION,:MIMIC,
			:MISTYEXPLOSION,:MISTYTERRAIN,:OVERHEAT,:PAINSPLIT,:PAYBACK,:PLAYROUGH,:PSYWAVE,
			:RAGE,:RAINDANCE,:ROLLOUT,:SCREECH,:SELFDESTRUCT,:SHADOWBALL,:SHOCKWAVE,
			:SLUDGEBOMB,:SLUDGEWAVE,:SPITE,:SUNNYDAY,:TAUNT,:THIEF,:THUNDER,:THUNDERBOLT,
			:TORMENT,:TOXICSPIKES,:UPROAR,:VENOMDRENCH,:VENOSHOCK,:WILLOWISP,:WONDERROOM,
			:ZAPCANNON],
		:moveexceptions => [],
	}
},

:ARTICUNO => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	}, 

	"Galarian" => {
		:DexEntry => "Its feather-like blades are composed of psychic energy and can shear through thick iron sheets as if they were paper.",
		:Weight => 509,
		:Type1 => :PSYCHIC,
		:Type2 => :FLYING,
		:BaseStats => [90,85,85,125,100,95],
		:EVs => [0,0,0,0,3,0],
		:Ability => :COMPETITIVE,
		:Movelist => [[1,:GUST],[1,:PSYCHOSHIFT],[5,:CONFUSION],[10,:REFLECT],
			[15,:HYPNOSIS],[20,:AGILITY],[25,:ANCIENTPOWER],[30,:TAILWIND],
			[35,:PSYCHOCUT],[40,:RECOVER],[45,:FREEZINGGLARE],[50,:DREAMEATER],
			[55,:HURRICANE],[60,:MINDREADER],[65,:FUTURESIGHT],[70,:TRICKROOM]],
		:compatiblemoves => [:AGILITY,:AIRSLASH,:ALLYSWITCH,:ANCIENTPOWER,:BRAVEBIRD,:CALMMIND,
			:DREAMEATER,:DUALWINGBEAT,:EXPANDINGFORCE,:FLY,:FUTURESIGHT,:GIGAIMPACT,
			:GUARDSWAP,:HURRICANE,:HYPERBEAM,:HYPERVOICE,:HYPNOSIS,:IMPRISON,:LIGHTSCREEN,
			:POWERSWAP,:PSYCHIC,:PSYCHOCUT,:PSYSHOCK,:REFLECT,:SCARYFACE,:SHADOWBALL,
			:SKILLSWAP,:STEELWING,:STOREDPOWER,:SWIFT,:TAILWIND,:TRICKROOM,:UTURN],
		:moveexceptions => [],
	}
},

:ZAPDOS => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	}, 

	"Galarian" => {
		:DexEntry => "One kick from its powerful legs will pulverize a dump truck. Supposedly, this Pokémon runs through the mountains at over 180 mph.",
		:Weight => 582,
		:Type1 => :FIGHTING,
		:Type2 => :FLYING,
		:BaseStats => [90,125,90,85,90,100],
		:EVs => [0,3,0,0,0,0],
		:Ability => :DEFIANT,
		:Movelist => [[1,:PECK],[1,:FOCUSENERGY],[5,:ROCKSMASH],
			[10,:LIGHTSCREEN],[15,:PLUCK],[20,:AGILITY],[25,:ANCIENTPOWER],
			[30,:BRICKBREAK],[35,:DRILLPECK],[40,:QUICKGUARD],[45,:THUNDEROUSKICK],
			[50,:BULKUP],[55,:COUNTER],[60,:DETECT],[65,:CLOSECOMBAT],[70,:REVERSAL]],
		:compatiblemoves => [:ACROBATICS,:AGILITY,:ANCIENTPOWER,:ASSURANCE,:BLAZEKICK,:BOUNCE,
			:BRAVEBIRD,:BRICKBREAK,:BULKUP,:CLOSECOMBAT,:COACHING,:COUNTER,:DETECT,
			:DUALWINGBEAT,:FLY,:FOCUSENERGY,:GIGAIMPACT,:HURRICANE,:HYPERBEAM,
			:LIGHTSCREEN,:LOWKICK,:LOWSWEEP,:MEGAKICK,:PAYBACK,:PLUCK,:RETALIATE,:REVENGE,
			:REVERSAL,:ROCKSMASH,:SCARYFACE,:SCREECH,:STEELWING,:STOMPINGTANTRUM,
			:SUPERPOWER,:SWIFT,:TAUNT,:THROATCHOP,:UTURN],
		:moveexceptions => [],
	}
},

:MOLTRES => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	}, 

	"Galarian" => {
		:DexEntry => "This Pokémon's sinister, flame-like aura will consume the spirit of any creature it hits. Victims become burned-out shadows of themselves.",
		:Weight => 660,
		:Type1 => :DARK,
		:Type2 => :FLYING,
		:BaseStats => [90,85,90,100,125,90],
		:EVs => [0,0,0,0,0,3],
		:Ability => :BERSERK,
		:Movelist => [[1,:GUST],[1,:LEER],[5,:PAYBACK],[10,:SAFEGUARD],
			[15,:WINGATTACK],[20,:AGILITY],[25,:ANCIENTPOWER],[30,:SUCKERPUNCH],
			[35,:AIRSLASH],[40,:AFTERYOU],[45,:FIERYWRATH],[50,:NASTYPLOT],
			[55,:HURRICANE],[60,:ENDURE],[65,:MEMENTO],[70,:SKYATTACK]],
		:compatiblemoves => [:AFTERYOU,:AGILITY,:AIRSLASH,:ANCIENTPOWER,:ASSURANCE,:BRAVEBIRD,
			:DARKPULSE,:DUALWINGBEAT,:FLY,:FOULPLAY,:GIGAIMPACT,:HEX,:HURRICANE,
			:HYPERBEAM,:HYPERVOICE,:IMPRISON,:LASHOUT,:NASTYPLOT,:PAYBACK,:SAFEGUARD,
			:SCARYFACE,:SHADOWBALL,:SKYATTACK,:SNARL,:STEELWING,:SUCKERPUNCH,:SWIFT,
			:TAUNT,:UTURN],
		:moveexceptions => [],
	}
},

:CORSOLA => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	},

	"Galarian" => {
		:DexEntry => "Sudden climate change wiped out this ancient kind of Corsola. This Pokémon absorbs others’ life-force through its branches.",
		:Type1 => :GHOST,
		:Weight => 5,
		:BaseStats => [60,55,100,65,100,30],
		:EVs => [0,0,0,0,1,0],
		:Ability => [:WEAKARMOR,:CURSEDBODY],
		:Movelist => [[1,:HARDEN],[1,:TACKLE],[5,:ASTONISH],[10,:DISABLE],
			[15,:SPITE],[20,:ANCIENTPOWER],[25,:HEX],[30,:CURSE],[35,:STRENGTHSAP],
			[40,:POWERGEM],[45,:NIGHTSHADE],[50,:GRUDGE],[55,:MIRRORCOAT]],
		:EggMoves => [:CONFUSERAY,:DESTINYBOND,:HAZE,:HEADSMASH,:NATUREPOWER,
			:WATERPULSE],
		:compatiblemoves => [:AMNESIA,:BLIZZARD,:BODYSLAM,:BRINE,:BULLDOZE,
			:CALMMIND,:DIG,:EARTHPOWER,:EARTHQUAKE,:GIGADRAIN,:HAIL,:HEX,:HYDROPUMP,
			:ICEBEAM,:ICICLESPEAR,:ICYWIND,:IRONDEFENSE,:LIGHTSCREEN,:LIQUIDATION,
			:METEORBEAM,:MIMIC,:POWERGEM,:PSYCHIC,:RAINDANCE,:REFLECT,:ROCKBLAST,
			:ROCKSLIDE,:ROCKTOMB,:SAFEGUARD,:SANDSTORM,:SCALD,:SCREECH,:SELFDESTRUCT,
			:SHADOWBALL,:STEALTHROCK,:STOMPINGTANTRUM,:STONEEDGE,:SUNNYDAY,:SURF,
			:THROATCHOP,:WHIRLPOOL,:WILLOWISP],
		:moveexceptions => [],
		:GetEvo => [[:CURSOLA,:Level,38]] 	# [Cursola, Level, 38]
	}
},

:ZIGZAGOON => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	},

	:OnCreation => proc {
		# Map IDs for galarian form
		next $game_map && Zigzagoon.include?($game_map.map_id) ? 1 : 0
	},

	"Galarian" => {
	:DexEntry => "Thought to be the oldest form of Zigzagoon, it moves in zigzags and wreaks havoc upon its surroundings.",
	:Type1 => :DARK,
	:Type2 => :NORMAL,
	:Movelist => [[1,:LEER],[1,:TACKLE],[3,:SANDATTACK],[6,:LICK],[9,:SNARL],
		[12,:HEADBUTT],[15,:BABYDOLLEYES],[18,:PINMISSILE],[21,:REST],[24,:TAKEDOWN],
		[27,:SCARYFACE],[30,:COUNTER],[33,:TAUNT],[36,:DOUBLEEDGE]],
	:EggMoves => [:KNOCKOFF,:PARTINGSHOT,:QUICKGUARD],
	:compatiblemoves => [:ASSURANCE,:BLIZZARD,:BODYSLAM,:COUNTER,:DIG,:DOUBLEEDGE,
		:FAKETEARS,:FLING,:GRASSKNOT,:GUNKSHOT,:HEADBUTT,:HELPINGHAND,:HYPERVOICE,
		:ICEBEAM,:ICYWIND,:IRONTAIL,:LASHOUT,:MUDSHOT,:PAYBACK,:PINMISSILE,
		:RAINDANCE,:RETALIATE,:SCARYFACE,:SCREECH,:SEEDBOMB,:SHADOWBALL,:SNARL,
		:SUNNYDAY,:SURF,:SWIFT,:TAUNT,:THIEF,:THUNDER,:THUNDERBOLT,:THUNDERWAVE,
		:TRICK,:WHIRLPOOL,:WORKUP],
	:moveexceptions => [],
	}
},

:LINOONE => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	},

	:OnCreation => proc {
		# Map IDs for galarian form
		next $game_map && Zigzagoon.include?($game_map.map_id) ? 1 : 0
	},

	"Galarian" => {
	:DexEntry => "This very aggressive Pokémon will recklessly challenge opponents stronger than itself.",
	:Type1 => :DARK,
	:Type2 => :NORMAL,
	:Movelist => [[0,:NIGHTSLASH],[1,:BABYDOLLEYES],[1,:PINMISSILE],[1,:LEER],[1,:TACKLE],
		[1,:SANDATTACK],[1,:LICK],[1,:SWITCHEROO],[9,:SNARL],
		[12,:HEADBUTT],[15,:HONECLAWS],[18,:FURYSWIPES],[23,:REST],[28,:TAKEDOWN],
		[33,:SCARYFACE],[38,:COUNTER],[43,:TAUNT],[48,:DOUBLEEDGE]],
	:compatiblemoves => [:ASSURANCE,:BLIZZARD,:BODYPRESS,:BODYSLAM,:COUNTER,:DIG,
		:DOUBLEEDGE,:FAKETEARS,:FLING,:GIGAIMPACT,:GRASSKNOT,:GUNKSHOT,:HEADBUTT,
		:HELPINGHAND,:HYPERBEAM,:HYPERVOICE,:ICEBEAM,:ICYWIND,:IRONTAIL,:LASHOUT,
		:MUDSHOT,:PAYBACK,:PINMISSILE,:RAINDANCE,:RETALIATE,:SCARYFACE,:SCREECH,
		:SEEDBOMB,:SHADOWBALL,:SHADOWCLAW,:SNARL,:STOMPINGTANTRUM,:SUNNYDAY,:SURF,
		:SWIFT,:TAUNT,:THIEF,:THROATCHOP,:THUNDER,:THUNDERBOLT,:THUNDERWAVE,:TRICK,
		:WHIRLPOOL,:WORKUP],
	:moveexceptions => [],
	:GetEvo => [[:OBSTAGOON,:LevelNight,35]], 	# [Obstagoon, LevelNight, 35]
	:preevo => {
		:species => :ZIGZAGOON,
		:form => 1, 
	  },
	}
},

:YAMASK => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	},

	:OnCreation => proc {
		# Map IDs for alternate form
		next $game_map && YamaskSpawn.include?($game_map.map_id) ? 1 : 0
	},

	"Galarian" => {
		:DexEntry => "A clay slab with cursed engravings took possession of a Yamask. The slab is said to be absorbing the Yamask’s dark power.",
		:Type1 => :GROUND,
		:Type2 => :GHOST,
		:Ability => [:WANDERINGSPIRIT],
		:BaseStats => [38,55,85,30,65,30],
		:Movelist => [[1,:ASTONISH],[1,:PROTECT],[4,:HAZE],[8,:NIGHTSHADE],
			[12,:DISABLE],[16,:BRUTALSWING],[20,:CRAFTYSHIELD],[24,:HEX],[28,:MEANLOOK],
			[32,:SLAM],[36,:CURSE],[40,:SHADOWBALL],[44,:EARTHQUAKE],[48,:GUARDSPLIT],
			[48,:POWERSPLIT],[52,:DESTINYBOND]],
		:EggMoves => [:ALLYSWITCH,:CRAFTYSHIELD,:DISABLE,:ENDURE,:FAKETEARS,
			:HEALBLOCK,:IMPRISON,:MEMENTO,:NASTYPLOT,:TOXICSPIKES],
		:compatiblemoves => [:ALLYSWITCH,:BRUTALSWING,:CALMMIND,:DARKPULSE,:EARTHPOWER,
			:EARTHQUAKE,:ENERGYBALL,:FAKETEARS,:HEX,:IMPRISON,:IRONDEFENSE,:NASTYPLOT,
			:NIGHTSHADE,:PAYBACK,:POLTERGEIST,:PSYCHIC,:RAINDANCE,:ROCKSLIDE,:ROCKTOMB,
			:SAFEGUARD,:SANDSTORM,:SHADOWBALL,:SKILLSWAP,:THIEF,:TOXICSPIKES,:TRICK,:TRICKROOM,
			:WILLOWISP,:WONDERROOM,:ZENHEADBUTT],
		:moveexceptions => [],
		:GetEvo => [[:RUNERIGUS,:Runerigus,0]] # [Runerigus, Special, ???]
	}
},

:STUNFISK => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	},

	"Galarian" => {
	:DexEntry => "Living in mud with a high iron content has given it a strong steel body.",
	:BaseStats => [109,81,99,66,84,32],
	:Type2 => :STEEL,
	:Ability => :MIMICRY,
	:Weight => 205,
	:Movelist => [[1,:MUDSLAP],[1,:TACKLE],[1,:WATERGUN],[1,:METALCLAW],
		[5,:ENDURE],[10,:MUDSHOT],[15,:REVENGE],[20,:METALSOUND],[25,:SUCKERPUNCH],
		[30,:IRONDEFENSE],[35,:BOUNCE],[40,:MUDDYWATER],[45,:SNAPTRAP],[50,:FLAIL],
		[55,:FISSURE]],
	:EggMoves => [:ASTONISH,:BIND,:COUNTER,:CURSE,:EARTHPOWER,:MEFIRST,
		:PAINSPLIT,:REFLECTTYPE,:SLEEPTALK,:SPITE,:YAWN],
	:compatiblemoves => [:BIND,:BOUNCE,:BULLDOZE,:COUNTER,:CRUNCH,:DIG,:EARTHPOWER,
		:EARTHQUAKE,:FISSURE,:FLASHCANNON,:FOULPLAY,:ICEFANG,:IRONDEFENSE,:LASHOUT,
		:MUDDYWATER,:MUDSHOT,:MUDSLAP,:PAINSPLIT,:PAYBACK,:RAINDANCE,:REVENGE,:ROCKSLIDE,
		:ROCKTOMB,:SANDSTORM,:SCALD,:SCREECH,:SLUDGEBOMB,:SLUDGEWAVE,:SPITE,:STEALTHROCK,
		:STEELBEAM,:STOMPINGTANTRUM,:STONEEDGE,:SUCKERPUNCH,:SURF,:TERRAINPULSE,:THUNDERWAVE,
		:UPROAR,:WATERGUN],
	:moveexceptions => [],	
	}
},

##### Hisuian Forms #####

:GROWLITHE => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	:OnCreation => proc{
		# Map IDs for Hisuian form
		if $game_map && Growlithe.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Hisuian" => {
		:DexEntry => "They patrol their territory in pairs. It is believed the igneous rock components in the fur of this species are the result of volcanic activity in its habitat.",
		:Height => 8,
		:Weight => 227,
		:BaseStats => [60,75,45,65,50,55],
		:Type2 => :ROCK,
		:Movelist => [[1,:TACKLE],[5,:EMBER],[9,:BITE],[15,:FIREFANG],
			[21,:ROCKSLIDE],[29,:CRUNCH],[37,:DOUBLEEDGE],[47,:FLAREBLITZ]],
		:compatiblemoves => [:AERIALACE,:AGILITY,:BODYSLAM,:CLOSECOMBAT,:COVET,:CRUNCH,
			:DIG,:DOUBLEEDGE,:FIREBLAST,:FIREFANG,:FIRESPIN,:FLAMECHARGE,:FLAMETHROWER,
			:FLAREBLITZ,:HEATWAVE,:HELPINGHAND,:IRONTAIL,:OUTRAGE,:OVERHEAT,:PLAYROUGH,
			:POWERGEM,:PSYCHICFANGS,:RETALIATE,:REVERSAL,:ROAR,:ROCKBLAST,:ROCKSLIDE,
			:ROCKSMASH,:ROCKTOMB,:SANDSTORM,:SCARYFACE,:SMARTSTRIKE,:SNARL,:STEALTHROCK,
			:STONEEDGE,:SUNNYDAY,:TAKEDOWN,:THUNDERFANG,:WILDCHARGE,:WILLOWISP],
		:moveexceptions => [],	
	}
},

:ARCANINE => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	:OnCreation => proc{
		# Map IDs for Hisuian form
		if $game_map && Growlithe.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Hisuian" => {
		:DexEntry => "Snaps at its foes with fangs cloaked in blazing flame. Despite its bulk, it deftly feints every which way, leading opponents on a deceptively merry chase as it all but dances around them.",
		:Height => 20,
		:Weight => 1680,
		:BaseStats => [95,115,80,95,80,90],
		:Type2 => :ROCK,
		:Movelist => [[1,:TACKLE],[5,:EMBER],[9,:BITE],[15,:FIREFANG],
			[21,:ROCKSLIDE],[29,:CRUNCH],[29,:RAGINGFURY],[37,:DOUBLEEDGE],
			[47,:FLAREBLITZ]],
		:compatiblemoves => [:AERIALACE,:AGILITY,:BODYSLAM,:BULLDOZE,:CLOSECOMBAT,:COVET,:CRUNCH,
			:DIG,:DOUBLEEDGE,:DRAGONPULSE,:FIREBLAST,:FIREFANG,:FIRESPIN,:FLAMECHARGE,:FLAMETHROWER,
			:FLAREBLITZ,:GIGAIMPACT,:HEATWAVE,:HELPINGHAND,:HYPERBEAM,:HYPERVOICE,:IRONHEAD,:IRONTAIL,
			:OUTRAGE,:OVERHEAT,:PLAYROUGH,:POWERGEM,:PSYCHICFANGS,:RETALIATE,:REVERSAL,:ROAR,:ROCKBLAST,
			:ROCKSLIDE,:ROCKSMASH,:ROCKTOMB,:SANDSTORM,:SCARYFACE,:SMARTSTRIKE,:SNARL,:SOLARBEAM,
			:STEALTHROCK,:STONEEDGE,:SUNNYDAY,:TAKEDOWN,:THIEF,:THUNDERFANG,:WILDCHARGE,:WILLOWISP],
		:moveexceptions => [],
		:preevo => {
			:species => :GROWLITHE,
			:form => 1, 
		  },
	}
},

:VOLTORB => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	:OnCreation => proc{
		# Map IDs for Hisuian form
		if $game_map && Voltorb.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Hisuian" => {
		:DexEntry => "An enigmatic Pokémon that happens to bear a resemblance to a Poké Ball. When excited, it discharges the electric current it has stored in its belly, then lets out a great, uproarious laugh.",
		:Weight => 130,
		:Type2 => :GRASS,
		:Movelist => [[1,:THUNDERSHOCK],[5,:TACKLE],[9,:THUNDERWAVE],[15,:SPARK],
			[21,:ENERGYBALL],[29,:THUNDERBOLT],[37,:THUNDER],[47,:SELFDESTRUCT]],
		:compatiblemoves => [:AGILITY,:BULLETSEED,:CHARGEBEAM,:ELECTRICTERRAIN,:ELECTROBALL,
			:ENERGYBALL,:EXPLOSION,:FOULPLAY,:GIGADRAIN,:GRASSKNOT,:GRASSYTERRAIN,:GYROBALL,
			:ICEBALL,:LEAFSTORM,:MAGICALLEAF,:RAINDANCE,:RECYCLE,:REFLECT,:ROLLOUT,:SCREECH,
			:SEEDBOMB,:SELFDESTRUCT,:SOLARBEAM,:SWIFT,:TAKEDOWN,:TAUNT,:THIEF,:THUNDER,
			:THUNDERBOLT,:THUNDERWAVE,:VOLTSWITCH,:WILDCHARGE,:WORRYSEED],
		:moveexceptions => [],
		:GetEvo => [[:ELECTRODE,:Item,:LEAFSTONE]] 	# [Electrode, Item, Leaf Stone]
	}
},

:ELECTRODE => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	:OnCreation => proc{
		# Map IDs for Hisuian form
		if $game_map && Voltorb.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Hisuian" => {
		:DexEntry => "The tissue on the surface of its body is curiously similar in composition to an Apricorn. When irritated, this Pokémon lets loose an electric current equal to 20 lightning bolts.",
		:Weight => 710,
		:Type2 => :GRASS,
		:Movelist => [[1,:THUNDERSHOCK],[5,:TACKLE],[9,:THUNDERWAVE],[15,:SPARK],
			[21,:ENERGYBALL],[29,:THUNDERBOLT],[37,:THUNDER],[47,:CHLOROBLAST],
			[47,:SELFDESTRUCT]],
		:compatiblemoves => [:AGILITY,:BULLETSEED,:CHARGEBEAM,:ELECTRICTERRAIN,:ELECTROBALL,
			:ENERGYBALL,:EXPLOSION,:FOULPLAY,:GIGADRAIN,:GIGAIMPACT,:GRASSKNOT,:GRASSYTERRAIN,
			:GYROBALL,:HYPERBEAM,:ICEBALL,:LEAFSTORM,:MAGICALLEAF,:RAINDANCE,:RECYCLE,:REFLECT,
			:ROLLOUT,:SCARYFACE,:SCREECH,:SEEDBOMB,:SELFDESTRUCT,:SOLARBEAM,:SWIFT,:TAKEDOWN,
			:TAUNT,:THIEF,:THUNDER,:THUNDERBOLT,:THUNDERWAVE,:VOLTSWITCH,:WILDCHARGE,:WORRYSEED],
		:moveexceptions => [],
		:preevo => {
			:species => :VOLTORB,
			:form => 1, 
		  },
	}
},

:TYPHLOSION => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	"Hisuian" => {
		:DexEntry => "Said to purify lost, forsaken souls with its flames and guide them to the afterlife. It is believed its form has been influenced by the energy of the sacred mountain towering at Hisuis center.", 
		:Height => 16,
		:Weight => 698,
		:BaseStats => [73,84,78,119,85,95],
		:Type2 => :GHOST, 
		:Movelist => [[0,:HEX],[1,:QUICKATTACK],[6,:EMBER],[11,:ROLLOUT],
			[18,:FLAMEWHEEL],[25,:SWIFT],[34,:FLAMETHROWER],[40,:INFERNALPARADE],
			[43,:OVERHEAT],[43,:SHADOWBALL]],
		:compatiblemoves => [:AERIALACE,:BLASTBURN,:BODYSLAM,:BRICKBREAK,:BULLDOZE,:CALMMIND,
			:COVET,:CUT,:CURSE,:DETECT,:DIG,:DOUBLEEDGE,:DRAINPUNCH,:EARTHQUAKE,:FIREBLAST,
			:FIREFANG,:FIREPLEDGE,:FIREPUNCH,:FIRESPIN,:FLAMECHARGE,:FLAMETHROWER,:FLAREBLITZ,
			:FOCUSBLAST,:FOCUSPUNCH,:FURYCUTTER,:GIGAIMPACT,:GYROBALL,:HEADBUTT,:HEATWAVE,:HEX,
			:HYPERBEAM,:INCINERATE,:IRONHEAD,:IRONTAIL,:LOWKICK,:MIMIC,:MUDSLAP,:MYSTICALFIRE,
			:NATUREPOWER,:NIGHTSHADE,:OMINOUSWIND,:OVERHEAT,:PLAYROUGH,:REVERSAL,:ROAR,:ROCKSLIDE,
			:ROCKSMASH,:ROLLOUT,:SHADOWBALL,:SHADOWCLAW,:SOLARBEAM,:STOMPINGTANTRUM,:STRENGTH,
			:SUNNYDAY,:SUBMISSION,:SWIFT,:TAKEDOWN,:THUNDERPUNCH,:WILDCHARGE,:WILLOWISP,:WORKUP,
			:ZENHEADBUTT],
		:moveexceptions => [],
	} 
},

:QWILFISH => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	:OnCreation => proc{
		# Map IDs for Hisuian form
		if $game_map && Qwilfish.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Hisuian" => {
		:DexEntry => "Fishers detest this troublesome Pokémon because it sprays poison from its spines, getting it everywhere. A different form of Qwilfish lives in other regions.",
		:Type1 => :DARK,
		:Type2 => :POISON,
		:Movelist => [[1,:POISONSTING],[5,:SPIKES],[9,:PINMISSILE],[15,:BARBBARRAGE],
			[21,:WATERPULSE],[26,:DARKPULSE],[29,:POISONJAB],[37,:AQUATAIL],
			[47,:DOUBLEEDGE],[57,:SELFDESTRUCT]],
		:compatiblemoves => [:AGILITY,:AQUATAIL,:BLIZZARD,:BRINE,:BUBBLEBEAM,:CRUNCH,:DARKPULSE,
			:DOUBLEEDGE,:FELLSTINGER,:GIGAIMPACT,:GUNKSHOT,:HEX,:HYDROPUMP,:ICEBALL,:ICEBEAM,
			:ICYWIND,:LIQUIDATION,:MUDSHOT,:PINMISSILE,:POISONJAB,:RAINDANCE,:REVERSAL,:SCARYFACE,
			:SELFDESTRUCT,:SHADOWBALL,:SLUDGEBOMB,:SPIKES,:SURF,:SWIFT,:SWORDSDANCE,:TAKEDOWN,
			:TAUNT,:TOXICSPIKES,:VENOSHOCK,:WATERFALL,:WATERPULSE],
		:moveexceptions => [],
	}
},

:SNEASEL => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	"Hisuian" => {
		:DexEntry => "Its sturdy, curved claws are ideal for traversing precipitous cliffs. From the tips of these claws drips a venom that infiltrates the nerves of any prey caught in Sneasel’s grasp.",
		:Type1 => :FIGHTING,
		:Type2 => :POISON,
		:Ability => [:INNERFOCUS,:KEENEYE,:POISONTOUCH],
		:Movelist => [[1,:QUICKATTACK],[6,:ICESHARD],[11,:SWIFT],[18,:SLASH],
		[25,:POISONJAB],[34,:SWORDSDANCE],[43,:BLIZZARD]],
		:compatiblemoves => [:AERIALACE,:AGILITY,:BRICKBREAK,:BULKUP,:CALMMIND,:CLOSECOMBAT,:COUNTER,:DIG,
			:DRAINPUNCH,:FALSESWIPE,:FLING,:FOCUSBLAST,:FOCUSENERGY,:GIGAIMPACT,:GRASSKNOT,:GUNKSHOT,
			:HONECLAWS,:IRONTAIL,:LOWKICK,:LOWSWEEP,:NASTYPLOT,:POISONJAB,:RAINDANCE,:REVERSAL,:ROCKSMASH,
			:SCREECH,:SHADOWBALL,:SHADOWCLAW,:SLUDGEBOMB,:SNARL,:SUNNYDAY,:SWIFT,:SWORDSDANCE,:TAKEDOWN,
			:TAUNT,:THIEF,:TOXICSPIKES,:VENOSHOCK,:XSCISSOR],
		:moveexceptions => [],
		:Weight => 270,
		:GetEvo => [[:SNEASLER,:DayHoldItem,:RAZORCLAW]],	# [Sneasler, DayHoldItem, Razor Claw]
	}
},

:SAMUROTT => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	"Hisuian" => {
		:DexEntry => "Hard of heart and deft of blade, this rare form of Samurott is a product of the Pokémon's evolution in the region of Hisui. Its turbulent blows crash into foes like ceaseless pounding waves.", 
		:BaseStats => [90,108,80,100,65,85],
		:EVs => [0,3,0,0,0,0],
		:Type2 => :DARK,
		:Weight => 582,
		:Movelist => [[0,:NIGHTSLASH],[1,:TACKLE],[6,:AQUAJET],[11,:SWORDSDANCE],
			[18,:WATERPULSE],[21,:CEASELESSEDGE],[25,:SLASH],[34,:AQUATAIL],
			[40,:DARKPULSE],[43,:HYDROPUMP]],
		:compatiblemoves => [:AERIALACE,:AIRSLASH,:AQUATAIL,:AVALANCHE,:BLIZZARD,
			:BODYSLAM,:BRICKBREAK,:BULLDOZE,:COVET,:CUT,:DARKPULSE,:DIG,:DIVE,:DRILLRUN,
			:ENCORE,:FALSESWIPE,:FLING,:FOCUSENERGY,:FURYCUTTER,:GIGAIMPACT,:GRASSKNOT,
			:HAIL,:HELPINGHAND,:HYDROCANNON,:HYDROPUMP,:HYPERBEAM,:ICEBEAM,:ICYWIND,
			:IRONTAIL,:LIQUIDATION,:MEGAHORN,:POISONJAB,:PSYCHOCUT,:RAINDANCE,:RAZORSHELL,
			:RETALIATE,:ROCKSMASH,:SCALD,:SCARYFACE,:SMARTSTRIKE,:SNARL,:SUCKERPUNCH,:SURF,
			:SWIFT,:SWORDSDANCE,:TAKEDOWN,:TAUNT,:THIEF,:WATERFALL,:WATERPLEDGE,:WATERPULSE,
			:WORKUP,:XSCISSOR],
		:moveexceptions => [],
	}
},

:LILLIGANT => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},
	
	"Hisuian" => {
		:DexEntry => "I suspect that its well-developed legs are the result of a life spent on mountains covered in deep snow. The scent it exudes from its flower crown heartens those in proximity.",
		:Height => 12,
		:Weight => 192,
		:BaseStats => [70,105,75,50,75,105],
		:EVs => [0,1,0,0,0,1],
		:Type2 => :FIGHTING,
		:Ability => [:CHLOROPHYLL,:HUSTLE,:LEAFGUARD],
		:Movelist => [[0,:ROCKSMASH],[1,:ABSORB],[5,:LEAFAGE],[9,:STUNSPORE],
			[15,:POISONPOWDER],[21,:ENERGYBALL],[29,:SLEEPPOWDER],[34,:DRAINPUNCH],
			[37,:LEAFBLADE],[37,:RECOVER],[42,:VICTORYDANCE],[47,:LEAFSTORM],
			[53,:PETALDANCE],[57,:CLOSECOMBAT]],
		:compatiblemoves => [:ACROBATICS,:AERIALACE,:AFTERYOU,:AIRSLASH,:BABYDOLLEYES,
			:BRICKBREAK,:BULLETSEED,:CHARM,:CLOSECOMBAT,:COVET,:CUT,:DEFOG,:DRAINPUNCH,
			:DREAMEATER,:ENCORE,:ENERGYBALL,:FLASH,:FOCUSENERGY,:GIGADRAIN,:GIGAIMPACT,
			:GRASSKNOT,:GRASSYGLIDE,:GRASSYTERRAIN,:HEALBELL,:HELPINGHAND,:HURRICANE,
			:HYPERBEAM,:LASERFOCUS,:LEAFBLADE,:LEAFSTORM,:LOWKICK,:LOWSWEEP,:MAGICALLEAF,
			:MEGADRAIN,:MEGAKICK,:METRONOME,:NATUREPOWER,:POISONJAB,:POLLENPUFF,:RAINDANCE,
			:ROCKSMASH,:SAFEGUARD,:SEEDBOMB,:SOLARBEAM,:SOLARBLADE,:SUNNYDAY,:SWORDSDANCE,
			:SYNTHESIS,:TAKEDOWN,:WORRYSEED],
		:moveexceptions => [],
	}
},

:ZORUA => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	:OnCreation => proc{
		# Map IDs for Hisuian form
		if $game_map && Zorua.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Hisuian" => {
		:DexEntry => "A once-departed soul, returned to life in Hisui. Derives power from resentment, which rises as energy atop its head and takes on the forms of foes. In this way, Zorua vents lingering malice.",
		:BaseStats => [35,60,40,85,40,70],
		:Type1 => :NORMAL,
		:Type2 => :GHOST,
		:Movelist => [[1,:SHADOWSNEAK],[6,:SNARL],[11,:SWIFT],[18,:BITTERMALICE],[25,:SLASH],
			 [34,:SHADOWCLAW],[43,:NASTYPLOT]],
		:compatiblemoves => [:AERIALACE,:AGILITY,:CALMMIND,:CURSE,:DARKPULSE,:DIG,:FAKETEARS,
			:FLING,:FOULPLAY,:GIGAIMPACT,:HEX,:HONECLAWS,:HYPERBEAM,:ICYWIND,:IMPRISON,
			:KNOCKOFF,:NASTYPLOT,:NIGHTSHADE,:PHANTOMFORCE,:RAINDANCE,:SHADOWBALL,:SHADOWCLAW,
			:SLUDGEBOMB,:SNARL,:SPITE,:SWIFT,:TAKEDOWN,:TAUNT,:THIEF,:TORMENT,:TRICK,:UTURN,
			:WILLOWISP],
		:moveexceptions => [],
	}
},

:ZOROARK => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	:OnCreation => proc{
		# Map IDs for Hisuian form
		if $game_map && Zorua.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Hisuian" => {
		:DexEntry => "With its disheveled white fur, it looks like an embodiment of death. Heedless of its own safety, Zoroark attacks its nemeses with a bitter energy so intense, it lacerates Zoroark’s own body.",
		:Weight => 730,
		:BaseStats => [55,100,60,125,60,110],
		:Type1 => :NORMAL,
		:Type2 => :GHOST,
		:Movelist => [[1,:SHADOWSNEAK],[6,:SNARL],[11,:SWIFT],[18,:BITTERMALICE],[25,:SLASH],
			[34,:SHADOWCLAW],[40,:SHADOWBALL],[43,:NASTYPLOT],[52,:EXTRASENSORY]],
		:compatiblemoves => [:AERIALACE,:AGILITY,:BODYSLAM,:BRICKBREAK,:CALMMIND,:CURSE,:CRUNCH,
			:DARKPULSE,:DIG,:FAKETEARS,:FLAMETHROWER,:FLING,:FOCUSBLAST,:FOULPLAY,:GIGAIMPACT,
			:GRASSKNOT,:HELPINGHAND,:HEX,:HONECLAWS,:HYPERBEAM,:HYPERVOICE,:ICYWIND,:IMPRISON,
			:KNOCKOFF,:LOWKICK,:LOWSWEEP,:NASTYPLOT,:NIGHTSHADE,:OMINOUSWIND,:PHANTOMFORCE,:PSYCHIC,
			:RAINDANCE,:ROCKSMASH,:SCARYFACE,:SHADOWBALL,:SHADOWCLAW,:SLUDGEBOMB,:SNARL,:SPITE,:SWIFT,
			:SWORDSDANCE,:TAKEDOWN,:TAUNT,:THIEF,:TORMENT,:TRICK,:UTURN,:WILLOWISP],
		:moveexceptions => [],
		:preevo => {
			:species => :ZORUA,
			:form => 1, 
		  },
	}
},

:BRAVIARY => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	:OnCreation => proc{
		# Map IDs for Hisuian form
		if $game_map && Braviary.include?($game_map.map_id)
			next 1
		else
			next 0
		end
	},

	"Hisuian" => {
		:DexEntry => "Screaming a bloodcurdling battle cry, this huge and ferocious bird Pokémon goes out on the hunt. It blasts lakes with shock waves, then scoops up any prey that float to the water’s surface.",
		:Height => 17,
		:Weight => 434,
		:BaseStats => [110,83,70,112,70,65],
		:EVs => [0,0,0,2,0,0],
		:Type1 => :PSYCHIC,
		:Type2 => :FLYING,
		:Movelist => [[1,:QUICKATTACK],[6,:AERIALACE],[11,:TWISTER],[18,:SLASH],
			[20,:AIRSLASH],[25,:ESPERWING],[25,:ROOST],[34,:DOUBLEEDGE],[43,:BRAVEBIRD],
		   	[52,:HURRICANE]],
		:compatiblemoves => [:ACROBATICS,:AERIALACE,:AGILITY,:AIRCUTTER,:AIRSLASH,:ASSURANCE,
			:BODYSLAM,:BRAVEBIRD,:BULKUP,:CALMMIND,:CLOSECOMBAT,:CUT,:DAZZLINGGLEAM,:DEFOG,
			:DOUBLEEDGE,:DUALWINGBEAT,:FLY,:GIGAIMPACT,:HEATWAVE,:HELPINGHAND,:HONECLAWS,:HURRICANE,
			:HYPERBEAM,:HYPERVOICE,:ICYWIND,:MYSTICALFIRE,:NIGHTSHADE,:OMINOUSWIND,:PLUCK,:PSYCHIC,
			:PSYCHICTERRAIN,:PSYSHOCK,:RAINDANCE,:RETALIATE,:REVERSAL,:ROCKSLIDE,:ROCKSMASH,
			:ROCKTOMB,:ROOST,:SCARYFACE,:SHADOWBALL,:SHADOWCLAW,:SKYATTACK,:SKYDROP,:SNARL,:STEELWING,
			:STOREDPOWER,:STRENGTH,:SUNNYDAY,:SUPERPOWER,:SWIFT,:TAILWIND,:TAKEDOWN,:TWISTER,:UTURN,
			:WHIRLWIND,:WORKUP,:ZENHEADBUTT],
		:moveexceptions => [],
	}
},

:SLIGGOO => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian",
	},	

	"Hisuian" => {
		:DexEntry => "A creature given to melancholy. I suspect its metallic shell developed as a result of the mucus on its skin reacting with the iron in Hisui's water.",
		:Height => 7,
		:Weight => 685,
		:BaseStats => [58,75,83,83,113,40],
		:Type1 => :STEEL,
		:Type2 => :DRAGON,
		:Ability => [:SAPSIPPER,:SHELLARMOR,:GOOEY],
		#:Movelist => [[0,:ROCKSLIDE],[1,:TACKLE],[5,:POWDERSNOW],[9,:ICESHARD],
		#	[15,:BITE],[21,:IRONDEFENSE],[29,:CRUNCH],[29,:EARTHPOWER],
		#	[37,:BLIZZARD],[37,:MOUNTAINGALE],[47,:DOUBLEEDGE]], #hisuan avalugg
		:compatiblemoves => [:BIDE,:BLIZZARD,:BODYSLAM,:CHARM,:COUNTER,:CURSE,:DRACOMETEOR,
			:DRAGONBREATH,:DRAGONPULSE,:FLASHCANNON,:HEAVYSLAM,:HYDROPUMP,:ICEBEAM,:INFESTATION,
			:IRONHEAD,:IRONTAIL,:MUDDYWATER,:MUDSHOT,:OUTRAGE,:RAINDANCE,:ROCKSLIDE,:ROCKTOMB,
			:SANDSTORM,:SHOCKWAVE,:SKITTERSMACK,:SLUDGEBOMB,:SLUDGEWAVE,:STEELBEAM,:SUNNYDAY,
			:TAKEDOWN,:THUNDER,:THUNDERBOLT,:WATERGUN,:WATERPULSE],
		:moveexceptions => [],
	}
},

:GOODRA => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian",
	},	

	"Hisuian" => {
		:DexEntry => "Able to freely control the hardness of its metallic shell. It loathes solitude and is extremely clingy—it will fume and run riot if those dearest to it ever leave its side.",
		:Height => 17,
		:Weight => 3341,
		:BaseStats => [80,100,100,110,150,60],
		:Type1 => :STEEL,
		:Type2 => :DRAGON,
		:Ability => [:SAPSIPPER,:SHELLARMOR,:GOOEY],
		#:Movelist => [[0,:ROCKSLIDE],[1,:TACKLE],[5,:POWDERSNOW],[9,:ICESHARD],
		#	[15,:BITE],[21,:IRONDEFENSE],[29,:CRUNCH],[29,:EARTHPOWER],
		#	[37,:BLIZZARD],[37,:MOUNTAINGALE],[47,:DOUBLEEDGE]], #hisuan avalugg
		:compatiblemoves => [:BIDE,:BLIZZARD,:BODYPRESS,:BODYSLAM,:BULLDOZE,:CHARM,
			:COUNTER,:CURSE,:DRACOMETEOR,:DRAGONBREATH,:DRAGONCLAW,:DRAGONPULSE,:DRAGONTAIL,
			:EARTHQUAKE,:FIREBLAST,:FIREPUNCH,:FLAMETHROWER,:FLASHCANNON,:GIGAIMPACT,
			:HEAVYSLAM,:HYDROPUMP,:HYPERBEAM,:ICEBEAM,:INFESTATION,:IRONHEAD,:IRONTAIL,
			:MUDDYWATER,:MUDSHOT,:OUTRAGE,:RAINDANCE,:ROCKSLIDE,:ROCKSMASH,:ROCKTOMB,
			:SANDSTORM,:SCARYFACE,:SHOCKWAVE,:SKITTERSMACK,:SLUDGEBOMB,:SLUDGEWAVE,
			:STEELBEAM,:STOMPINGTANTRUM,:SUNNYDAY,:SURF,:TAKEDOWN,:THUNDER,:THUNDERBOLT,
			:THUNDERPUNCH,:WATERGUN,:WATERPULSE],
		:moveexceptions => [],
		:preevo => {
			:species => :SLIGGOO,
			:form => 1, 
		  },
	}
},

:AVALUGG => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian",
	},	

	"Hisuian" => {
		:DexEntry => "The armor of ice covering its lower jaw puts steel to shame and can shatter rocks with ease. This Pokémon barrels along steep mountain paths, cleaving through the deep snow.",
		:Height => 14,
		:Weight => 2624,
		:BaseStats => [95,127,184,34,36,38],
		:Type2 => :ROCK,
		:Ability => [:STRONGJAW,:ICEBODY,:STURDY],
		:Movelist => [[0,:ROCKSLIDE],[1,:TACKLE],[5,:POWDERSNOW],[9,:ICESHARD],
			[15,:BITE],[21,:IRONDEFENSE],[29,:CRUNCH],[29,:EARTHPOWER],
			[37,:BLIZZARD],[37,:MOUNTAINGALE],[47,:DOUBLEEDGE]],
		:compatiblemoves => [:AFTERYOU,:AURORAVEIL,:AVALANCHE,:BLIZZARD,:BODYPRESS,
			:BODYSLAM,:BULLDOZE,:CRUNCH,:CURSE,:DIG,:DOUBLEEDGE,:EARTHPOWER,
			:EARTHQUAKE,:FLASH,:FLASHCANNON,:FROSTBREATH,:GIGAIMPACT,:GYROBALL,:HAIL,
			:HEAVYSLAM,:HIGHHORSEPOWER,:HYPERBEAM,:ICEBALL,:ICEBEAM,:ICEFANG,:ICICLESPEAR,
			:ICYWIND,:IRONDEFENSE,:IRONHEAD,:RAINDANCE,:ROCKBLAST,:ROCKPOLISH,:ROCKSLIDE,
			:ROCKSMASH,:ROCKTOMB,:SAFEGUARD,:SANDSTORM,:SCARYFACE,:STEALTHROCK,:STOMPINGTANTRUM,
			:STONEEDGE,:STRENGTH,:SURF,:TAKEDOWN,:WATERPULSE],
		:moveexceptions => [],
	}
},

:DECIDUEYE => {
	:FormName => {
		0 => "Normal",
		1 => "Hisuian"
	},

	"Hisuian" => {
		:DexEntry => "Hard of heart and deft of blade, this rare form of Samurott is a product of the Pokémon’s evolution in the region of Hisui. Its turbulent blows crash into foes like ceaseless pounding waves.", 
		:BaseStats => [88,112,80,95,95,60],
		:Type2 => :FIGHTING,
		:Weight => 370,
		:Movelist => [[0,:ROCKSMASH],[1,:GUST],[6,:LEAFAGE],[11,:ROOST],
			[18,:AERIALACE],[21,:MAGICALLEAF],[25,:AIRSLASH],[30,:AURASPHERE],
			[34,:LEAFBLADE],[34,:TRIPLEARROWS],[40,:BRAVEBIRD],[43,:LEAFSTORM]],
		:compatiblemoves => [:AERIALACE,:AIRCUTTER,:AIRSLASH,:AURASPHERE,:BATONPASS,
			:BRAVEBIRD,:BRICKBREAK,:BULKUP,:BULLETSEED,:CLOSECOMBAT,:COVET,:CURSE,
			:DEFOG,:DUALWINGBEAT,:ECHOEDVOICE,:ENERGYBALL,:FALSESWIPE,:FOCUSBLAST,
			:FOCUSENERGY,:FRENZYPLANT,:GIGADRAIN,:GIGAIMPACT,:GRASSKNOT,:GRASSPLEDGE,
			:GRASSYGLIDE,:GRASSYTERRAIN,:HELPINGHAND,:HYPERBEAM,:KNOCKOFF,:LEAFBLADE,
			:LEAFSTORM,:LIGHTSCREEN,:LOWKICK,:LOWSWEEP,:MAGICALLEAF,:NASTYPLOT,:NATUREPOWER,
			:OMINOUSWIND,:PLUCK,:PSYCHOCUT,:RAINDANCE,:REVERSAL,:ROCKSMASH,:ROCKTOMB,:ROOST,
			:SAFEGUARD,:SCARYFACE,:SEEDBOMB,:SHADOWCLAW,:SKYATTACK,:SOLARBEAM,:SPIKES,:STEELWING,
			:SUCKERPUNCH,:SUNNYDAY,:SWIFT,:SWORDSDANCE,:SYNTHESIS,:TAKEDOWN,:TAILWIND,:TAUNT,
			:UTURN,:WORKUP,:WORRYSEED],
		:moveexceptions => [],
	}
},

:BASCULEGION => {
	:FormName => {
		0 => "Male",
		1 => "Female"
	},

	"Female" => {
		:BaseStats => [120,92,65,100,75,78]
	}
},

###################### Paldean Forms ######################

=begin

:WOOPER => {
	:FormName => {
		0 => "Normal",
		1 => "Paldean"
	},

	"Paldean" => {
		:DexEntry => "???", 
		:Type1 => :POISON,
		:Ability => [:POISONPOINT,:WATERABSORB],
		:Weight => 110
	}
},

=end

###################### Mega Evolutions ######################

:KYOGRE => {
	:FormName => {
		0 => "Normal",
		1 => "Primal"
	},
	:PrimalForm => 1,

	"Primal" => {
		:BaseStats => [100,150,90,180,160,90],
		:Ability => :PRIMORDIALSEA,
		:Height => 98,
		:Weight => 4300
	}
},

:GROUDON => {
	:FormName => {
		0 => "Normal",
		1 => "Primal"
	},
	:PrimalForm => 1,

	"Primal" => {
		:BaseStats => [100,180,160,150,90,90],
		:Ability => :DESOLATELAND,
		:Height => 50,
		:Weight => 9997,
		:Type2 => :FIRE
	}
},

:VENUSAUR => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:VENUSAURITE => 1,
	},

	"Mega" => {
		:BaseStats => [80,100,123,122,120,80],
		:Ability => :THICKFAT,
		:Height => 24,
		:Weight => 1555
	}
},

:CHARIZARD => {
	:FormName => {
		0 => "Normal",
		1 => "Mega X",
		2 => "Mega Y"
	},
	:DefaultForm => 0,
  	:MegaForm => {
		:CHARIZARDITEX => 1,
		:CHARIZARDITEY => 2
	},

	"Mega Y" => {
		:BaseStats => [78,104,78,159,115,100],
		:Ability => :DROUGHT,
		:Weight => 1005
	},

	"Mega X" => {
		:BaseStats => [78,130,111,130,85,100],
		:Ability => :TOUGHCLAWS,
		:Weight => 1105,
		:Type2 => :DRAGON
	}
},

:BLASTOISE => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:BLASTOISINITE => 1,
	},

	"Mega" => {
		:BaseStats => [79,103,120,135,115,78],
		:Ability => :MEGALAUNCHER,
		:Weight => 1011
	}
},

:ALAKAZAM => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:ALAKAZITE => 1,
	},

	"Mega" => {
		:BaseStats => [55,50,65,175,105,150],
		:Ability => :TRACE,
		:Weight => 480
	}
},

:GENGAR => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:GENGARITE => 1,
	},

	"Mega" => {
		:BaseStats => [60,65,80,170,95,130],
		:Ability => :SHADOWTAG,
		:Weight => 405
	}
},

:KANGASKHAN => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:KANGASKHANITE => 1,
	},

	"Mega" => {
		:BaseStats => [105,125,100,60,100,100],
		:Ability => :PARENTALBOND,
		:Weight => 1000
	}
},

:PINSIR => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:PINSIRITE => 1,
	},

	"Mega" => {
		:BaseStats => [65,155,120,65,90,105],
		:Ability => :AERILATE,
		:Weight => 590,
		:Type2 => :FLYING
	}
},

:GYARADOS => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:GYARADOSITE => 1,
	},

	"Mega" => {
		:BaseStats => [95,155,109,70,130,81],
		:Ability => :MOLDBREAKER,
		:Weight => 3050,
		:Type2 => :DARK
	}
},

:AERODACTYL => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:AERODACTYLITE => 1,
	},

	"Mega" => {
		:BaseStats => [80,135,85,70,95,150],
		:Ability => :TOUGHCLAWS,
		:Weight => 1270
	}
},

:MEWTWO => {
	:FormName => {
		0 => "Normal",
		1 => "Mega X",
		2 => "Mega Y"
	},
	:DefaultForm => 0,
  	:MegaForm => {
		:MEWTWONITEX => 1,
		:MEWTWONITEY => 2
	},

	"Mega X" => {
		:BaseStats => [106,190,100,154,100,130],
		:Ability => :STEADFAST,
		:Weight => 1105,
		:Type2 => :FIGHTING
	},

	"Mega Y" => {
		:BaseStats => [106,150,70,194,120,140],
		:Ability => :INSOMNIA,
		:Weight => 330
	}
},

:AMPHAROS => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:AMPHAROSITE => 1,
	},

	"Mega" => {
		:BaseStats => [90,95,105,165,110,45],
		:Ability => :MOLDBREAKER,
		:Weight => 615,
		:Type2 => :DRAGON
	}
},

:SCIZOR => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:SCIZORITE => 1,
	},

	"Mega" => {
		:BaseStats => [70,150,140,65,100,75],
		:Ability => :TECHNICIAN,
		:Weight => 1250
	}
},

:HERACROSS => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:HERACRONITE => 1,
	},

	"Mega" => {
		:BaseStats => [80,185,115,40,105,75],
		:Ability => :SKILLLINK,
		:Weight => 625
	}
},

:HOUNDOOM => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:HOUNDOOMINITE => 1,
	},

	"Mega" => {
		:BaseStats => [75,90,90,140,90,115],
		:Ability => :SOLARPOWER,
		:Weight => 495
	}
},

:TYRANITAR => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:TYRANITARITE => 1,
	},

	"Mega" => {
		:BaseStats => [100,164,150,95,120,71],
		:Ability => :SANDSTREAM,
		:Weight => 2550
	}
},

:BLAZIKEN => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:BLAZIKENITE => 1,
	},

	"Mega" => {
		:BaseStats => [80,160,80,130,80,100],
		:Ability => :SPEEDBOOST,
		:Weight => 520
	}
},

:GARDEVOIR => {
	:FormName => {
		0 => "Normal",
		1 => "Mega",
	},
	:DefaultForm => 0,
	:MegaForm => {
		:GARDEVOIRITE => 1,
	},

	"Mega" => {
		:BaseStats => [68,85,65,165,135,100],
		:Ability => :PIXILATE,
		:Weight => 484
	}
},

:MAWILE => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:MAWILITE => 1,
	},

	"Mega" => {
		:BaseStats => [50,105,125,55,95,50],
		:Ability => :HUGEPOWER,
		:Weight => 235
	}
},

:AGGRON => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:AGGRONITE => 1,
	},

	"Mega" => {
		:BaseStats => [70,140,230,60,80,50],
		:Ability => :FILTER,
		:Weight => 3950,
		:Type2 => :STEEL
	}
},

:MEDICHAM => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:MEDICHAMITE => 1,
	},

	"Mega" => {
		:BaseStats => [60,100,85,80,85,100],
		:Ability => :PUREPOWER,
		:Weight => 315
	}
},

:MANECTRIC => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:MANECTITE => 1,
	},

	"Mega" => {
		:BaseStats => [70,75,80,135,80,135],
		:Ability => :INTIMIDATE,
		:Weight => 440
	}
},

:BANETTE => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:BANETTITE => 1,
	},

	"Mega" => {
		:BaseStats => [64,165,75,93,83,75],
		:Ability => :PRANKSTER,
		:Weight => 130
	}
},

:ABSOL => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:ABSOLITE => 1,
	},

	"Mega" => {
		:BaseStats => [65,150,60,115,60,115],
		:Ability => :MAGICBOUNCE,
		:Weight => 490
	}
},

:GARCHOMP => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:GARCHOMPITE => 1,
	},

	"Mega" => {
		:BaseStats => [108,170,92,120,95,115],
		:Ability => :SANDFORCE,
		:Weight => 950
	}
},

:LUCARIO => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:LUCARIONITE => 1,
	},

	"Mega" => {
		:BaseStats => [70,145,88,140,70,112],
		:Ability => :ADAPTABILITY,
		:Weight => 575
	}
},

:ABOMASNOW => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:ABOMASITE => 1,
	},

	"Mega" => {
		:BaseStats => [90,132,105,132,105,30],
		:Ability => :SNOWWARNING,
		:Weight => 1850
	}
},

:BEEDRILL => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:BEEDRILLITE => 1,
	},

	"Mega" => {
		:BaseStats => [65,150,40,15,80,145],
		:Ability => :ADAPTABILITY,
		:Height => 14,
		:Weight => 405
	}
},

:PIDGEOT => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:PIDGEOTITE => 1,
	},

	"Mega" => {
		:BaseStats => [83,80,80,135,80,121],
		:Ability => :NOGUARD,
		:Height => 22,
		:Weight => 505
	}
},

:SLOWBRO => {
	:FormName => {
		0 => "Normal",
		1 => "Mega",
		2 => "Galarian"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:SLOWBRONITE => 1,
	},

	"Mega" => {
		:BaseStats => [95,75,180,130,80,30],
		:Ability => :SHELLARMOR,
		:Height => 20,
		:Weight => 1200
	},

	"Galarian" => {
		:DexEntry => "A Shellder bite set off a chemical reaction with the spices inside Slowbro’s body, causing Slowbro to become a Poison-type Pokémon.",
		:Type1 => :POISON, 
        :Type2 => :PSYCHIC,
		:BaseStats => [95,100,95,100,70,30],
		:Ability => [:QUICKDRAW, :OWNTEMPO, :REGENERATOR], 
		:Movelist => [[0,:SHELLSIDEARM],[1,:SHELLSIDEARM],[1,:WITHDRAW],
		[1,:TACKLE],[1,:CURSE],[1,:GROWL],[1,:ACID],[9,:YAWN],[12,:CONFUSION],
		[15,:DISABLE],[18,:WATERPULSE],[21,:HEADBUTT],[24,:ZENHEADBUTT],
		[27,:AMNESIA],[30,:SURF],[33,:SLACKOFF],[36,:PSYCHIC],[39,:PSYCHUP],
		[42,:RAINDANCE],[45,:HEALPULSE]],
		:compatiblemoves => [:AMNESIA,:BLIZZARD,:BLOCK,:BODYSLAM,:BRINE,:BULLDOZE,:CALMMIND,
			:DIG,:DIVE,:EARTHQUAKE,:EXPANDINGFORCE,:FIREBLAST,:FLAMETHROWER,:FOULPLAY,
			:FUTURESIGHT,:GRASSKNOT,:HAIL,:HEADBUTT,:HYDROPUMP,:ICEBEAM,:ICYWIND,
			:IMPRISON,:IRONTAIL,:LIGHTSCREEN,:LIQUIDATION,:MUDSHOT,:PAYDAY,:PSYCHIC,
			:PSYCHICTERRAIN,:PSYCHUP,:PSYSHOCK,:RAINDANCE,:SAFEGUARD,:SCALD,:SHADOWBALL,
			:SKILLSWAP,:STOREDPOWER,:SUNNYDAY,:SURF,:SWIFT,:THUNDERWAVE,:TRIATTACK,:TRICK,
			:TRICKROOM,:WATERPULSE,:WEATHERBALL,:WHIRLPOOL,:WONDERROOM,:ZENHEADBUTT],
		:moveexceptions => [],
		:Weight => 705,
		:preevo => {
			:species => :SLOWPOKE,
			:form => 2, 
		  },
	}
},

:STEELIX => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:STEELIXITE => 1,
	},

	"Mega" => {
		:BaseStats => [75,125,230,55,95,30],
		:Ability => :SANDFORCE,
		:Height => 105,
		:Weight => 7400
	}
},

:SWAMPERT => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:SWAMPERTITE => 1,
	},

	"Mega" => {
		:BaseStats => [100,150,110,85,110,70],
		:Ability => :SWIFTSWIM,
		:Height => 19,
		:Weight => 552
	}
},

:SCEPTILE => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:SCEPTILE => 1,
	},

	"Mega" => {
		:BaseStats => [70,110,75,145,85,145],
		:Ability => :LIGHTNINGROD,
		:Height => 19,
		:Weight => 552,
		:Type2 => :DRAGON
	}
},

:SABLEYE => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:SABLENITE => 1,
	},

	"Mega" => {
		:BaseStats => [50,85,125,85,115,20],
		:Ability => :MAGICBOUNCE,
		:Height => 5,
		:Weight => 1610
	}
},

:SHARPEDO => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:SHARPEDONITE => 1,
	},

	"Mega" => {
		:BaseStats => [70,140,70,110,65,105],
		:Ability => :STRONGJAW,
		:Height => 25,
		:Weight => 1303
	}
},

:CAMERUPT => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:CAMERUPTITE => 1,
	},

	"Mega" => {
		:BaseStats => [70,120,100,145,105,20],
		:Ability => :SHEERFORCE,
		:Height => 25,
		:Weight => 3205
	}
},

:ALTARIA => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:ALTARIANITE => 1,
	},

	"Mega" => {
		:BaseStats => [75,110,110,110,105,80],
		:Ability => :PIXILATE,
		:Height => 15,
		:Weight => 2060,
		:Type2 => :FAIRY
	}
},

:GLALIE => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:GLALITITE => 1,
	},

	"Mega" => {
		:BaseStats => [80,120,80,120,80,100],
		:Ability => :REFRIGERATE,
		:Height => 21,
		:Weight => 3502
	}
},

:SALAMENCE => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:SALAMENCITE => 1,
	},

	"Mega" => {
		:BaseStats => [95,145,130,120,90,120],
		:Ability => :AERILATE,
		:Height => 18,
		:Weight => 1125
	}
},

:METAGROSS => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:METAGROSSITE => 1,
	},

	"Mega" => {
		:BaseStats => [80,145,150,105,110,110],
		:Ability => :TOUGHCLAWS,
		:Height => 25,
		:Weight => 9429
	}
},

:LATIAS => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:LATIASITE => 1,
	},

	"Mega" => {
		:BaseStats => [80,100,120,140,150,110],
		:Height => 18,
		:Weight => 520
	}
},

:LATIOS => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:LATIOSITE => 1,
	},

	"Mega" => {
		:BaseStats => [80,130,100,160,120,110],
		:Height => 23,
		:Weight => 700
	}
},

:RAYQUAZA => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => 1,

	"Mega" => {
		:BaseStats => [105,180,100,180,100,115],
		:Ability => :DELTASTREAM,
		:Height => 108,
		:Weight => 3920
	}
},

:LOPUNNY => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:LOPUNNITE => 1,
	},

	"Mega" => {
		:BaseStats => [65,136,94,54,96,135],
		:Ability => :SCRAPPY,
		:Height => 13,
		:Weight => 283,
		:Type2 => :FIGHTING
	}
},

:GALLADE => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:GALLADITE => 1,
	},

	"Mega" => {
		:BaseStats => [68,165,95,65,115,110],
		:Ability => :INNERFOCUS,
		:Height => 16,
		:Weight => 564
	}
},

:AUDINO => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:AUDINITE => 1,
	},

	"Mega" => {
		:BaseStats => [103,60,126,80,126,50],
		:Ability => :HEALER,
		:Height => 16,
		:Weight => 564,
		:Type2 => :FAIRY
	}
},

:DIANCIE => {
	:FormName => {
		0 => "Normal",
		1 => "Mega"
	},
	:DefaultForm => 0,
	:MegaForm => {
		:DIANCITE => 1,
	},

	"Mega" => {
		:BaseStats => [50,160,110,160,110,110],
		:Ability => :MAGICBOUNCE,
		:Height => 11,
		:Weight => 278
	}
},

:MRMIME => {
	:FormName => {
		0 => "Normal",
		1 => "Galarian"
	},

	"Galarian" => {
		:DexEntry => "Its talent is tap-dancing. It can also manipulate temperatures to create a floor of ice, which this Pokémon can kick up to use as a barrier.",
		:BaseStats => [50,65,65,90,90,100],
		:EVs => [0,0,0,2,0,0],
		:Ability => [:VITALSPIRIT,:SCREENCLEANER,:ICEBODY],
		:Height => 14,
		:Weight => 568,
		:Type1 => :ICE,
		:Type2 => :PSYCHIC,
		:Movelist => [[1,:BATONPASS],[1,:COPYCAT],[1,:DAZZLINGGLEAM],[1,:ENCORE],
			[1,:ICESHARD],[1,:LIGHTSCREEN],[1,:MIMIC],[1,:MISTYTERRAIN],[1,:POUND],
			[1,:PROTECT],[1,:RAPIDSPIN],[1,:RECYCLE],[1,:REFLECT],[1,:ROLEPLAY],
			[1,:SAFEGUARD],[12,:CONFUSION],[16,:ALLYSWITCH],[20,:ICYWIND],[24,:DOUBLEKICK],
			[28,:PSYBEAM],[32,:HYPNOSIS],[36,:MIRRORCOAT],[40,:SUCKERPUNCH],[44,:FREEZEDRY],
			[48,:PSYCHIC],[52,:TEETERDANCE]],
		:EggMoves => [:CONFUSERAY,:FAKEOUT,:POWERSPLIT,:TICKLE],
		:compatiblemoves => [:ALLYSWITCH,:AVALANCHE,:BATONPASS,:BLIZZARD,:BODYSLAM,:BRICKBREAK,
			:CALMMIND,:CHARGEBEAM,:CHARM,:COVET,:DAZZLINGGLEAM,:DRAINPUNCH,:DREAMEATER,
			:ENCORE,:ENERGYBALL,:EXPANDINGFORCE,:FAKEOUT,:FLASH,:FLING,:FOCUSBLAST,:FOCUSPUNCH,
			:FOULPLAY,:FUTURESIGHT,:GIGAIMPACT,:GRASSKNOT,:GUARDSWAP,:HAIL,:HEADBUTT,:HELPINGHAND,
			:HYPERBEAM,:HYPNOSIS,:ICEBEAM,:ICEPUNCH,:ICICLESPEAR,:ICYWIND,:INFESTATION,:IRONDEFENSE,
			:LIGHTSCREEN,:MAGICCOAT,:MAGICROOM,:MEGAKICK,:MEGAPUNCH,:METRONOME,:MISTYTERRAIN,
			:MUDSLAP,:NASTYPLOT,:PAYBACK,:POWERSWAP,:PSYCHIC,:PSYCHICTERRAIN,:PSYCHUP,:PSYSHOCK,
			:RAINDANCE,:RECYCLE,:REFLECT,:ROLEPLAY,:SAFEGUARD,:SCREECH,:SHADOWBALL,:SHOCKWAVE,
			:SIGNALBEAM,:SKILLSWAP,:SNATCH,:SOLARBEAM,:STOMPINGTANTRUM,:STOREDPOWER,:SUCKERPUNCH,
			:SUNNYDAY,:TAUNT,:TELEKINESIS,:THIEF,:THUNDER,:THUNDERBOLT,:THUNDERWAVE,:TORMENT,:TRICK,
			:TRICKROOM,:TRIPLEAXEL,:UPROAR,:WONDERROOM,:ZENHEADBUTT],
		:moveexceptions => [],
		:GetEvo => [[:MRRIME,:Level,42]]		# [Mr Rime, Level, 42]
	}
},

:ARCEUS => {
	:FormName => {
		0 => "Normal",
		1 => "Fighting",
		2 => "Flying",
		3 => "Poison",
		4 => "Ground",
		5 => "Rock",
		6 => "Bug",
		7 => "Ghost",
		8 => "Steel",
		9 => "???",
		10 => "Fire",
		11 => "Water",
		12 => "Grass",
		13 => "Electric",
		14 => "Psychic",
		15 => "Ice",
		16 => "Dragon",
		17 => "Dark",
		18 => "Fairy"
	}
},

:SILVALLY => {
	:FormName => {
		0 => "Normal",
		1 => "Fighting",
		2 => "Flying",
		3 => "Poison",
		4 => "Ground",
		5 => "Rock",
		6 => "Bug",
		7 => "Ghost",
		8 => "Steel",
		9 => "???",
		10 => "Fire",
		11 => "Water",
		12 => "Grass",
		13 => "Electric",
		14 => "Psychic",
		15 => "Ice",
		16 => "Dragon",
		17 => "Dark",
		18 => "Fairy",
	}
},

:MIMIKYU => {
	:FormName => {
		0 => "Disguised",
		1 => "Busted",
	}
}
}
for form in FormCopy
	$PokemonForms[form[1]] = $PokemonForms[form[0]].clone
end

#for form in 0...$cache.Formdat[:MINIOR][:FormName].keys.length
#	$cache.pkmn[:MINIOR][$PokemonForms[:MINIOR][form]] = $PokemonForms[:MINIOR]["Core"]
#end
