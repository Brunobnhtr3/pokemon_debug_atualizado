FIELDEFFECTS = {
:INDOOR => {
	:name => "",
	:fieldMessage => [
		""
	],
	:graphic => ["Indoor","CelliaCentral","CelliaNorth","CelliaSouth","CelliaEast","SootGrass","Sewers","IndoorA","IndoorB","IndoorC","City","CityNew","Manor"],
	:secretPower => "TRIATTACK",
	:naturePower => :TRIATTACK,
	:mimicry => :NORMAL,
	:damageMods => { #damage modifiers for specific moves, written as multipliers (e.g. 1.5 => [:TACKLE])
	},				# a damage mod of 0 denotes the move failing on this field
	:accuracyMods => { #accuracy chance for specific moves, written as percent chance to hit (e.g. 80 => [:TOXIC])
	},				# a accuracy mod of 0 denotes the move always hitting on this field
	:moveMessages => {	# the field message displayed when using a move (written as "message" => [move1,move2....] )
	},
	:typeMods => {	# secondary types applied to moves (written as "type" => [move1,move2,....])
	},
	:typeAddOns => { # secondary types applied to entire types (written as SecondaryTypeSymbol => [typesymbol1,typesymbol2,...])
	},
	:moveEffects => { # arbitrary commands that are evaled after a move executes but before fieldchanges are checked
	},	#evaled in "fieldEffectAfterMove" method in the battle class
	:typeBoosts => { # damage multipliers applied to all moves of a specific type (e.g. 1.3 => [:FIRE,:WATER])
	},
	:typeMessages => {	# field message shown when using a move of the denoted type ("message" => [type1,type2,....])
	},
	:typeCondition => {	# conditions for the type boost written as a string of conditions that are evaled later
	},	#evaled as a function on the move class
	:typeEffects => { # arbitrary commands attached to all moves of a type that are evaled after a move executes but before fieldchanges are checked
	},	#evaled in "fieldEffectAfterMove" method in the battle class
	:changeCondition => { # conditions for a field change written as a string of conditions that are evaled later
	},	#evaled as a function on the move class
	:fieldChange => {  # moves that change this field to a different field (Fieldsymbol => [move1,move2,....])
	},
	:dontChangeBackup => [],	#list of moves which store the current field as backup when changing the field
	:changeMessage => {	# message displayed when changing a field to a different one ("message" => [move1,move2,....])
	},
	:statusMods => [],	#list of non-damaging moves boosted by the field in different ways, for field highlighting
	:changeEffects => {#additional effects that happen when specific moves change a field (such as corrisive mist explosion)
	},	#evaled in "fieldEffectAfterMove" method in the battle class
	:seed => {		# the seed effects on this field
		:seedtype => nil,	# which seed is activated
		:effect => nil,		# which battler effect is being changed if any
		:duration => nil,	# duration of the extra effect
		:message => nil,	# message shown with the seeds boost
		:animation => nil,	# animation associated with the effect
		:stats => {			# statchanges caused by the seed
		},
	},
},
:ELECTERRAIN => {
	:name => "Electric Terrain",
	:fieldMessage => [
		"The field is hyper-charged!"
	],
	:graphic => ["Electric","Visinite","ForestVisinite"],
	:secretPower => "SHOCKWAVE",
	:naturePower => :THUNDERBOLT,
	:mimicry => :ELECTRIC,
	:damageMods => {
		1.5 => [:EXPLOSION, :SELFDESTRUCT, :HURRICANE, :SURF, :SMACKDOWN, :MUDDYWATER, :THOUSANDARROWS],
		2.0 => [:MAGNETBOMB],
	},
	:accuracyMods => {
	},
	:moveMessages => {
		"The explosion became hyper-charged!" => [:EXPLOSION, :SELFDESTRUCT],
		"The attack became hyper-charged!" => [:HURRICANE, :SURF, :SMACKDOWN, :MUDDYWATER, :THOUSANDARROWS],
		"The attack powered up!" => [:MAGNETBOMB],
	},
	:typeMods => {
		:ELECTRIC => [:EXPLOSION, :SELFDESTRUCT, :SMACKDOWN, :SURF, :MUDDYWATER, :HURRICANE, :THOUSANDARROWS, :HYDROVORTEX],
	},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:ELECTRIC],
	},
	:typeMessages => {
		"The Electric Terrain strengthened the attack!" => [:ELECTRIC],
	},
	:typeCondition => {
		:ELECTRIC => "!attacker.isAirborne?",
	},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:INDOOR => [:MUDSPORT, :TECTONICRAGE],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The hyper-charged terrain shorted out!" => [:MUDSPORT, :TECTONICRAGE],
	},
	:statusMods => [:CHARGE, :EERIEIMPULSE, :MAGNETRISE, :ELECTRIFY],
	:changeEffects => {},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => :Charge,
		:duration => 2,
		:message => "{1} began charging power!",
		:animation => :CHARGE,
		:stats => {
			PBStats::SPEED => 1,
		},
	},
},
:GRASSY => {
	:name => "Grassy Terrain",
	:fieldMessage => [
		"The field is in full bloom."
	],
	:graphic => ["Grassy"],
	:secretPower => "SEEDBOMB",
	:naturePower => :ENERGYBALL,
	:mimicry => :GRASS,
	:damageMods => {
		1.5 => [:FAIRYWIND, :SILVERWIND, :OMINOUSWIND, :ICYWIND, :RAZORWIND, :GUST, :TWISTER, :GRASSKNOT],
		0.5 => [:MUDDYWATER, :SURF, :EARTHQUAKE, :MAGNITUDE, :BULLDOZE],
	},
	:accuracyMods => {
		80 => [:GRASSWHISTLE],
	},
	:moveMessages => {
		"The wind picked up strength from the field!" => [:FAIRYWIND, :SILVERWIND, :OMINOUSWIND, :ICYWIND, :RAZORWIND, :GUST, :TWISTER],
		"The grass strengthened the attack!" => [:GRASSKNOT],
		"The grass softened the attack..." => [:MUDDYWATER, :SURF, :EARTHQUAKE, :MAGNITUDE, :BULLDOZE],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:GRASS, :FIRE],
	},
	:typeMessages => {
		"The Grassy Terrain strengthened the attack!" => [:GRASS],
		"The grass below caught flame!" => [:FIRE],
	},
	:typeCondition => {
		:GRASS => "!attacker.isAirborne?",
		:FIRE => "!opponent.isAirborne?",
	},
	:typeEffects => {},
	:changeCondition => {
		:BURNING => "ignitecheck",
	},
	:fieldChange => {
		:BURNING => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE],
		:CORROSIVE => [:SLUDGEWAVE, :ACIDDOWNPOUR],
	},
	:dontChangeBackup => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE, :SLUDGEWAVE, :ACIDDOWNPOUR],
	:changeMessage => {
		 "The grassy terrain caught fire!" => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE],
		 "The grassy terrain was corroded!" => [:SLUDGEWAVE, :ACIDDOWNPOUR],
	},
	:statusMods => [:COIL, :GROWTH, :FLORALHEALING, :SYNTHESIS, :WORRYSEED, :INGRAIN, :GRASSWHISTLE, :LEECHSEED],
	:changeEffects => {},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => :Ingrain,
		:duration => true,
		:message => "{1} planted its roots!",
		:animation => :INGRAIN,
		:stats => {
			PBStats::DEFENSE => 1,
		},
	},
},
:MISTY => {
	:name => "Misty Terrain",
	:fieldMessage => [
		"Mist settles on the field."
	],
	:graphic => ["Misty"],
	:secretPower => "MISTBALL",
	:naturePower => :MISTBALL,
	:mimicry => :FAIRY,
	:damageMods => {
		1.5 => [:FAIRYWIND, :MYSTICALFIRE, :MOONBLAST, :MAGICALLEAF, :DOOMDUMMY, :ICYWIND, :MISTBALL, :AURASPHERE, :STEAMERUPTION, :DAZZLINGGLEAM, :SILVERWIND, :MOONGEISTBEAM],
		0.5 => [:DARKPULSE, :SHADOWBALL, :NIGHTDAZE],
		0 => [:SELFDESTRUCT, :EXPLOSION, :MINDBLOWN],
	},
	:accuracyMods => {
		100 => [:SWEETKISS],
	},
	:moveMessages => {
		"The mist's energy strengthened the attack!" => [:FAIRYWIND, :MYSTICALFIRE, :MOONBLAST, :MAGICALLEAF, :DOOMDUMMY, :ICYWIND, :MISTBALL, :AURASPHERE, :STEAMERUPTION, :DAZZLINGGLEAM, :SILVERWIND, :MOONGEISTBEAM],
		"The mist softened the attack..." => [:DARKPULSE, :SHADOWBALL, :NIGHTDAZE],
		"The dampness prevents the explosion!" => [:SELFDESTRUCT, :EXPLOSION, :MINDBLOWN],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {
		"@battle.field.counter += 1" => [:CLEARSMOG, :SMOG],
		"@battle.field.counter = 2" => [:ACIDDOWNPOUR],
	},
	:typeBoosts => {
		1.5 => [:FAIRY],
		0.5 => [:DRAGON],
	},
	:typeMessages => {
		"The Misty Terrain strengthened the attack!" => [:FAIRY],
		"The Misty Terrain weakened the attack!" => [:DRAGON],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {
		:CORROSIVEMIST => "@battle.field.counter > 1",
	},
	:fieldChange => {
		:INDOOR => [:WHIRLWIND, :GUST, :RAZORWIND, :DEFOG, :HURRICANE, :TWISTER, :TAILWIND, :SUPERSONICSKYSTRIKE],
		:CORROSIVEMIST => [:CLEARSMOG, :SMOG, :ACIDDOWNPOUR]
	},
	:dontChangeBackup => [:CLEARSMOG, :SMOG, :ACIDDOWNPOUR],
	:changeMessage => {
		 "The mist was blown away!" => [:WHIRLWIND, :GUST, :RAZORWIND, :DEFOG, :HURRICANE, :TWISTER, :TAILWIND, :SUPERSONICSKYSTRIKE],
		 "The mist was corroded!" => [:CLEARSMOG, :SMOG, :ACIDDOWNPOUR],
	},
	:statusMods => [:COSMICPOWER, :AROMATICMIST, :SWEETSCENT, :WISH, :AQUARING],
	:changeEffects => {},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => :Wish,
		:duration => 2,
		:message => "A wish was made for {1}!",
		:animation => :WISH,
		:stats => {
			PBStats::SPDEF => 1,
		},
	},
},
:CHESS => {
	:name => "Chess Board",
	:fieldMessage => [
		"Opening variation set."
	],
	:graphic => ["Chess"],
	:secretPower => "FEINT",
	:naturePower => :ANCIENTPOWER,
	:mimicry => :PSYCHIC,
	:damageMods => {
		1.5 => [:FEINT, :FEINTATTACK, :FAKEOUT, :SUCKERPUNCH, :FIRSTIMPRESSION, :SHADOWSNEAK, :SMARTSTRIKE, :STRENGTH, :ANCIENTPOWER, :PSYCHIC, :CONTINENTALCRUSH, :SECRETPOWER, :SHATTEREDPSYCHE],
		2.0 => [:BARRAGE],
	},
	:accuracyMods => {},
	:moveMessages => {
		"En passant!" => [:FEINT, :FEINTATTACK, :FAKEOUT, :SUCKERPUNCH, :FIRSTIMPRESSION, :SHADOWSNEAK, :SMARTSTRIKE],
	},
	:typeMods => {
		:ROCK => [:STRENGTH, :ANCIENTPOWER, :PSYCHIC, :BARRAGE, :SECRETPOWER, :SHATTEREDPSYCHE],
	},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {},
	:typeMessages => {},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:INDOOR => [:STOMPINGTANTRUM, :TECTONICRAGE],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The board was destroyed!" => [:STOMPINGTANTRUM, :TECTONICRAGE],
	},
	:statusMods => [:CALMMIND, :NASTYPLOT, :TRICKROOM, :NORETREAT, :KINGSSHIELD, :OBSTRUCT, :KINESIS, :TELEKINESIS],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => :MagicCoat,
		:duration => true,
		:message => "{1} shrouded itself with Magic Coat!",
		:animation => :MAGICCOAT,
		:stats => {
			PBStats::SPATK => 1,
		},
	},
},
:BURNING => {
	:name => "Burning Field",
	:fieldMessage => [
		"The field is ablaze!"
	],
	:graphic => ["Burning"],
	:secretPower => "FLAMETHROWER",
	:naturePower => :FLAMETHROWER,
	:mimicry => :FIRE,
	:damageMods => {
		1.5 => [:SMOG, :CLEARSMOG],
		2.0 => [:SMACKDOWN, :THOUSANDARROWS],
	},
	:accuracyMods => {
		100 => [:WILLOWISP],
	},
	:moveMessages => {
		"The flames spread from the attack!" => [:SMOG, :CLEARSMOG],
		"{1} was knocked into the flames!" => [:SMACKDOWN, :THOUSANDARROWS],
	},
	:typeMods => {
		:FIRE => [:SMACKDOWN, :SMOG, :CLEARSMOG, :THOUSANDARROWS],
	},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:FIRE],
		0.5 => [:GRASS, :ICE],
	},
	:typeMessages => {
		"The blaze amplified the attack!" => [:FIRE],
		"The blaze softened the attack..." => [:GRASS, :ICE],
	},
	:typeCondition => {
		:FIRE => "!attacker.isAirborne?",
		:GRASS => "!opponent.isAirborne?",
	},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:INDOOR => [:WHIRLWIND, :GUST, :RAZORWIND, :DEFOG, :HURRICANE, :TWISTER, :TAILWIND, :SUPERSONICSKYSTRIKE, :WATERSPORT, :SURF, :MUDDYWATER, :WATERSPOUT, :WATERPLEDGE, :SPARKLINGARIA, :SLUDGEWAVE, :SANDTOMB, :CONTINENTALCRUSH, :HYDROVORTEX, :OCEANICOPERETTA],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The grime snuffed out the flame!" => [:SLUDGEWAVE],
		 "The wind snuffed out the flame!" => [:WHIRLWIND, :GUST, :RAZORWIND, :DEFOG, :HURRICANE, :TWISTER, :TAILWIND, :SUPERSONICSKYSTRIKE],
		 "The water snuffed out the flame!" => [:WATERSPORT, :SURF, :MUDDYWATER, :WATERSPOUT, :WATERPLEDGE, :SPARKLINGARIA, :HYDROVORTEX, :OCEANICOPERETTA],
		 "The sand snuffed out the flame!" => [:SANDTOMB, :CONTINENTALCRUSH],
	},
	:statusMods => [:WILLOWISP, :SMOKESCREEN],
	:changeEffects => {},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => :MultiTurnAttack,
		:duration => :FIRESPIN,
		:message => "{1} was trapped in the vortex!",
		:animation => :FIRESPIN,
		:stats => {
			PBStats::ATTACK => 1,
			PBStats::SPATK => 1,
			PBStats::SPEED => 1,
		},
	},
},
:SWAMP => {
	:name => "Swamp Field",
	:fieldMessage => [
		"The field is swamped."
	],
	:graphic => ["Swamp"],
	:secretPower => "MUDDYWATER",
	:naturePower => :MUDDYWATER,
	:mimicry => :WATER,
	:damageMods => {
		1.5 => [:MUDBOMB, :MUDSHOT, :MUDSLAP, :MUDDYWATER, :SURF, :SLUDGEWAVE, :GUNKSHOT, :BRINE, :SMACKDOWN, :THOUSANDARROWS, :HYDROVORTEX],
		0.25 => [:EARTHQUAKE, :MAGNITUDE, :BULLDOZE],
		0 => [:SELFDESTRUCT, :EXPLOSION, :MINDBLOWN],
	},
	:accuracyMods => {
		100 => [:SLEEPPOWDER],
	},
	:moveMessages => {
		"The murk strengthened the attack!" => [:MUDBOMB, :MUDSHOT, :MUDSLAP, :MUDDYWATER, :SURF, :SLUDGEWAVE, :GUNKSHOT, :BRINE, :SMACKDOWN, :THOUSANDARROWS, :HYDROVORTEX],
		"The attack dissipated in the soggy ground..." => [:EARTHQUAKE, :MAGNITUDE, :BULLDOZE],
		"The dampness prevents the explosion!" => [:SELFDESTRUCT, :EXPLOSION, :MINDBLOWN],
	},
	:typeMods => {
		:WATER => [:SMACKDOWN, :THOUSANDARROWS],
	},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:POISON],
	},
	:typeMessages => {
		"The poison infected the nearby murk!" => [:POISON],
	},
	:typeCondition => {
		:POISON => "!opponent.isAirborne?",
	},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {},
	:dontChangeBackup => [],
	:changeMessage => {},
	:statusMods => [:SLEEPPOWDER, :AQUARING, :STRENGTHSAP],
	:changeEffects => {},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => :Ingrain,
		:duration => true,
		:message => "{1} planted its roots!",
		:animation => :INGRAIN,
		:stats => {
			PBStats::DEFENSE => 1,
			PBStats::SPDEF => 1,
		},
	},
},
:RAINBOW => {
	:name => "Rainbow Field",
	:fieldMessage => [
		"What does it mean?"
	],
	:graphic => ["Rainbow"],
	:secretPower => "AURORABEAM",
	:naturePower => :AURORABEAM,
	:mimicry => :DRAGON,
	:damageMods => {
		1.5 => [:SILVERWIND, :MYSTICALFIRE, :DRAGONPULSE, :TRIATTACK, :SACREDFIRE, :FIREPLEDGE, :WATERPLEDGE, :GRASSPLEDGE, :AURORABEAM, :JUDGMENT, :RELICSONG, :HIDDENPOWER, :SECRETPOWER, :WEATHERBALL, :MISTBALL, :HEARTSTAMP, :MOONBLAST, :ZENHEADBUTT, :SPARKLINGARIA, :FLEURCANNON, :PRISMATICLASER, :TWINKLETACKLE, :OCEANICOPERETTA, :SOLARBEAM, :SOLARBLADE, :DAZZLINGGLEAM, :HIDDENPOWERNOR, :HIDDENPOWERFIR, :HIDDENPOWERFIG, :HIDDENPOWERWAT, :HIDDENPOWERFLY, :HIDDENPOWERGRA, :HIDDENPOWERPOI, :HIDDENPOWERELE, :HIDDENPOWERGRO, :HIDDENPOWERPSY, :HIDDENPOWERROC, :HIDDENPOWERICE, :HIDDENPOWERBUG, :HIDDENPOWERDRA, :HIDDENPOWERGHO, :HIDDENPOWERDAR, :HIDDENPOWERSTE, :HIDDENPOWERFAI],
		0.5 => [:DARKPULSE, :SHADOWBALL, :NIGHTDAZE, :NEVERENDINGNIGHTMARE],
		0 => [:NIGHTMARE]
	},
	:accuracyMods => {},
	:moveMessages => {
		"The attack was rainbow-charged!" => [:SILVERWIND, :MYSTICALFIRE, :DRAGONPULSE, :TRIATTACK, :SACREDFIRE, :FIREPLEDGE, :WATERPLEDGE, :GRASSPLEDGE, :AURORABEAM, :JUDGMENT, :RELICSONG, :HIDDENPOWER, :SECRETPOWER, :WEATHERBALL, :MISTBALL, :HEARTSTAMP, :MOONBLAST, :ZENHEADBUTT, :SPARKLINGARIA, :FLEURCANNON, :PRISMATICLASER, :TWINKLETACKLE, :OCEANICOPERETTA, :SOLARBEAM, :SOLARBLADE, :DAZZLINGGLEAM, :HIDDENPOWERNOR, :HIDDENPOWERFIR, :HIDDENPOWERFIG, :HIDDENPOWERWAT, :HIDDENPOWERFLY, :HIDDENPOWERGRA, :HIDDENPOWERPOI, :HIDDENPOWERELE, :HIDDENPOWERGRO, :HIDDENPOWERPSY, :HIDDENPOWERROC, :HIDDENPOWERICE, :HIDDENPOWERBUG, :HIDDENPOWERDRA, :HIDDENPOWERGHO, :HIDDENPOWERDAR, :HIDDENPOWERSTE, :HIDDENPOWERFAI],
		"The rainbow softened the attack..." => [:DARKPULSE, :SHADOWBALL, :NIGHTDAZE, :NEVERENDINGNIGHTMARE],
		"The rainbow ensures good dreams." => [:NIGHTMARE]
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:NORMAL],
	},
	:typeMessages => {
		"The rainbow energized the attack!" => [:NORMAL],
	},
	:typeCondition => {
		:NORMAL => "self.pbIsSpecial?(type)",
	},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:INDOOR => [:LIGHTTHATBURNSTHESKY],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The rainbow was consumed!" => [:LIGHTTHATBURNSTHESKY],
	},
	:statusMods => [:COSMICPOWER, :MEDITATE, :WISH, :LIFEDEW, :AURORAVEIL],
	:changeEffects => {},
	:seed => {
		:seedtype => :MAGICALSEED,
		:effect => :Wish,
		:duration => 2,
		:message => "A wish was made for {1}!",
		:animation => :WISH,
		:stats => {
			PBStats::SPATK => 1,
		},
	},
},
:CORROSIVE => {
	:name => "Corrosive Field",
	:fieldMessage => [
		"The field is corrupted!"
	],
	:graphic => ["Corrosive"],
	:secretPower => "ACID",
	:naturePower => :ACIDSPRAY,
	:mimicry => :POISON,
	:damageMods => {
		1.5 => [:SMACKDOWN, :MUDSLAP, :MUDSHOT, :MUDBOMB, :MUDDYWATER, :WHIRLPOOL, :THOUSANDARROWS, :APPLEACID],
		2.0 => [:ACID, :ACIDSPRAY, :GRASSKNOT, :SNAPTRAP],
	},
	:accuracyMods => {
		100 => [:POISONPOWDER, :SLEEPPOWDER, :STUNSPORE, :TOXIC],
	},
	:moveMessages => {
		"The corrosion strengthened the attack!" => [:SMACKDOWN, :MUDSLAP, :MUDSHOT, :MUDBOMB, :MUDDYWATER, :WHIRLPOOL, :THOUSANDARROWS, :APPLEACID, :ACID, :ACIDSPRAY, :GRASSKNOT, :SNAPTRAP],
	},
	:typeMods => {
		:POISON => [:SMACKDOWN, :MUDSLAP, :MUDSHOT, :MUDDYWATER, :WHIRLPOOL, :MUDBOMB, :THOUSANDARROWS, :APPLEACID],
	},
	:typeAddOns => {
		:POISON => [:GRASS],
	},
	:moveEffects => {},
	:typeBoosts => {},
	:typeMessages => {},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:GRASSY => [:SEEDFLARE, :PURIFY],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The polluted field was purified!" => [:SEEDFLARE, :PURIFY],
	},
	:statusMods => [:ACIDARMOR, :POISONPOWDER, :SLEEPPOWDER, :STUNSPORE, :TOXIC, :VENOMDRENCH],
	:changeEffects => {},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => :BanefulBunker,
		:duration => true,
		:message => "The Telluric Seed shielded {1} against damage!",
		:animation => :BANEFULBUNKER,
		:stats => {
		},
	},
},
:CORROSIVEMIST => {
	:name => "Corrosive Mist Field",
	:fieldMessage => [
		"Corrosive mist settles on the field!"
	],
	:graphic => ["CorrosiveMist"],
	:secretPower => "ACIDSPRAY",
	:naturePower => :VENOSHOCK,
	:mimicry => :POISON,
	:damageMods => {
		1.5 => [:BUBBLEBEAM, :ACIDSPRAY, :BUBBLE, :SMOG, :CLEARSMOG, :SPARKLINGARIA],
	},
	:accuracyMods => {
		100 => [:TOXIC],
	},
	:moveMessages => {
		"The poison strengthened the attack!" => [:BUBBLEBEAM, :ACIDSPRAY, :BUBBLE, :SMOG, :CLEARSMOG, :SPARKLINGARIA, :APPLEACID],
	},
	:typeMods => {
		:POISON => [:BUBBLE, :BUBBLEBEAM, :ENERGYBALL, :SPARKLINGARIA, :APPLEACID],
	},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:FIRE],
	},
	:typeMessages => {
		"The toxic mist caught flame!" => [:FIRE],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:INDOOR => [:WHIRLWIND, :GUST, :RAZORWIND, :DEFOG, :HURRICANE, :TWISTER, :TAILWIND, :SUPERSONICSKYSTRIKE, :HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE, :SELFDESTRUCT, :EXPLOSION, :SEEDFLARE],
		:CORROSIVE => [:GRAVITY],
	},
	:dontChangeBackup => [:GRAVITY],
	:changeMessage => {
		 "The mist was blown away!" => [:WHIRLWIND, :GUST, :RAZORWIND, :DEFOG, :HURRICANE, :TWISTER, :TAILWIND, :SUPERSONICSKYSTRIKE],
		 "The polluted mist was purified!" => [:SEEDFLARE],
		 "The toxic mist collected on the ground!" => [:GRAVITY],
	},
	:statusMods => [:ACIDARMOR, :SMOKESCREEN, :VENOMDRENCH, :TOXIC],
	:changeEffects => {
		"@battle.mistExplosion" => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE, :SELFDESTRUCT, :EXPLOSION],
	},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => 0,
		:duration => 0,
		:message => "{1} was badly poisoned!",
		:animation => 0,
		:stats => {
			PBStats::ATTACK => 1,
			PBStats::SPATK => 1,
		},
	},
},
:DESERT => {
	:name => "Desert Field",
	:fieldMessage => [
		"The field is rife with sand."
	],
	:graphic => ["Desert"],
	:secretPower => "SANDTOMB",
	:naturePower => :SANDTOMB,
	:mimicry => :GROUND,
	:damageMods => {
		1.5 => [:NEEDLEARM, :PINMISSILE, :DIG, :SANDTOMB, :HEATWAVE, :THOUSANDWAVES, :BURNUP, :SEARINGSUNRAZESMASH, :SOLARBLADE, :SOLARBEAM],
		0 => [:SOAK, :AQUARING],
	},
	:accuracyMods => {},
	:moveMessages => {
		"The desert strengthened the attack!" => [:NEEDLEARM, :PINMISSILE, :DIG, :SANDTOMB, :HEATWAVE, :THOUSANDWAVES, :BURNUP, :SEARINGSUNRAZESMASH, :SOLARBLADE, :SOLARBEAM],
		"The desert is too dry..." => [:SOAK, :AQUARING],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		0.5 => [:WATER, :ELECTRIC],
	},
	:typeMessages => {
		"The desert softened the attack..." => [:WATER, :ELECTRIC],
	},
	:typeCondition => {
		:WATER => "!attacker.isAirborne?",
		:ELECTRIC => "!opponent.isAirborne?",
	},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {},
	:dontChangeBackup => [],
	:changeMessage => {},
	:statusMods => [:SANDSTORM, :SUNNYDAY, :SANDATTACK, :SHOREUP],
	:changeEffects => {},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => :MultiTurnAttack,
		:duration => :SANDTOMB,
		:message => "{1} was trapped by Sand Tomb!",
		:animation => :SANDTOMB,
		:stats => {
			PBStats::DEFENSE => 1,
			PBStats::SPDEF => 1,
			PBStats::SPEED => 1,
		},
	},
},
:ICY => {
	:name => "Icy Field",
	:fieldMessage => [
		"The field is covered in ice."
	],
	:graphic => ["Icy"],
	:secretPower => "ICESHARD",
	:naturePower => :ICEBEAM,
	:mimicry => :ICE,
	:damageMods => {
		0.5 => [:SCALD, :STEAMERUPTION],
	},
	:accuracyMods => {},
	:moveMessages => {
		"The cold softened the attack..." => [:SCALD, :STEAMERUPTION],
	},
	:typeMods => {},
	:typeAddOns => {
		:ICE => [:ROCK],
	},
	:moveEffects => {
		"@battle.iceSpikes" => [:EARTHQUAKE, :BULLDOZE, :MAGNITUDE, :FISSURE, :TECTONICRAGE],
		"@battle.field.counter += 1" => [:SCALD, :STEAMERUPTION],
		"@battle.field.counter = 2" => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE],
	},
	:typeBoosts => {
		1.5 => [:ICE],
		0.5 => [:FIRE],
	},
	:typeMessages => {
		"The cold strengthened the attack!" => [:ICE],
		"The cold softened the attack..." => [:FIRE],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {
		:INDOOR => "[:WATERSURFACE,:MURKWATERSURFACE].include?(@battle.field.backup)",
		:WATERSURFACE => "@battle.field.counter > 1",
	},
	:fieldChange => {
		:WATERSURFACE => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE, :SCALD, :STEAMERUPTION],
		:INDOOR => [:EARTHQUAKE, :BULLDOZE, :MAGNITUDE, :FISSURE, :TECTONICRAGE],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The ice melted away!" => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE],
		 "The quake broke up the ice and revealed the water beneath!" => [:EARTHQUAKE, :BULLDOZE, :MAGNITUDE, :FISSURE, :TECTONICRAGE],
		 "The hot water melted the ice!" => [:SCALD, :STEAMERUPTION],
	},
	:statusMods => [:HAIL, :AURORAVEIL],
	:changeEffects => {},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => 0,
		:duration => 0,
		:message => "{1} was hurt by icy Spikes!",
		:animation => 0,
		:stats => {
			PBStats::SPEED => 2,
		},
	},
},
:ROCKY => {
	:name => "Rocky Field",
	:fieldMessage => [
		"The field is littered with rocks."
	],
	:graphic => ["Rocky"],
	:secretPower => "ROCKTHROW",
	:naturePower => :ROCKSMASH,
	:mimicry => :ROCK,
	:damageMods => {
		1.5 => [:ROCKCLIMB, :STRENGTH, :MAGNITUDE, :EARTHQUAKE, :BULLDOZE, :ACCELEROCK],
		2.0 => [:ROCKSMASH],
	},
	:accuracyMods => {},
	:moveMessages => {
		"The rocks strengthened the attack!" => [:ROCKCLIMB, :STRENGTH, :MAGNITUDE, :EARTHQUAKE, :BULLDOZE, :ACCELEROCK],
		"SMASH'D!" => [:ROCKSMASH],
	},
	:typeMods => {
		:ROCK => [:ROCKCLIMB, :EARTHQUAKE, :MAGNITUDE, :STRENGTH, :BULLDOZE],
	},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:ROCK],
	},
	:typeMessages => {
		"The field strengthened the attack!" => [:ROCK],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {},
	:dontChangeBackup => [],
	:changeMessage => {},
	:statusMods => [:ROCKPOLISH, :SANDSTORM, :STEALTHROCK],
	:changeEffects => {},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => 0,
		:duration => 0,
		:message => "{1} was hurt by Stealth Rocks!",
		:animation => 0,
		:stats => {
			PBStats::DEFENSE => 1,
		},
	},
},
:FOREST => {
	:name => "Forest Field",
	:fieldMessage => [
		"The field is abound with trees."
	],
	:graphic => ["Forest"],
	:secretPower => "WOODHAMMER",
	:naturePower => :WOODHAMMER,
	:mimicry => :GRASS,
	:damageMods => {
		0.5 => [:SURF, :MUDDYWATER],
		1.5 => [:ATTACKORDER, :ELECTROWEB,:CUT],
	},
	:accuracyMods => {},
	:moveMessages => {
		"The forest softened the attack..." => [:SURF, :MUDDYWATER],
		"They're coming out of the woodwork!" => [:ATTACKORDER],
		"Gossamer and arbor strengthened the attack!" => [:ELECTROWEB],
		"A tree slammed down!" => [:CUT],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:BUG, :GRASS],
	},
	:typeMessages => {
		"The field strengthened the attack!" => [:BUG],
		"The forestry strengthened the attack!" => [:GRASS],
	},
	:typeCondition => {
		:BUG => "self.pbIsSpecial?(type)",
	},
	:typeEffects => {},
	:changeCondition => {
		:BURNING => "ignitecheck",
	},
	:fieldChange => {
		:BURNING => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE],
	},
	:dontChangeBackup => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE],
	:changeMessage => {
		 "The forest caught fire!" => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE],
	},
		:statusMods => [:STICKYWEB, :DEFENDORDER, :GROWTH, :STRENGTHSAP, :HEALORDER, :NATURESMADNESS, :FORESTSCURSE],
	:changeEffects => {},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => :SpikyShield,
		:duration => true,
		:message => "The Telluric Seed shielded {1} against damage!",
		:animation => :SPIKYSHIELD,
		:stats => {
		},
	},
},
:SUPERHEATED => {
	:name => "Super-Heated Field",
	:fieldMessage => [
		"The field is super-heated!"
	],
	:graphic => ["Superheated"],
	:secretPower => "FLAMEBURST",
	:naturePower => :HEATWAVE,
	:mimicry => :FIRE,
	:damageMods => {
			0.625 => [:SURF, :MUDDYWATER, :WATERPLEDGE, :WATERSPOUT, :SPARKLINGARIA, :HYDROVORTEX, :OCEANICOPERETTA],
			1.5 => [:SCALD, :STEAMERUPTION],
	},
	:accuracyMods => {},
	:moveMessages => {
		"The field super-heated the attack!" => [:SCALD, :STEAMERUPTION],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {
		"@battle.fieldAccuracyDrop" => [:SURF, :MUDDYWATER, :WATERPLEDGE, :WATERSPOUT, :SPARKLINGARIA, :OCEANICOPERETTA, :HYDROVORTEX],
	},
	:typeBoosts => {
		0.5 => [:ICE],
		0.9 => [:WATER],
		1.1 => [:FIRE],
	},
	:typeMessages => {
		"The extreme heat softened the attack..." => [:ICE, :WATER],
		"The attack was super-heated!" => [:FIRE],
	},
	:typeCondition => {
		:WATER => "self.move!=:SCALD && self.move!=:STEAMERUPTION",
	},
	:typeEffects => {},
	:changeCondition => {
		:BURNING => "ignitecheck",
	},
	:fieldChange => {
		:BURNING => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE, :SELFDESTRUCT, :EXPLOSION],
		:INDOOR => [:BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
	},
	:dontChangeBackup => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE, :SELFDESTRUCT, :EXPLOSION],
	:changeMessage => {
		 "The field combusted!" => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE, :SELFDESTRUCT, :EXPLOSION],
		 "The field cooled off!" => [:BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
	},
	:statusMods => [],
	:changeEffects => {},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => :ShellTrap,
		:duration => true,
		:message => "{1} primed a trap!",
		:animation => :SHELLTRAP,
		:stats => {
			PBStats::DEFENSE => 1,
		},
	},
},
:FACTORY => {
	:name => "Factory Field",
	:fieldMessage => [
		"Machines whir in the background."
	],
	:graphic => ["Factory"],
	:secretPower => "MAGNETBOMB",
	:naturePower => :GEARGRIND,
	:mimicry => :STEEL,
	:damageMods => {
		1.5 => [:STEAMROLLER, :TECHNOBLAST],
		2.0 => [:FLASHCANNON, :GYROBALL, :MAGNETBOMB, :GEARGRIND, :DOUBLEIRONBASH],
	},
	:accuracyMods => {},
	:moveMessages => {
		"ATTACK SEQUENCE UPDATE." => [:STEAMROLLER, :TECHNOBLAST],
		"ATTACK SEQUENCE INITIATE." => [:FLASHCANNON, :GYROBALL, :MAGNETBOMB, :GEARGRIND, :DOUBLEIRONBASH],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:ELECTRIC],
	},
	:typeMessages => {
		"The attack took energy from the field!" => [:ELECTRIC],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:SHORTCIRCUIT => [:EARTHQUAKE, :BULLDOZE, :MAGNITUDE, :FISSURE, :TECTONICRAGE, :SELFDESTRUCT, :EXPLOSION, :LIGHTTHATBURNSTHESKY],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The field was broken!" => [:EARTHQUAKE, :BULLDOZE, :MAGNITUDE, :FISSURE, :TECTONICRAGE, :SELFDESTRUCT, :EXPLOSION],
		 "All the light was consumed!" => [:LIGHTTHATBURNSTHESKY],
		 "The field shorted out!" => [:AURAWHEEL, :IONDELUGE, :GIGAVOLTHAVOC],
	},
	:statusMods => [:AUTOTOMIZE, :IRONDEFENSE, :METALSOUND, :SHIFTGEAR, :MAGNETRISE, :GEARUP, :MAGNETRISE],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => :LaserFocus,
		:duration => 1,
		:message => "{1} is focused!",
		:animation => :LASERFOCUS,
		:stats => {
			PBStats::SPATK => 1,
		},
	},
},
:SHORTCIRCUIT => {
	:name => "Short-Circuit Field",
	:fieldMessage => [
		"Bzzt!"
	],
	:graphic => ["Shortcircuit"],
	:secretPower => "ELECTROBALL",
	:naturePower => :DISCHARGE,
	:mimicry => :ELECTRIC,
	:damageMods => {
		1.667 => [:STEELBEAM],
		1.5 => [:DAZZLINGGLEAM, :SURF, :MUDDYWATER, :MAGNETBOMB, :GYROBALL, :FLASHCANNON, :GEARGRIND, :HYDROVORTEX],
		1.3 => [:DARKPULSE, :NIGHTDAZE, :NIGHTSLASH, :SHADOWBALL, :SHADOWPUNCH, :SHADOWCLAW, :SHADOWSNEAK, :SHADOWFORCE, :SHADOWBONE, :PHANTOMFORCE],
		0.5 => [:LIGHTTHATBURNSTHESKY],
	},
	:accuracyMods => {
		80 => [:ZAPCANNON],
	},
	:moveMessages => {
		"Blinding!" => [:DAZZLINGGLEAM, :FLASHCANNON],
		"The attack picked up electricity!" => [:SURF, :MUDDYWATER, :MAGNETBOMB, :GYROBALL, :GEARGRIND, :HYDROVORTEX],
		"The darkness strengthened the attack!" => [:DARKPULSE, :NIGHTDAZE, :NIGHTSLASH, :SHADOWBALL, :SHADOWPUNCH, :SHADOWCLAW, :SHADOWSNEAK, :SHADOWFORCE, :SHADOWBONE, :PHANTOMFORCE],
		"{1} couldn't consume much light..." => [:LIGHTTHATBURNSTHESKY],
	},
	:typeMods => {
		:ELECTRIC => [:SURF, :MUDDYWATER, :MAGNETBOMB, :GYROBALL, :FLASHCANNON, :GEARGRIND, :STEELBEAM],
	},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {},
	:typeMessages => {},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:FACTORY => [:AURAWHEEL, :PARABOLICCHARGE, :WILDCHARGE, :CHARGEBEAM, :IONDELUGE, :GIGAVOLTHAVOC],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "SYSTEM ONLINE." => [:AURAWHEEL, :PARABOLICCHARGE, :WILDCHARGE, :CHARGEBEAM, :IONDELUGE, :GIGAVOLTHAVOC],
	},
	:statusMods => [:FLASH, :METALSOUND, :MAGNETRISE],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => :MagnetRise,
		:duration => 5,
		:message => "{1} levitated with electromagnetism!",
		:animation => :MAGNETRISE,
		:stats => {
			PBStats::SPDEF => 1,
		},
	},
},
:WASTELAND => {
	:name => "Wasteland",
	:fieldMessage => [
		"The waste is watching..."
	],
	:graphic => ["Wasteland"],
	:secretPower => "GUNKSHOT",
	:naturePower => :GUNKSHOT,
	:mimicry => :POISON,
	:damageMods => {
		1.5 => [:VINEWHIP, :POWERWHIP, :MUDSLAP, :MUDBOMB, :MUDSHOT],
		0.25 => [:EARTHQUAKE, :MAGNITUDE, :BULLDOZE],
		2.0 => [:SPITUP],
		1.2 => [:OCTAZOOKA, :SLUDGE, :GUNKSHOT, :SLUDGEWAVE, :SLUDGEBOMB],
	},
	:accuracyMods => {},
	:moveMessages => {
		"The waste did it for the vine!" => [:VINEWHIP, :POWERWHIP],
		"The waste was added to the attack!" => [:MUDSLAP, :MUDBOMB, :MUDSHOT],
		"Wibble-wibble wobble-wobb..." => [:EARTHQUAKE, :MAGNITUDE, :BULLDOZE],
		"BLEAAARGGGGH!" => [:SPITUP],
		"The waste joined the attack!" => [:OCTAZOOKA, :SLUDGE, :GUNKSHOT, :SLUDGEWAVE, :SLUDGEBOMB, :ACIDDOWNPOUR],
	},
	:typeMods => {
		:POISON => [:MUDBOMB, :MUDSLAP, :MUDSHOT],
	},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {},
	:typeMessages => {},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {},
	:dontChangeBackup => [],
	:changeMessage => {},
	:statusMods => [:SWALLOW, :STEALTHROCK, :SPIKES, :TOXICSPIKES, :STICKYWEB],
	:changeEffects => {},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => 0,
		:duration => 0,
		:message => "",
		:animation => 0,
		:stats => {
			PBStats::ATTACK => 1,
			PBStats::SPATK => 1,
		},
	},
},
:ASHENBEACH => {
	:name => "Ashen Beach",
	:fieldMessage => [
		"Ash and sand line the field."
	],
	:graphic => ["AshenBeach"],
	:secretPower => "MUDSHOT",
	:naturePower => :MEDITATE,
	:mimicry => :GROUND,
	:damageMods => {
		1.5 => [:HIDDENPOWER, :STRENGTH, :LANDSWRATH, :THOUSANDWAVES, :SURF, :MUDDYWATER, :CLANGOROUSSOULBLAZE, :HIDDENPOWERNOR, :HIDDENPOWERFIR, :HIDDENPOWERFIG, :HIDDENPOWERWAT, :HIDDENPOWERFLY, :HIDDENPOWERGRA, :HIDDENPOWERPOI, :HIDDENPOWERELE, :HIDDENPOWERGRO, :HIDDENPOWERPSY, :HIDDENPOWERROC, :HIDDENPOWERICE, :HIDDENPOWERBUG, :HIDDENPOWERDRA, :HIDDENPOWERGHO, :HIDDENPOWERDAR, :HIDDENPOWERSTE, :HIDDENPOWERFAI],
		2.0 => [:MUDSLAP, :MUDSHOT, :MUDBOMB, :SANDTOMB],
		1.3 => [:STOREDPOWER, :ZENHEADBUTT, :FOCUSBLAST, :AURASPHERE],
		1.2 => [:PSYCHIC],
	},
	:accuracyMods => {
		90 => [:FOCUSBLAST],
	},
	:moveMessages => {
		"...And with pure focus!" => [:HIDDENPOWER, :STRENGTH, :CLANGOROUSSOULBLAZE, :HIDDENPOWERNOR, :HIDDENPOWERFIR, :HIDDENPOWERFIG, :HIDDENPOWERWAT, :HIDDENPOWERFLY, :HIDDENPOWERGRA, :HIDDENPOWERPOI, :HIDDENPOWERELE, :HIDDENPOWERGRO, :HIDDENPOWERPSY, :HIDDENPOWERROC, :HIDDENPOWERICE, :HIDDENPOWERBUG, :HIDDENPOWERDRA, :HIDDENPOWERGHO, :HIDDENPOWERDAR, :HIDDENPOWERSTE, :HIDDENPOWERFAI],
		"The sand strengthened the atttack!" => [:LANDSWRATH, :THOUSANDWAVES],
		"Surf's up!" => [:SURF, :MUDDYWATER],
		"Ash mixed into the attack!" => [:MUDSLAP, :MUDSHOT, :MUDBOMB, :SANDTOMB],
		"...And with full focus...!" => [:STOREDPOWER, :ZENHEADBUTT, :FOCUSBLAST, :AURASPHERE],
		"...And with focus...!" => [:PSYCHIC],
	},
	:typeMods => {
		:PSYCHIC => [:STRENGTH],
	},
	:typeAddOns => {},
	:moveEffects => {
		"@battle.fieldAccuracyDrop" => [:LEAFTORNADO,:FIRESPIN, :TWISTER, :RAZORWIND, :WHIRLPOOL],
	},
	:typeBoosts => {},
	:typeMessages => {},
	:typeCondition => {
		:FLYING => "self.pbIsSpecial?(type)",
	},
	:typeEffects => {
		:FLYING => "@battle.fieldAccuracyDrop",
	},
	:changeCondition => {},
	:fieldChange => {},
	:dontChangeBackup => [],
	:changeMessage => {},
	:statusMods => [:CALMMIND, :KINESIS, :MEDITATE, :SANDATTACK, :SANDSTORM, :PSYCHUP, :FOCUSENERGY, :SHOREUP],
	:changeEffects => {},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => :FocusEnergy,
		:duration => 3,
		:message => "{1}'s Telluric Seed is getting it pumped!",
		:animation => :FOCUSENERGY,
		:stats => {
		},
	},
},
:WATERSURFACE => {
	:name => "Water Surface",
	:fieldMessage => [
		"The water's surface is calm."
	],
	:graphic => ["WaterSurface"],
	:secretPower => "AQUAJET",
	:naturePower => :WHIRLPOOL,
	:mimicry => :WATER,
	:damageMods => {
		1.5 => [:WHIRLPOOL, :SURF, :MUDDYWATER, :WHIRLPOOL, :DIVE, :SLUDGEWAVE, :ORIGINPULSE, :HYDROVORTEX],
		0 => [:SPIKES, :TOXICSPIKES],
	},
	:accuracyMods => {},
	:moveMessages => {
		"The attack rode the current!" => [:WHIRLPOOL, :SURF, :MUDDYWATER, :WHIRLPOOL, :DIVE, :ORIGINPULSE, :HYDROVORTEX],
		"Poison spread through the water!" => [:SLUDGEWAVE],
		"...The spikes sank into the water and vanished!" => [:SPIKES, :TOXICSPIKES],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {
		"@battle.field.counter += 1" => [:SLUDGEWAVE],
		"@battle.field.counter = 2" => [:ACIDDOWNPOUR],
	},
	:typeBoosts => {
		1.5 => [:WATER, :ELECTRIC],
		0.5 => [:FIRE],
		0 => [:GROUND],
	},
	:typeMessages => {
		"The water conducted the attack!" => [:ELECTRIC],
		"The water strengthened the attack!" => [:WATER],
		"The water deluged the attack..." => [:FIRE],
		"...But there was no solid ground to attack from!" => [:GROUND],
	},
	:typeCondition => {
		:FIRE => "!opponent.isAirborne?",
		:ELECTRIC => "!opponent.isAirborne?",
	},
	:typeEffects => {},
	:changeCondition => {
		:MURKWATERSURFACE => "@battle.field.counter > 1",
	},
	:fieldChange => {
		:UNDERWATER => [:GRAVITY, :DIVE, :ANCHORSHOT, :GRAVAPPLE],
		:ICY => [:BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
		:MURKWATERSURFACE => [:SLUDGEWAVE, :ACIDDOWNPOUR],
	},
	:dontChangeBackup => [:BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
	:changeMessage => {
		 "The battle sank into the depths!" => [:GRAVITY, :GRAVAPPLE],
		 "The battle was pulled underwater!" => [:DIVE, :ANCHORSHOT],
		 "The water froze over!" => [:BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
		 "The water was polluted!" => [:SLUDGEWAVE, :ACIDDOWNPOUR],
	},
	:statusMods => [:SPLASH, :AQUARING, :LIFEDEW],
	:changeEffects => {},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => :AquaRing,
		:duration => true,
		:message => "{1} surrounded itself with a veil of water!",
		:animation => :AQUARING,
		:stats => {
			PBStats::SPDEF => 1,
		},
	},
},
:UNDERWATER => {
	:name => "Underwater",
	:fieldMessage => [
		"Blub blub..."
	],
	:graphic => ["Underwater"],
	:secretPower => "AQUATAIL",
	:naturePower => :WATERPULSE,
	:mimicry => :WATER,
	:damageMods => {
		1.5 => [:WATERPULSE],
		2.0 => [:ANCHORSHOT, :DRAGONDARTS],
		0 => [:SUNNYDAY, :HAIL, :SANDSTORM, :RAINDANCE, :TARSHOT],
	},
	:accuracyMods => {},
	:moveMessages => {
		"Jet-streamed!" => [:WATERPULSE],
		"From the depths!" => [:ANCHORSHOT, :DRAGONDARTS],
		"You're too deep to notice the weather!" => [:SUNNYDAY, :HAIL, :SANDSTORM, :RAINDANCE],
		"The tar washed off instantly!" => [:TARSHOT],
	},
	:typeMods => {
		:WATER => [:DRAGONDARTS, :GRAVAPPLE],
	},
	:typeAddOns => {
		:WATER => [:GROUND],
	},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:WATER],
		2.0 => [:ELECTRIC],
		0 => [:FIRE],
	},
	:typeMessages => {
		"The water strengthened the attack!" => [:WATER],
		"The water super-conducted the attack!" => [:ELECTRIC],
		"...But the attack was doused instantly!" => [:FIRE],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:WATERSURFACE => [:DIVE, :SKYDROP, :FLY, :BOUNCE],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The battle resurfaced!" => [:DIVE, :SKYDROP, :FLY, :BOUNCE, :SHOREUP],

	},
	:statusMods => [:AQUARING],
	:changeEffects => {},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => 0,
		:duration => 0,
		:message => "{1} transformed into the Water type!",
		:animation => :SOAK,
		:stats => {
			PBStats::SPEED => 1,
		},
	},
},
:CAVE => {
	:name => "Cave",
	:fieldMessage => [
		"The cave echoes dully..."
	],
	:graphic => ["Cave"],
	:secretPower => "ROCKWRECKER",
	:naturePower => :ROCKTOMB,
	:mimicry => :ROCK,
	:damageMods => {
		1.5 => [:ROCKTOMB],
		0 => [:SKYDROP],
	},
	:accuracyMods => {},
	:moveMessages => {
		"...Piled on!" => [:ROCKTOMB],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {
		"@battle.caveCollapse" => [:EARTHQUAKE, :BULLDOZE, :MAGNITUDE, :FISSURE, :TECTONICRAGE, :CONTINENTALCRUSH],
	},
	:typeBoosts => {
		1.5 => [:ROCK],
		0.5 => [:FLYING],
	},
	:typeMessages => {
		"The cave choked out the air!" => [:FLYING],
		"The cavern strengthened the attack!" => [:ROCK],
	},
	:typeCondition => {
		:FLYING => "!self.contactMove?",
	},
	:typeEffects => {},
	:changeCondition => {
	},
	:fieldChange => {
		:CRYSTALCAVERN => [:POWERGEM, :DIAMONDSTORM],
	},
	:dontChangeBackup => [:POWERGEM, :DIAMONDSTORM],
	:changeMessage => {
		"The cave was littered with crystals!" => [:POWERGEM, :DIAMONDSTORM],
	},
	:statusMods => [:STEALTHROCK],
	:changeEffects => {
	},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => 0,
		:duration => 0,
		:message => "{1} was hurt by Stealth Rocks!",
		:animation => 0,
		:stats => {
			PBStats::DEFENSE => 2,
		},
	},
},
:GLITCH => {
	:name => "Glitch Field",
	:fieldMessage => [
		"1n!taliz3 .b//////attl3"
	],
	:graphic => ["Glitch"],
	:secretPower => "TECHNOBLAST",
	:naturePower => :METRONOME,
	:mimicry => :QMARKS,
	:damageMods => {
		0 => [:ROAR, :WHIRLWIND],
	},
	:accuracyMods => {
		90 => [:BLIZZARD],
	},
	:moveMessages => {
		"ERROR! MOVE NOT FOUND!" => [:ROAR, :WHIRLWIND],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.2 => [:PSYCHIC],
	},
	:typeMessages => {
		".0P pl$ nerf!-//" => [:PSYCHIC],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {},
	:dontChangeBackup => [],
	:changeMessage => {},
	:statusMods => [:METRONOME],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => 0,
		:duration => 0,
		:message => "{1}.TYPE = (:QMARKS)",
		:animation => :AMNESIA,
		:stats => {
			PBStats::DEFENSE => 1,
		},
	},
},
:CRYSTALCAVERN => {
	:name => "Crystal Cavern",
	:fieldMessage => [
		"The cave is littered with crystals."
	],
	:graphic => ["CrystalCavern"],
	:secretPower => "POWERGEM",
	:naturePower => :POWERGEM,
	:mimicry => :QMARKS,
	:damageMods => {
		1.3 => [:AURORABEAM, :SIGNALBEAM, :FLASHCANNON, :DAZZLINGGLEAM, :MIRRORSHOT, :TECHNOBLAST, :DOOMDUMMY, :MOONGEISTBEAM, :PHOTONGEYSER, :MENACINGMOONRAZEMAELSTROM],
		1.5 => [:POWERGEM, :DIAMONDSTORM, :ANCIENTPOWER, :JUDGMENT, :ROCKSMASH, :ROCKTOMB, :STRENGTH, :ROCKCLIMB, :MULTIATTACK, :PRISMATICLASER, :LUSTERPURGE],
	},
	:accuracyMods => {},
	:moveMessages => {
		"The crystals' light strengthened the attack!" => [:AURORABEAM, :SIGNALBEAM, :FLASHCANNON, :LUSTERPURGE, :DAZZLINGGLEAM, :MIRRORSHOT, :TECHNOBLAST, :DOOMDUMMY, :MOONGEISTBEAM, :PHOTONGEYSER, :PRISMATICLASER, :MENACINGMOONRAZEMAELSTROM],
		"The crystals strengthened the attack!" => [:POWERGEM, :DIAMONDSTORM, :ANCIENTPOWER, :JUDGMENT, :ROCKSMASH, :ROCKTOMB, :STRENGTH, :ROCKCLIMB, :MULTIATTACK],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {
		"@battle.field.counter += 1" => [:EARTHQUAKE, :BULLDOZE, :MAGNITUDE, :FISSURE],
		"@battle.field.counter = 2" => [:TECTONICRAGE],
	},
	:typeBoosts => {
		1.5 => [:ROCK, :DRAGON],
	},
	:typeMessages => {
		"The crystals charged the attack!" => [:ROCK],
		"The crystal energy strengthened the attack!" => [:DRAGON],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {
		:CAVE => "@battle.field.counter > 1",
	},
	:fieldChange => {
		:CAVE => [:EARTHQUAKE, :BULLDOZE, :MAGNITUDE, :FISSURE, :TECTONICRAGE],
	},
	:dontChangeBackup => [:EARTHQUAKE, :BULLDOZE, :MAGNITUDE, :FISSURE, :TECTONICRAGE, :DARKPULSE, :DARKVOID, :NIGHTDAZE],
	:changeMessage => {
		 "The crystals were broken up!" => [:EARTHQUAKE, :BULLDOZE, :MAGNITUDE, :FISSURE, :TECTONICRAGE],
		 "The crystals' light was warped by the darkness!" => [:DARKPULSE, :DARKVOID, :NIGHTDAZE],
		 "The crystals' light was consumed!" => [:LIGHTTHATBURNSTHESKY],
	},
	:statusMods => [:ROCKPOLISH, :STEALTHROCK],
	:changeEffects => {},
	:seed => {
		:seedtype => :MAGICALSEED,
		:effect => :MagicCoat,
		:duration => true,
		:message => "{1} shrouded itself with Magic Coat!",
		:animation => :MAGICCOAT,
		:stats => {
			PBStats::SPATK => 1,
		},
	},
},
:MURKWATERSURFACE => {
	:name => "Murkwater Surface",
	:fieldMessage => [
		"The water is tainted..."
	],
	:graphic => ["MurkwaterSurface"],
	:secretPower => "SLUDGEBOMB",
	:naturePower => :SLUDGEWAVE,
	:mimicry => :POISON,
	:damageMods => {
		1.5 => [:MUDBOMB, :MUDSLAP, :MUDSHOT, :SMACKDOWN, :ACID, :ACIDSPRAY, :BRINE, :THOUSANDWAVES, :APPLEACID],
		0 => [:SPIKES, :TOXICSPIKES],
	},
	:accuracyMods => {},
	:moveMessages => {
		"The toxic water strengthened the attack!" => [:MUDBOMB, :MUDSLAP, :MUDSHOT, :SMACKDOWN, :ACID, :ACIDSPRAY, :THOUSANDWAVES, :APPLEACID],
		"Stinging!" => [:BRINE],
		"...The spikes sank into the water and vanished!" => [:SPIKES, :TOXICSPIKES],
	},
	:typeMods => {
		:POISON => [:MUDBOMB, :MUDSLAP, :MUDSHOT, :SMACKDOWN, :THOUSANDWAVES, :APPLEACID],
		:WATER => [:SLUDGEWAVE],
	},
	:typeAddOns => {
		:POISON => [:WATER],
	},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:WATER, :POISON],
		1.3 => [:ELECTRIC],
		0 => [:GROUND],
	},
	:typeMessages => {
		"The toxic water strengthened the attack!" => [:WATER, :POISON],
		"The toxic water conducted the attack!" => [:ELECTRIC],
		"...But there was no solid ground to attack from!" => [:GROUND],
	},
	:typeCondition => {
		:ELECTRIC => "!opponent.isAirborne?",
	},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:WATERSURFACE => [:WHIRLPOOL, :PURIFY],
		:ICY => [:BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
	},
	:dontChangeBackup => [:WHIRLPOOL, :PURIFY, :BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
	:changeMessage => {
		"The maelstrom flushed out the poison!" => [:WHIRLPOOL],
		"The attack cleared the waters!" => [:PURIFY],
		"The toxic water froze over!" => [:BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
	},
	:statusMods => [:ACIDARMOR, :TARSHOT, :VENOMDRENCH],
	:changeEffects => {},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => :AquaRing,
		:duration => true,
		:message => "{1} surrounded itself with a veil of water!",
		:animation => :AQUARING,
		:stats => {
			PBStats::SPEED => 1,
		},
	},
},
:MOUNTAIN => {
	:name => "Mountain",
	:fieldMessage => [
		"High up!",
	],
	:graphic => ["Mountain"],
	:secretPower => "ROCKBLAST",
	:naturePower => :ROCKSLIDE,
	:mimicry => :ROCK,
	:damageMods => {
		1.5 => [:VITALTHROW, :CIRCLETHROW, :STORMTHROW, :OMINOUSWIND, :ICYWIND, :SILVERWIND, :TWISTER, :RAZORWIND, :FAIRYWIND, :THUNDER, :ERUPTION, :AVALANCHE, :HYPERVOICE],
	},
	:accuracyMods => {
		0 => [:THUNDER],
	},
	:moveMessages => {
		"{1} was thrown partway down the mountain!" => [:VITALTHROW, :CIRCLETHROW, :STORMTHROW],
		"The wind strengthened the attack!" => [:OMINOUSWIND, :ICYWIND, :SILVERWIND, :TWISTER, :RAZORWIND, :FAIRYWIND],
		"The mountain strengthened the attack!" => [:THUNDER, :ERUPTION, :AVALANCHE],
		"Yodelayheehoo~" => [:HYPERVOICE],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:ROCK, :FLYING],
	},
	:typeMessages => {
		"The mountain strengthened the attack!" => [:ROCK],
		"The open air strengthened the attack!" => [:FLYING],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:SNOWYMOUNTAIN => [:BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
	},
	:dontChangeBackup => [:BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
	:changeMessage => {
		"The mountain was covered in snow!" => [:BLIZZARD, :GLACIATE, :SUBZEROSLAMMER],
	},
	:statusMods => [:TAILWIND, :SUNNYDAY],
	:changeEffects => {},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => 0,
		:duration => 0,
		:message => "",
		:animation => 0,
		:stats => {
			PBStats::ATTACK => 2,
			PBStats::ACCURACY => -1,
		},
	},
},
:SNOWYMOUNTAIN => {
	:name => "Snowy Mountain",
	:fieldMessage => [
		"The snow glows white on the mountain..."
	],
	:graphic => ["SnowyMountain"],
	:secretPower => "ICEBALL",
	:naturePower => :AVALANCHE,
	:mimicry => :ICE,
	:damageMods => {
		1.5 => [:VITALTHROW, :CIRCLETHROW, :STORMTHROW, :OMINOUSWIND, :SILVERWIND, :TWISTER, :RAZORWIND, :FAIRYWIND, :AVALANCHE, :POWDERSNOW, :HYPERVOICE, :GLACIATE],
		0.5 => [:SCALD, :STEAMERUPTION],
		2.0 => [:ICYWIND],
	},
	:accuracyMods => {
		0 => [:THUNDER],
	},
	:moveMessages => {
		"{1} was thrown partway down the mountain!" => [:VITALTHROW, :CIRCLETHROW, :STORMTHROW],
		"The wind strengthened the attack!" => [:OMINOUSWIND, :SILVERWIND, :TWISTER, :RAZORWIND, :FAIRYWIND],
		"The snow strengthened the attack!" => [:AVALANCHE, :POWDERSNOW],
		"The cold softened the attack..." => [:SCALD, :STEAMERUPTION],
		"The frigid wind strengthened the attack!" => [:ICYWIND],
		"Yodelayheehoo~" => [:HYPERVOICE],
	},
	:typeMods => {},
	:typeAddOns => {
		:ICE => [:ROCK],
	},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:ROCK, :ICE, :FLYING],
		0.5 => [:FIRE],
	},
	:typeMessages => {
		"The snowy mountain strengthened the attack!" => [:ROCK, :ICE],
		"The open air strengthened the attack!" => [:FLYING],
		"The cold softened the attack!" => [:FIRE],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:MOUNTAIN => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		"The snow melted away!" => [:HEATWAVE, :ERUPTION, :SEARINGSHOT, :FLAMEBURST, :LAVAPLUME, :FIREPLEDGE, :MINDBLOWN, :INCINERATE, :INFERNOOVERDRIVE],
	},
	:statusMods => [:TAILWIND, :SUNNYDAY, :HAIL],
	:changeEffects => {},
	:seed => {
		:seedtype => :TELLURICSEED,
		:effect => 0,
		:duration => 0,
		:message => "",
		:animation => 0,
		:stats => {
			PBStats::SPATK => 2,
			PBStats::ACCURACY => -1,
		},
	},
},
:HOLY => {
	:name => "Holy Field",
	:fieldMessage => [
		"Benedictus Sanctus Spiritus..."
	],
	:graphic => ["Holy"],
	:secretPower => "DAZZLINGGLEAM",
	:naturePower => :JUDGMENT,
	:mimicry => :NORMAL,
	:damageMods => {
		1.3 => [:PSYSTRIKE, :AEROBLAST, :ORIGINPULSE, :DOOMDUMMY, :MISTBALL, :CRUSHGRIP, :LUSTERPURGE, :SECRETSWORD, :PSYCHOBOOST, :RELICSONG, :SPACIALREND, :HYPERSPACEHOLE, :ROAROFTIME, :LANDSWRATH, :PRECIPICEBLADES, :DRAGONASCENT, :MOONGEISTBEAM, :SUNSTEELSTRIKE, :PRISMATICLASER, :FLEURCANNON, :DIAMONDSTORM, :GENESISSUPERNOVA, :SEARINGSUNRAZESMASH, :MENACINGMOONRAZEMAELSTROM, :BEHEMOTHBLADE, :BEHEMOTHBASH, :ETERNABEAM, :DYNAMAXCANNON],
		1.5 => [:MYSTICALFIRE, :MAGICALLEAF, :ANCIENTPOWER, :JUDGMENT, :SACREDFIRE, :EXTREMESPEED, :SACREDSWORD, :RETURN],
	},
	:accuracyMods => {},
	:moveMessages => {
		"Legendary power accelerated the attack!" => [:PSYSTRIKE, :AEROBLAST, :SACREDFIRE, :ORIGINPULSE, :DOOMDUMMY, :JUDGMENT, :MISTBALL, :CRUSHGRIP, :LUSTERPURGE, :SECRETSWORD, :PSYCHOBOOST, :RELICSONG, :SPACIALREND, :HYPERSPACEHOLE, :ROAROFTIME, :LANDSWRATH, :PRECIPICEBLADES, :DRAGONASCENT, :MOONGEISTBEAM, :SUNSTEELSTRIKE, :PRISMATICLASER, :FLEURCANNON, :DIAMONDSTORM, :GENESISSUPERNOVA, :SEARINGSUNRAZESMASH, :MENACINGMOONRAZEMAELSTROM, :BEHEMOTHBLADE, :BEHEMOTHBASH, :ETERNABEAM, :DYNAMAXCANNON],
		"The holy energy resonated with the attack!" => [:MYSTICALFIRE, :MAGICALLEAF, :ANCIENTPOWER, :SACREDSWORD, :RETURN],
		"Godspeed!" => [:EXTREMESPEED],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:FAIRY, :NORMAL],
		1.2 => [:PSYCHIC, :DRAGON],
		0.5 => [:GHOST, :DARK],
	},
	:typeMessages => {
		"The holy energy resonated with the attack!" => [:FAIRY, :NORMAL],
		"The legendary energy resonated with the attack!" => [:PSYCHIC, :DRAGON],
		"The attack was cleansed..." => [:GHOST, :DARK],
	},
	:typeCondition => {
		:FAIRY => "self.pbIsSpecial?(type)",
		:NORMAL => "self.pbIsSpecial?(type)",
		:DARK => "self.pbIsSpecial?(type)",
	},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:INDOOR => [:LIGHTTHATBURNSTHESKY],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		"The holy light was consumed!" => [:LIGHTTHATBURNSTHESKY],
	},
	:statusMods => [:LIFEDEW, :WISH, :MIRACLEEYE, :COSMICPOWER, :NATURESMADNESS],
	:changeEffects => {},
	:seed => {
		:seedtype => :MAGICALSEED,
		:effect => :MagicCoat,
		:duration => true,
		:message => "{1} shrouded itself with Magic Coat!",
		:animation => :MAGICCOAT,
		:stats => {
			PBStats::SPATK => 1,
		},
	},
},
:FAIRYTALE => {
	:name => "Fairy Tale Field",
	:fieldMessage => [
		"Once upon a time..."
	],
	:graphic => ["FairyTale"],
	:secretPower => "SLASH",
	:naturePower => :SECRETSWORD,
	:mimicry => :FAIRY,
	:damageMods => {
		1.5 => [:NIGHTSLASH, :LEAFBLADE, :PSYCHOCUT, :SMARTSTRIKE, :AIRSLASH, :SOLARBLADE, :MAGICALLEAF, :MYSTICALFIRE, :ANCIENTPOWER, :RELICSONG, :SPARKLINGARIA, :MOONGEISTBEAM, :FLEURCANNON, :RAZORSHELL, :BEHEMOTHBLADE, :BEHEMOTHBASH, :OCEANICOPERETTA, :MENACINGMOONRAZEMAELSTROM],
		2.0 => [:DRAININGKISS, :MISTBALL],
	},
	:accuracyMods => {},
	:moveMessages => {
		"The blade cuts true!" => [:NIGHTSLASH, :LEAFBLADE, :PSYCHOCUT, :SMARTSTRIKE, :AIRSLASH, :SOLARBLADE, :RAZORSHELL, :BEHEMOTHBLADE],
		"The magical energy strengthened the attack!" => [:MAGICALLEAF, :MYSTICALFIRE, :ANCIENTPOWER, :RELICSONG, :SPARKLINGARIA, :MOONGEISTBEAM, :FLEURCANNON, :BEHEMOTHBASH, :MISTBALL, :OCEANICOPERETTA, :MENACINGMOONRAZEMAELSTROM],
		"True love never hurt so badly!" => [:DRAININGKISS],
	},
	:typeMods => {},
	:typeAddOns => {
		:DRAGON => [:FIRE],
	},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:STEEL, :FAIRY],
		2.0 => [:DRAGON],
	},
	:typeMessages => {
		"For ever after!" => [:FAIRY],
		"For justice!" => [:STEEL],
		"The foul beast's attack gained strength!" => [:DRAGON],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {},
	:dontChangeBackup => [],
	:changeMessage => {},
	:statusMods => [:KINGSSHIELD, :SPIKYSHIELD, :CRAFTYSHIELD, :FLOWERSHIELD, :ACIDARMOR, :NOBLEROAR, :SWORDSDANCE, :WISH, :HEALINGWISH, :MIRACLEEYE, :FORESTSCURSE, :FLORALHEALING],
	:changeEffects => {},
	:seed => {
		:seedtype => :MAGICALSEED,
		:effect => :KingsShield,
		:duration => true,
		:message => "The Magical Seed shielded {1} against damage!",
		:animation => :KINGSSHIELD,
		:stats => {
		},
	},
},
:DRAGONSDEN => {
	:name => "Dragon's Den",
	:fieldMessage => [
		"If you wish to slay a dragon..."
	],
	:graphic => ["DragonsDen"],
	:secretPower => "DRAGONPULSE",
	:naturePower => :DRAGONPULSE,
	:mimicry => :DRAGON,
	:damageMods => {
		1.5 => [:MEGAKICK, :MAGMASTORM, :LAVAPLUME, :EARTHPOWER, :DIAMONDSTORM, :SHELLTRAP, :POWERGEM],             
		2.0 => [:SMACKDOWN, :THOUSANDARROWS, :DRAGONASCENT, :PAYDAY, :MISTBALL, :LUSTERPURGE, :TECTONICRAGE, :CONTINENTALCRUSH],
	},
	:accuracyMods => {
		100 => [:DRAGONRUSH],
	},
	:moveMessages => {
		"Trial of the Dragon!!!" => [:MEGAKICK],
		"The lava strengthened the attack!" => [:MAGMASTORM, :LAVAPLUME, :EARTHPOWER, :SHELLTRAP],
		"{1} was knocked into the lava!" => [:SMACKDOWN, :THOUSANDARROWS],
		"The draconic energy boosted the attack!" => [:DRAGONASCENT, :MISTBALL, :LUSTERPURGE],
		"Sparkling treasure!" => [:PAYDAY, :POWERGEM, :DIAMONDSTORM],
	},
	:typeMods => {
		:FIRE => [:SMACKDOWN, :THOUSANDARROWS, :TECTONICRAGE, :CONTINENTALCRUSH],
	},
	:typeAddOns => {},
	:moveEffects => {
		"@battle.field.counter += 1" => [:MUDDYWATER, :SURF, :SPARKLINGARIA],
		"@battle.field.counter = 2" => [:GLACIATE, :SUBZEROSLAMMER, :OCEANICOPERETTA, :HYDROVORTEX],
	},
	:typeBoosts => {
		1.5 => [:DRAGON, :FIRE],
		1.3 => [:ROCK],
		0.5 => [:ICE, :WATER],
	},
	:typeMessages => {
		"The lava's heat boosted the flame!" => [:FIRE],
		"The draconic energy boosted the attack!" => [:DRAGON],
		"The lava's heat softened the attack..." => [:ICE, :WATER],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {
		:CAVE => "@battle.field.counter > 1",
	},
	:fieldChange => {
		:CAVE => [:MUDDYWATER, :SURF, :SPARKLINGARIA, :GLACIATE, :SUBZEROSLAMMER, :OCEANICOPERETTA, :HYDROVORTEX],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The lava was frozen solid!" => [:GLACIATE, :SUBZEROSLAMMER],
		 "The lava solidified!" => [:MUDDYWATER, :SURF, :SPARKLINGARIA, :OCEANICOPERETTA, :HYDROVORTEX],
	},
	:statusMods => [:DRAGONDANCE, :NOBLEROAR, :COIL, :STEALTHROCK],
	:changeEffects => {},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => :FlashFire,
		:duration => true,
		:message => "{1} raised its Fire power!",
		:animation => 0,
		:stats => {
			PBStats::SPATK => 1,
		},
	},
},
:FLOWERGARDEN1 => {
	:name => "Flower Garden Field",
	:fieldMessage => [
		"Seeds line the field."
	],
	:graphic => ["FlowerGarden0"],
	:secretPower => "SWEETSCENT",
	:naturePower => :GROWTH,
	:mimicry => :GRASS,
	:damageMods => {
	},
	:accuracyMods => {},
	:moveMessages => {
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {},
	:typeMessages => {},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:FLOWERGARDEN2 => [:GROWTH,:FLOWERSHIELD,:RAINDANCE,:SUNNYDAY,:ROTOTILLER,:INGRAIN,:WATERSPORT,:BLOOMDOOM],
	},
	:dontChangeBackup => [:GROWTH,:FLOWERSHIELD,:RAINDANCE,:SUNNYDAY, :ROTOTILLER,:INGRAIN,:WATERSPORT,:BLOOMDOOM],
	:changeMessage => {
		"The garden grew a little!" => [:GROWTH,:FLOWERSHIELD,:RAINDANCE,:SUNNYDAY, :ROTOTILLER,:INGRAIN,:WATERSPORT],
	},
	:statusMods => [:GROWTH, :ROTOTILLER, :RAINDANCE, :WATERSPORT, :SUNNYDAY, :FLOWERSHIELD, :SWEETSCENT, :INGRAIN, :FLORALHEALING],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => :Ingrain,
		:duration => true,
		:message => "{1} planted its roots!",
		:animation => :INGRAIN,
		:stats => {
			PBStats::SPDEF => 1,
		},
	},
},
:FLOWERGARDEN2 => {
	:name => "Flower Garden Field",
	:fieldMessage => [
		"Seeds line the field."
	],
	:graphic => ["FlowerGarden1"],
	:secretPower => "PETALBLIZZARD",
	:naturePower => :GROWTH,
	:mimicry => :GRASS,
	:damageMods => {
		1.5 => [:CUT],
	},
	:accuracyMods => {},
	:moveMessages => {
		"{1} was cut down to size!" => [:CUT],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.1 => [:GRASS],
	},
	:typeMessages => {
		"The garden's power boosted the attack!" => [:GRASS],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:FLOWERGARDEN3 => [:GROWTH,:FLOWERSHIELD,:RAINDANCE,:SUNNYDAY,:ROTOTILLER,:INGRAIN,:WATERSPORT,:BLOOMDOOM],
		:FLOWERGARDEN1 => [:CUT,:XSCISSOR,:ACIDDOWNPOUR],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		"The garden was cut down a bit!" => [:CUT,:XSCISSOR],
		"The garden grew a little!" => [:GROWTH,:FLOWERSHIELD,:RAINDANCE,:SUNNYDAY, :ROTOTILLER,:INGRAIN,:WATERSPORT],
		"The acid melted the bloom!" => [:ACIDDOWNPOUR],
	},
	:statusMods => [:GROWTH, :ROTOTILLER, :RAINDANCE, :WATERSPORT, :SUNNYDAY, :FLOWERSHIELD, :SWEETSCENT, :INGRAIN, :FLORALHEALING],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => :Ingrain,
		:duration => true,
		:message => "{1} planted its roots!",
		:animation => :INGRAIN,
		:stats => {
			PBStats::SPDEF => 1,
		},
	},
},
:FLOWERGARDEN3 => {
	:name => "Flower Garden Field",
	:fieldMessage => [
		"Seeds line the field."
	],
	:graphic => ["FlowerGarden2"],
	:secretPower => "PETALBLIZZARD",
	:naturePower => :GROWTH,
	:mimicry => :GRASS,
	:damageMods => {
		1.5 => [:CUT],
		1.2 => [:PETALBLIZZARD,:PETALDANCE,:FLEURCANNON],
	},
	:accuracyMods => {
		85 => [:SLEEPPOWDER, :STUNSPORE, :POISONPOWDER],
	},
	:moveMessages => {
		"{1} was cut down to size!" => [:CUT],
		"The fresh scent of flowers boosted the attack!" => [:PETALBLIZZARD,:PETALDANCE,:FLEURCANNON],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:FIRE,:BUG],
		1.3 => [:GRASS],
	},
	:typeMessages => {
		"The budding flowers boosted the attack!" => [:GRASS],
		"The attack infested the garden!" => [:BUG],
		"The nearby flowers caught flame!" => [:FIRE],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {
		:BURNING => "state.effects[:WaterSport] <= 0 && pbWeather != :RAINDANCE",
	},
	:fieldChange => {
		:FLOWERGARDEN4 => [:GROWTH,:FLOWERSHIELD,:RAINDANCE,:SUNNYDAY,:ROTOTILLER,:INGRAIN,:WATERSPORT,:BLOOMDOOM],
		:FLOWERGARDEN2 => [:CUT,:XSCISSOR],
		:FLOWERGARDEN1 => [:ACIDDOWNPOUR],
		:BURNING => [:HEATWAVE,:ERUPTION,:SEARINGSHOT,:FLAMEBURST,:LAVAPLUME,:FIREPLEDGE,:MINDBLOWN,:INCINERATE,:INFERNOOVERDRIVE],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		"The garden caught fire!" => [:HEATWAVE,:ERUPTION,:SEARINGSHOT,:FLAMEBURST,:LAVAPLUME,:FIREPLEDGE,:MINDBLOWN,:INCINERATE,:INFERNOOVERDRIVE],
		"The garden was cut down a bit!" => [:CUT,:XSCISSOR],
		"The garden grew a little!" => [:GROWTH,:FLOWERSHIELD,:RAINDANCE,:SUNNYDAY, :ROTOTILLER,:INGRAIN,:WATERSPORT],
		"The acid melted the bloom!" => [:ACIDDOWNPOUR],
	},
	:statusMods => [:GROWTH, :ROTOTILLER, :RAINDANCE, :WATERSPORT, :SUNNYDAY, :FLOWERSHIELD, :SWEETSCENT, :INGRAIN, :FLORALHEALING],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => :Ingrain,
		:duration => true,
		:message => "{1} planted its roots!",
		:animation => :INGRAIN,
		:stats => {
			PBStats::SPDEF => 1,
		},
	},
},
:FLOWERGARDEN4 => {
	:name => "Flower Garden Field",
	:fieldMessage => [
		"Seeds line the field."
	],
	:graphic => ["FlowerGarden3"],
	:secretPower => "PETALBLIZZARD",
	:naturePower => :GROWTH,
	:mimicry => :GRASS,
	:damageMods => {
		1.5 => [:CUT,:PETALBLIZZARD,:PETALDANCE,:FLEURCANNON],
	},
	:accuracyMods => {
		85 => [:SLEEPPOWDER, :STUNSPORE, :POISONPOWDER],
	},
	:moveMessages => {
		"{1} was cut down to size!" => [:CUT],
		"The vibrant aroma scent of flowers boosted the attack!" => [:PETALBLIZZARD,:PETALDANCE,:FLEURCANNON],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		2.0 => [:BUG],
		1.5 => [:FIRE,:GRASS],
	},
	:typeMessages => {
		"The blooming flowers boosted the attack!" => [:GRASS],
		"The attack infested the flowers!" => [:BUG],
		"The nearby flowers caught flame!" => [:FIRE],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {
		:BURNING => "state.effects[:WaterSport] <= 0 && pbWeather != :RAINDANCE",
	},
	:fieldChange => {
		:FLOWERGARDEN5 => [:GROWTH,:FLOWERSHIELD,:RAINDANCE,:SUNNYDAY,:ROTOTILLER,:INGRAIN,:WATERSPORT,:BLOOMDOOM],
		:FLOWERGARDEN3 => [:CUT,:XSCISSOR],
		:FLOWERGARDEN1 => [:ACIDDOWNPOUR],
		:BURNING => [:HEATWAVE,:ERUPTION,:SEARINGSHOT,:FLAMEBURST,:LAVAPLUME,:FIREPLEDGE,:MINDBLOWN,:INCINERATE,:INFERNOOVERDRIVE],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		"The garden caught fire!" => [:HEATWAVE,:ERUPTION,:SEARINGSHOT,:FLAMEBURST,:LAVAPLUME,:FIREPLEDGE,:MINDBLOWN,:INCINERATE,:INFERNOOVERDRIVE],
		"The garden was cut down a bit!" => [:CUT,:XSCISSOR],
		"The garden grew a little!" => [:GROWTH,:FLOWERSHIELD,:RAINDANCE,:SUNNYDAY, :ROTOTILLER,:INGRAIN,:WATERSPORT],
		"The acid melted the bloom!" => [:ACIDDOWNPOUR],
	},
	:statusMods => [:GROWTH, :ROTOTILLER, :RAINDANCE, :WATERSPORT, :SUNNYDAY, :FLOWERSHIELD, :SWEETSCENT, :INGRAIN, :FLORALHEALING],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => :Ingrain,
		:duration => true,
		:message => "{1} planted its roots!",
		:animation => :INGRAIN,
		:stats => {
			PBStats::SPDEF => 1,
		},
	},
},
:FLOWERGARDEN5 => {
	:name => "Flower Garden Field",
	:fieldMessage => [
		"Seeds line the field."
	],
	:graphic => ["FlowerGarden4"],
	:secretPower => "PETALDANCE",
	:naturePower => :PETALBLIZZARD,
	:mimicry => :GRASS,
	:damageMods => {
		1.5 => [:CUT,:PETALBLIZZARD,:PETALDANCE,:FLEURCANNON],
	},
	:accuracyMods => {
		85 => [:SLEEPPOWDER, :STUNSPORE, :POISONPOWDER],
	},
	:moveMessages => {
		"{1} was cut down to size!" => [:CUT],
		"The vibrant aroma scent of flowers boosted the attack!" => [:PETALBLIZZARD,:PETALDANCE,:FLEURCANNON],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		2.0 => [:GRASS,:BUG],
		1.5 => [:FIRE],
	},
	:typeMessages => {
		"The thriving flowers boosted the attack!" => [:GRASS],
		"The attack infested the flowers!" => [:BUG],
		"The nearby flowers caught flame!" => [:FIRE],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {
		:BURNING => "state.effects[:WaterSport] <= 0 && pbWeather != :RAINDANCE",
	},
	:fieldChange => {
		:FLOWERGARDEN4 => [:CUT,:XSCISSOR],
		:FLOWERGARDEN1 => [:ACIDDOWNPOUR],
		:BURNING => [:HEATWAVE,:ERUPTION,:SEARINGSHOT,:FLAMEBURST,:LAVAPLUME,:FIREPLEDGE,:MINDBLOWN,:INCINERATE,:INFERNOOVERDRIVE],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		"The garden caught fire!" => [:HEATWAVE,:ERUPTION,:SEARINGSHOT,:FLAMEBURST,:LAVAPLUME,:FIREPLEDGE,:MINDBLOWN,:INCINERATE,:INFERNOOVERDRIVE],
		"The garden was cut down a bit!" => [:CUT,:XSCISSOR],
		"The acid melted the bloom!" => [:ACIDDOWNPOUR],
	},
	:statusMods => [:GROWTH, :ROTOTILLER, :RAINDANCE, :WATERSPORT, :SUNNYDAY, :FLOWERSHIELD, :SWEETSCENT, :INGRAIN, :FLORALHEALING],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => :Ingrain,
		:duration => true,
		:message => "{1} planted its roots!",
		:animation => :INGRAIN,
		:stats => {
			PBStats::SPDEF => 1,
		},
	},
},
:STARLIGHT => {
	:name => "Starlight Arena",
	:fieldMessage => [
		"Starlight fills the battlefield."
	],
	:graphic => ["Starlight"],
	:secretPower => "SWIFT",
	:naturePower => :MOONBLAST,
	:mimicry => :DARK,
	:damageMods => {
		1.5 => [:AURORABEAM, :SIGNALBEAM, :FLASHCANNON, :LUSTERPURGE, :DAZZLINGGLEAM, :MIRRORSHOT, :TECHNOBLAST, :SOLARBEAM, :PHOTONGEYSER, :MOONBLAST, :PRISMATICLASER],
		2.0 => [:DRACOMETEOR, :METEORMASH, :COMETPUNCH, :SPACIALREND, :SWIFT, :HYPERSPACEHOLE, :HYPERSPACEFURY, :MOONGEISTBEAM, :SUNSTEELSTRIKE, :METEORASSAULT, :BLACKHOLEECLIPSE, :SEARINGSUNRAZESMASH, :MENACINGMOONRAZEMAELSTROM, :LIGHTTHATBURNSTHESKY],
		4.0 => [:DOOMDUMMY],
	},
	:accuracyMods => {},
	:moveMessages => {
		"Starlight surged through the attack!" => [:AURORABEAM, :SIGNALBEAM, :FLASHCANNON, :LUSTERPURGE, :DAZZLINGGLEAM, :MIRRORSHOT, :TECHNOBLAST, :SOLARBEAM, :PHOTONGEYSER, :PRISMATICLASER, :LIGHTTHATBURNSTHESKY],
		"Lunar energy surged through the attack!" => [:MOONBLAST],
		"The astral energy boosted the attack!" => [:DRACOMETEOR, :METEORMASH, :COMETPUNCH, :SPACIALREND, :SWIFT, :HYPERSPACEFURY, :MOONGEISTBEAM, :SUNSTEELSTRIKE, :METEORASSAULT, :BLACKHOLEECLIPSE, :SEARINGSUNRAZESMASH, :MENACINGMOONRAZEMAELSTROM],
		"The astral vortex accelerated the attack!" => [:HYPERSPACEHOLE],
		"A star came crashing down!" => [:DOOMDUMMY],
	},
	:typeMods => {
		:FIRE => [:DOOMDUMMY],
		:FAIRY => [:SOLARBEAM, :SOLARBLADE],
	},
	:typeAddOns => {
		:FAIRY => [:DARK],
	},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:DARK, :PSYCHIC],
		1.3 => [:FAIRY],
	},
	:typeMessages => {
		"Starlight supercharged the attack!" => [:FAIRY],
		"The night sky boosted the attack!" => [:DARK],
		"The astral energy boosted the attack!" => [:PSYCHIC],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:INDOOR => [:LIGHTTHATBURNSTHESKY],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The cosmic light was consumed!" => [:LIGHTTHATBURNSTHESKY],
	},
	:statusMods => [:AURORAVEIL, :COSMICPOWER, :FLASH, :WISH, :HEALINGWISH, :LUNARDANCE, :MOONLIGHT, :TRICKROOM, :MAGICROOM, :WONDERROOM],
	:changeEffects => {},
	:seed => {
		:seedtype => :MAGICALSEED,
		:effect => :Wish,
		:duration => 2,
		:message => "A wish was made for {1}!",
		:animation => :WISH,
		:stats => {
			PBStats::SPATK => 1,
		},
	},
},
:INVERSE => {
	:name => "Inverse Field",
	:fieldMessage => [
		"!trats elttaB"
	],
	:graphic => ["Inverse"],
	:secretPower => "CONFUSION",
	:naturePower => :TRICKROOM,
	:mimicry => :NORMAL,
	:damageMods => {
	},
	:accuracyMods => {},
	:moveMessages => {
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {},
	:typeMessages => {},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
	},
	:dontChangeBackup => [],
	:changeMessage => {
	},
	:statusMods => [],
	:changeEffects => {},
	:seed => {
		:seedtype => :MAGICALSEED,
		:effect => :HyperBeam,
		:duration => 1,
		:message => "{1} must recharge!",
		:animation => 0,
		:stats => {
			PBStats::ATTACK => 1,
			PBStats::DEFENSE => 1,
			PBStats::SPEED => 1,
			PBStats::SPATK => 1,
			PBStats::SPDEF => 1,
		},
	},
},
:PSYTERRAIN => {
	:name => "Psychic Terrain",
	:fieldMessage => [
		"The field became mysterious!"
	],
	:graphic => ["Psychic"],
	:secretPower => "PSYCHIC",
	:naturePower => :PSYCHIC,
	:mimicry => :PSYCHIC,
	:damageMods => {
		1.5 => [:HEX, :MAGICALLEAF, :MYSTICALFIRE, :MOONBLAST, :AURASPHERE, :MINDBLOWN],
	},
	:accuracyMods => {
		90 => [:HYPNOSIS],
	},
	:moveMessages => {
		"The psychic energy strengthened the attack!" => [:HEX, :MAGICALLEAF, :MYSTICALFIRE, :MOONBLAST, :AURASPHERE, :MINDBLOWN],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.5 => [:PSYCHIC],
	},
	:typeMessages => {
		"The Psychic Terrain strengthened the attack!" => [:PSYCHIC],
	},
	:typeCondition => {
		:ELECTRIC => "!attacker.isAirborne?",
	},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
	},
	:dontChangeBackup => [],
	:changeMessage => {
	},
	:statusMods => [:CALMMIND, :COSMICPOWER, :KINESIS, :MEDITATE, :NASTYPLOT, :HYPNOSIS, :PSYCHUP, :MINDREADER, :MIRACLEEYE, :TELEKINESIS, :GRAVITY, :MAGICROOM, :TRICKROOM, :WONDERROOM],
	:changeEffects => {},
	:seed => {
		:seedtype => :MAGICALSEED,
		:effect => 0,
		:duration => 0,
		:message => "{1} became confused!",
		:animation => 0,
		:stats => {
			PBStats::SPATK => 2,
		},
	},
},
:CLOUDS => {
	:name => "Cloud Field",
	:fieldMessage => [
		"Cloudy with a chance of battle!"
	],
	:graphic => ["Clouds"],
	:secretPower => "BOUNCE",
	:naturePower => :HURRICANE,
	:mimicry => :FLYING,
	:damageMods => {
		1.2 => [:ICYWIND, :OMINOUSWIND, :SILVERWIND, :RAZORWIND, :FAIRYWIND, :STEELWING, :TWISTER],
		0 => [:EARTHPOWER, :BULLDOZE, :ROTOTILLER, :STICKYWEB, :SPIKES, :TOXICSPIKES, :DIG, :MAGNITUDE, :EARTHQUAKE, :FISSURE],
	},
	:accuracyMods => {
		100 => [:BOUNCE, :FLY, :THUNDER, :HURRICANE]
	},
	:moveMessages => {
		"The altitude intensified the wind!" => [:ICYWIND, :OMINOUSWIND, :SILVERWIND, :RAZORWIND, :FAIRYWIND, :STEELWING, :TWISTER],
		"But there is no solid ground!" => [:EARTHPOWER, :BULLDOZE, :ROTOTILLER, :DIG, :MAGNITUDE, :EARTHQUAKE, :FISSURE],
		"...The web fell through the clouds!" => [:STICKYWEB],
		"...The spikes fell through the clouds!" => [:SPIKES, :TOXICSPIKES],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.3 => [:FLYING],
		0.75 => [:ROCK],
		0.9 => [:ELECTRIC]
	},
	:typeMessages => {
		"Pierce the heavens!" => [:FLYING],
		"The rocks fell through the clouds..." => [:ROCK],
		"The clouds absorbed part of the lightning..." => [:ELECTRIC]
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {},
	:dontChangeBackup => [],
	:changeMessage => {},
	:statusMods => [],
	:changeEffects => {},
	:seed => {
		:seedtype => :ELEMENTALSEED,
		:effect => :Protect,
		:duration => true,
		:message => "The Elemental Seed shielded {1} against damage!",
		:animation => :PROTECT,
		:stats => {}
	},
},
:CROWD =>{
	:name => "Crowd Field",
	:fieldMessage => [
		"A crowd of spectators gathers!"
	],
	:graphic => ["Crowd"],
	:secretPower => "ROCK SMASH",
	:naturePower => :BRICKBREAK,
	:mimicry => :FIGHTING,
	:damageMods => {
		1.2 => [:BODYSLAM, :COMETPUNCH, :DIZZYPUNCH, :DOUBLEHIT, :DOUBLEEDGE, :GIGAIMPACT, :HEADBUTT,
		:MEGAKICK, :MEGAPUNCH, :STRENGTH, :SKULLBASH, :SLAM, :HEADSMASH, :BEATUP, :BRUTALSWING, :KNOCKOFF, :PUNISHMENT,
		:SUCKERPUNCH, :THUNDERPUNCH, :ICEPUNCH, :FIREPUNCH, :SHADOWPUNCH, :HEAVYSLAM, :IRONHEAD, :METEORMASH, :STEELWING, :ZENHEADBUTT,
		:ACROBATICS, :BLAZEKICK, :TROPKICK, :BODYPRESS, :BRAVEBIRD, :AERIALACE, :TRIPLEAXEL, :BREAKNECKBLITZ, :PLAYROUGH, :SPIRITBREAK],
	},
	:accuracyMods => {},
	:moveMessages => {
		"A brawl is surely brewing!" => [:BODYSLAM, :COMETPUNCH, :DIZZYPUNCH, :DOUBLEHIT, :DOUBLEEDGE, :GIGAIMPACT, :HEADBUTT,
		:MEGAKICK, :MEGAPUNCH, :STRENGTH, :SKULLBASH, :SLAM, :HEADSMASH, :BEATUP, :BRUTALSWING, :KNOCKOFF, :PUNISHMENT,
		:SUCKERPUNCH, :THUNDERPUNCH, :ICEPUNCH, :FIREPUNCH, :SHADOWPUNCH, :HEAVYSLAM, :IRONHEAD, :METEORMASH, :STEELWING, :ZENHEADBUTT,
		:ACROBATICS, :BLAZEKICK, :TROPKICK, :BODYPRESS, :BRAVEBIRD, :AERIALACE, :TRIPLEAXEL, :BREAKNECKBLITZ, :PLAYROUGH, :SPIRITBREAK],

	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {
		"user.cheer" => [:BODYSLAM, :COMETPUNCH, :DIZZYPUNCH, :DOUBLEHIT, :DOUBLEEDGE, :GIGAIMPACT, :HEADBUTT,
	:MEGAKICK, :MEGAPUNCH, :STRENGTH, :SKULLBASH, :SLAM, :HEADSMASH, :BEATUP, :BRUTALSWING, :KNOCKOFF, :PUNISHMENT,
	:SUCKERPUNCH, :THUNDERPUNCH, :ICEPUNCH, :FIREPUNCH, :SHADOWPUNCH, :HEAVYSLAM, :IRONHEAD, :METEORMASH, :STEELWING, :ZENHEADBUTT,
	:ACROBATICS, :BLAZEKICK, :TROPKICK, :BODYPRESS, :BRAVEBIRD, :AERIALACE, :TRIPLEAXEL, :BREAKNECKBLITZ, :PLAYROUGH, :SPIRITBREAK],},
	:typeBoosts => {
		1.3 => [:FIGHTING],
		0.8 => [:PSYCHIC],
	},
	:typeMessages => {
		"Finishing Move!" => [:FIGHTING],
		"\"Get your tricks outta here!\"" => [:PSYCHIC]
	},
	:typeCondition => {
		:PSYCHIC => "self.pbIsSpecial?(type)",
		:FIGHTING => "self.basedamage>0"
	},
	:typeEffects => {
		:PSYCHIC => "user.boo",
		:FIGHTING => "user.cheer",
	},
	:changeCondition => {},
	:fieldChange => {},
	:dontChangeBackup => [],
	:changeMessage => {},
	:statusMods => [],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => nil,
		:duration => nil,
		:message => "{1} is zeroing in on the target!",
		:animation => :HELPINGHAND,
		:stats => {}
	},
},
:DARKNESS1 => {
	:name => "Darkness Field",
	:fieldMessage => [
		"A shroud of darkness, however slight, gently envelops the field..."
	],
	:graphic => ["Darkness1"],
	:secretPower => "CRUNCH",
	:naturePower => :DARKPULSE,
	:mimicry => :DARK,
	:damageMods => {
		1.1 => [:DARKPULSE, :NIGHTDAZE,:NIGHTSLASH, :FALSESURRENDER, :SHADOWBALL, :SHADOWBONE, 
		:SHADOWBONE, :SHADOWCLAW, :SHADOWFORCE, :SHADOWSNEAK, :SHADOWPUNCH, :PHANTOMFORCE, 
		:SPIRITSHACKLE, :OMINOUSWIND, :SUCKERPUNCH, :THROATCHOP, :BLACKHOLEECLIPSE, :NEVERENDINGNIGHTMARE, :MOONGEISTBEAM, :ASTRALBARRAGE,
		:SPECTRALTHIEF, :SOULSTEALING7STARSTRIKE],
		0.9 => [:AURORABEAM, :SIGNALBEAM, :FLASHCANNON, :LUSTERPURGE, :DAZZLINGGLEAM, :MIRRORSHOT, 
		:DOOMDUMMY, :POWERGEM, :TECHNOBLAST, :PHOTONGEYSER, :STRANGESTEAM]
	},
	:accuracyMods => {},
	:moveMessages => {
		"The scattered shadows amassed around the attack!"=>[:DARKPULSE, :NIGHTDAZE,:NIGHTSLASH, :FALSESURRENDER, :SHADOWBALL, :SHADOWBONE, 
		:SHADOWBONE, :SHADODWCLAW, :SHADOWFORCE, :SHADOWSNEAK, :SHADOWPUNCH, :PHANTOMFORCE, 
		:SPIRITSHACKLE, :OMINOUSWIND, :SUCKERPUNCH, :THROATCHOP, :BLACKHOLEECLIPSE, :NEVERENDINGNIGHTMARE, :MOONGEISTBEAM, :ASTRALBARRAGE,
		:SPECTRALTHIEF, :SOULSTEALING7STARSTRIKE],
		"A glimmer of light infiltrates the dark..."=> [:MORNINGSUN, :SYNTHESIS, :AURORABEAM, :SIGNALBEAM, :FLASHCANNON, :LUSTERPURGE, :DAZZLINGGLEAM, :MIRRORSHOT, 
		:DOOMDUMMY, :POWERGEM, :TECHNOBLAST, :PHOTONGEYSER, :STRANGESTEAM],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {},
	:typeMessages => {},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:DARKNESS2 => [:DARKPULSE, :NIGHTDAZE, :MOONGEISTBEAM,:OMINOUSWIND,:ASTRALBARRAGE],
		:DARKNESS3 => [:DARKVOID]
	},
	:dontChangeBackup => [],
	:changeMessage => {
		 "The shadows grow..." => [:DARKPULSE, :NIGHTDAZE, :MOONGEISTBEAM,:OMINOUSWIND,:ASTRALBARRAGE],
		 "Straight to the abyss!" => [:DARKVOID]
	},
	:statusMods => [:FLASH,:DARKVOID, :MOONLIGHT, :SYNTHESIS, :MORNINGSUN],
	:changeEffects => {},
	:seed => {
		:seedtype => :MAGICALSEED,
		:effect => "setField(:DARKNESS2)",
		:duration => nil,
		:message => "The shadows grow...",
		:animation => :DARKVOID,
		:stats => {},
	},
},
:DARKNESS2 => {
	:name => "Darkness Field",
	:fieldMessage => [
		"The thick fog of darkness feels constricting..."
	],
	:graphic => ["Darkness2"],
	:secretPower => "CRUNCH",
	:naturePower => :DARKPULSE,
	:mimicry => :DARK,
	:damageMods => {
		1.2 => [:DARKPULSE, :NIGHTDAZE,:NIGHTSLASH, :FALSESURRENDER, :SHADOWBALL, :SHADOWBONE, 
		:SHADOWBONE, :SHADOWCLAW, :SHADOWFORCE, :SHADOWSNEAK, :SHADOWPUNCH, :PHANTOMFORCE, 
		:SPIRITSHACKLE, :OMINOUSWIND, :SUCKERPUNCH, :THROATCHOP, :BLACKHOLEECLIPSE, :NEVERENDINGNIGHTMARE, :MOONGEISTBEAM, :ASTRALBARRAGE,
		:SPECTRALTHIEF, :SOULSTEALING7STARSTRIKE],
		0.75 => [:AURORABEAM, :SIGNALBEAM, :FLASHCANNON, :LUSTERPURGE, :DAZZLINGGLEAM, :MIRRORSHOT, 
		:DOOMDUMMY, :POWERGEM, :TECHNOBLAST, :PHOTONGEYSER, :STRANGESTEAM],
		0 => [:SOLARBEAM, :SOLARBLADE],
	},
	:accuracyMods => {
		70 => [:DARKVOID] 
	},
	:moveMessages => {
		"The shadows joined in on the attack!"=>[:DARKPULSE, :NIGHTDAZE,:NIGHTSLASH, :FALSESURRENDER, :SHADOWBALL, :SHADOWBONE, 
		:SHADOWBONE, :SHADOWCLAW, :SHADOWSNEAK, :SHADOWPUNCH, 
		:SPIRITSHACKLE, :OMINOUSWIND, :SUCKERPUNCH, :THROATCHOP, :BLACKHOLEECLIPSE, :NEVERENDINGNIGHTMARE, :MOONGEISTBEAM, :ASTRALBARRAGE,
		:SPECTRALTHIEF, :SOULSTEALING7STARSTRIKE],
		"Some dim light breaks through..."=> [:MORNINGSUN, :SYNTHESIS, :AURORABEAM, :SIGNALBEAM, :FLASHCANNON, :LUSTERPURGE, :DAZZLINGGLEAM, :MIRRORSHOT, 
		:DOOMDUMMY, :POWERGEM, :TECHNOBLAST, :PHOTONGEYSER, :STRANGESTEAM],
		"The darkness accelerated the attack!"=>[:SHADOWFORCE, :PHANTOMFORCE],
		"But there isn't enough light to attack!"=>[:SOLARBEAM, :SOLARBLADE],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {},
	:typeMessages => {},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:DARKNESS1 => [:WISH, :SUNNYDAY, :LUSTERPURGE, :FLASH, :FLASHCANNON, :DAZZLINGGLEAM, :LIGHTOFRUIN,:PHOTONGEYSER, :LIGHTTHATBURNSTHESKY],
		:DARKNESS3 => [:DARKPULSE, :NIGHTDAZE, :MOONGEISTBEAM,:OMINOUSWIND,:ASTRALBARRAGE,:DARKVOID],
	},
	:dontChangeBackup => [],
	:changeMessage => {
		"The darkness is obliterated by the light!" =>[:LIGHTTHATBURNSTHESKY],
		"The shadows retreat!" => [:WISH, :SUNNYDAY, :LUSTERPURGE, :FLASH, :FLASHCANNON, :DAZZLINGGLEAM, :LIGHTOFRUIN,:PHOTONGEYSER],
		"The shadows grow!" => [:DARKPULSE, :NIGHTDAZE, :MOONGEISTBEAM,:OMINOUSWIND,:ASTRALBARRAGE],
	},
	:statusMods => [:DARKVOID, :MOONLIGHT, :SYNTHESIS, :MORNINGSUN],
	:changeEffects => {},
	:seed => {
		:seedtype => :MAGICALSEED,
		:effect => "setField(:DARKNESS3)",
		:duration => nil,
		:message => "The shadows engulf the surroundings!",
		:animation => :DARKVOID,
		:stats => {},
	},
},
:DARKNESS3 => {
	:name => "Darkness Field",
	:fieldMessage => [
		"In an endless sea of darkness, any glimmer of hope fades away..."
	],
	:graphic => ["Darkness3"],
	:secretPower => "CRUNCH",
	:naturePower => :DARKPULSE,
	:mimicry => :DARK,
	:damageMods => {
		1.4 => [:DARKPULSE, :NIGHTDAZE,:NIGHTSLASH, :FALSESURRENDER, :SHADOWBALL, :SHADOWBONE, 
		:SHADOWBONE, :SHADOWCLAW, :SHADOWFORCE, :SHADOWSNEAK, :SHADOWPUNCH, :PHANTOMFORCE, 
		:SPIRITSHACKLE, :OMINOUSWIND, :SUCKERPUNCH, :THROATCHOP, :BLACKHOLEECLIPSE, :NEVERENDINGNIGHTMARE, :MOONGEISTBEAM, :ASTRALBARRAGE,
		:SPECTRALTHIEF, :SOULSTEALING7STARSTRIKE],
		0.5 => [:AURORABEAM, :SIGNALBEAM, :FLASHCANNON, :LUSTERPURGE, :DAZZLINGGLEAM, :MIRRORSHOT, 
		:DOOMDUMMY, :POWERGEM, :TECHNOBLAST, :PHOTONGEYSER, :STRANGESTEAM],
		0 => [:SOLARBEAM, :SOLARBLADE],
	},
	:accuracyMods => {
		100 => [:DARKVOID] ,
	},
	:moveMessages => {
		"The void attacked !"=>[:DARKPULSE, :NIGHTDAZE,:NIGHTSLASH, :FALSESURRENDER, :SHADOWBALL, :SHADOWBONE, 
		:SHADOWBONE, :SHADOWCLAW, :SHADOWSNEAK, :SHADOWPUNCH, 
		:SPIRITSHACKLE, :OMINOUSWIND, :SUCKERPUNCH, :THROATCHOP, :BLACKHOLEECLIPSE, :NEVERENDINGNIGHTMARE, :MOONGEISTBEAM, :ASTRALBARRAGE,
		:SPECTRALTHIEF, :SOULSTEALING7STARSTRIKE],
		"A single ray of light makes its way..."=> [:MORNINGSUN, :SYNTHESIS, :AURORABEAM, :SIGNALBEAM, :FLASHCANNON, :LUSTERPURGE, :DAZZLINGGLEAM, :MIRRORSHOT, 
		:DOOMDUMMY, :POWERGEM, :TECHNOBLAST, :PHOTONGEYSER, :STRANGESTEAM],
		"The darkness accelerated the attack!"=>[:SHADOWFORCE, :PHANTOMFORCE],
		"But there isn't enough light to attack!"=>[:SOLARBEAM, :SOLARBLADE],
	},
	:typeMods => {},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {},
	:typeMessages => {},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
		:DARKNESS1 => [:LIGHTTHATBURNSTHESKY],
		:DARKNESS2 => [:WISH, :SUNNYDAY, :LUSTERPURGE, :FLASH, :FLASHCANNON, :DAZZLINGGLEAM, :LIGHTOFRUIN,:PHOTONGEYSER]
	},
	:dontChangeBackup => [],
	:changeMessage => {
		"The darkness is obliterated by the light !" =>[:LIGHTTHATBURNSTHESKY],
		"The shadows retreat!" => [:WISH, :SUNNYDAY, :LUSTERPURGE, :FLASH, :FLASHCANNON, :DAZZLINGGLEAM, :LIGHTOFRUIN,:PHOTONGEYSER],
		"The shadows grow!" => [:DARKPULSE, :NIGHTDAZE, :MOONGEISTBEAM,:OMINOUSWIND,:ASTRALBARRAGE],
	},
	:statusMods => [:DARKVOID, :MOONLIGHT, :SYNTHESIS, :MORNINGSUN],
	:changeEffects => {},
	:seed => {
		:seedtype => :MAGICALSEED,
		:effect => nil,
		:duration => nil,
		:message => "The shadows form a protective shield!",
		:animation => nil,
		:stats => {
			PBStats::SPDEF => 1,
			PBStats::DEFENSE => 1,
		},
	},
},
:DANCEFLOOR => {
	:name => "Dance Floor Field",
	:fieldMessage => [
		"The dance floor beckons... it's time to bust a move!"
	],
	:graphic => ["Nightclub"],
	:secretPower => "PSYCHIC",
	:naturePower => :PSYSHOCK,
	:mimicry => :PSYCHIC,
	:damageMods => {
		1.4 =>[:REVELATIONDANCE, :PETALDANCE, :FIERYDANCE],
		1.2 =>[:MYSTICALFIRE, :DAZZLINGGLEAM, :FLASHCANNON, :SIGNALBEAM, :AURASPHERE, :BOOMBURST, 
		:BUGBUZZ, :CHATTER, :CLANGINGSCALES, :DISARMINGVOICE, :ECHOEDVOICE, :EERIESPELL, :HYPERVOICE, 
		:OVERDRIVE, :UPROAR, :SNARL, :ROUND, :SPARKLINGARIA, :RELICSONG]
	},
	:accuracyMods => {
	},
	:moveMessages => {
		"The beat becomes too fire to handle!"=>[:REVELATIONDANCE, :PETALDANCE, :FIERYDANCE],
		"In sync with the music!"=>[:MYSTICALFIRE, :DAZZLINGGLEAM, :FLASHCANNON, :SIGNALBEAM, :AURASPHERE, :BOOMBURST, :BUGBUZZ, :CHATTER, :CLANGINGSCALES, :DISARMINGVOICE, :ECHOEDVOICE, :EERIESPELL, :HYPERVOICE, 
		:OVERDRIVE, :UPROAR, :SNARL, :ROUND, :SPARKLINGARIA, :RELICSONG, :KINESIS],
	},
	:typeMods => {
	},
	:typeAddOns => {},
	:moveEffects => {},
	:typeBoosts => {
		1.3 => [:PSYCHIC],
	},
	:typeMessages => {
		"Drop the beat!" => [:PSYCHIC],
	},
	:typeCondition => {},
	:typeEffects => {},
	:changeCondition => {},
	:fieldChange => {
	},
	:dontChangeBackup => [],
	:changeMessage => {

	},
	:statusMods => [:KINESIS, :LIGHTSCREEN, :REFLECT, :SWORDSDANCE, :FEATHERDANCE, :LUNARDANCE, :QUIVERDANCE, :DRAGONDANCE, :TEETERDANCE],
	:changeEffects => {},
	:seed => {
		:seedtype => :SYNTHETICSEED,
		:effect => "battler.ability=(:DANCER)",
		:duration => nil,
		:message => "{1} started grooving on the dance floor!",
		:animation => nil,
		:stats => {
		},
	},
},
}