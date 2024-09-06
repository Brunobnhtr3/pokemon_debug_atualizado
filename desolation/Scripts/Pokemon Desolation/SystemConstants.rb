GAMETITLE = "Pokemon Desolation"
GAMEFOLDER = "Pokemon Desolation"
GAMEVERSION = "e6"

LEVELCAPS         = [20,30,40,50,60,65,65,70,75,100]
BADGECOUNT        = 12
STARTINGMAP       = 1

Reborn = false
Desolation = true
Rejuv = false

Switches = {
   Starting_Over:        1,
   LastMon: 				 351,
   WildBattles:          726,
   UmbreonCheck:         743,
   NightmareOn:          774,
   FirstUse:				 751,
   No_Catching:          773,
   LastMonButMore:       696,
   Egg_Trade:				 788,
   Egg_Battle:				 789,
   Exp_All_On:           821,
   EasyHMs_Password:     826,
   ALittleTrolling:      814,
   Overworld_Poison_Password: 828,
   No_Damage_Rolls:           829,
   Empty_IVs_And_EVs_Password:830,
   Penniless_Mode:      831,
   Only_Pulse_2:        832,
   No_Items_Password:   833,
   Nuzlocke_Mode:       834,
   Moneybags:           835,
   Full_IVs:            836,
   Empty_IVs_Password:     837,
   Offset_Trainer_Levels:  838, 
   Percent_Trainer_Levels: 839,
   Stop_Items_Password: 840,
   Stop_Ev_Gain:        841,
   No_EXP_Gain:         842,
   Flat_EV_Password:    843,
   No_Total_EV_Cap:     844,
   Gen_5_Weather:       845,
   eeveepls:            846,
   prisonbreak:         847,
   Last_Ace_Switch:     903,
}
Variables = {
   Current_Weather:	         130,
   Next_Weather_Archetype:	 131,
   Weather_Randomizer:		 132,
   Place_In_Weather_Pattern: 129,
   QuestLogLastMain:         198,
   QuestLogLastSide:         199,
   QuestLogMainOrSide:       200,
   BattleDataArray:          303,
   QuestLog:                 304,
   EncounterRateModifier:    305,
   MegaStone:                300,
   Battle_Text_of_Opponent:  306,
   LastMonMusic:             192,
   UmbreMon:                 800,
   Temp:                     1001,
   Egg_Battle_Count:		     256,
   Forced_Field_Effect:      308,
   AmeliaWhatTheFuckYouCantDoThat: 306,
   AltFieldGraphic: 		     307,
   Level_Offset_Value:		  268,
	Level_Offset_Percent:	  269

}

#===============================================================================
# * Message/Speech Frame location arrays
#===============================================================================

  #
  #  Stores game options
  # Default options are at the top of script section SpriteWindow.
  #####################
  #
  #  Stores game options
  # Default options are at the top of script section SpriteWindow.
  
  ##27 - BRAVELY DEFAULT-STYLE ENCOUNTER RATE -Yumil
  $EncounterValues=[
  "0","10","25","50","75","90","100","125","150","200","300","400","500","750","1000","2000","4000","8000","10000"
  ]
  ##27 - BRAVELY DEFAULT-STYLE ENCOUNTER RATE -Yumil
  
SpeechFrames=[
	"PRWS- speech1", # Default: speech hgss 1
	"PRWS- speech2",
	"PRWS- speech3",
	"PRWS- speech4",
	"PRWS- speech5",
	"PRWS- speech6",
	"PRWS- speech7",
	"PRWS- speech8",
	"PRWS- speech9",
	"PRWS- speech10",
	"PRWS- speech11",
	"PRWS- speech12",
	"PRWS- speech13",
	"PRWS- speech14",
	"PRWS- speech15",
	"PRWS- speech16",
	"PRWS- speech17",
	"PRWS- speech18",
	"PRWS- speech19",
	"PRWS- speech20",
	"PRWS- speech21",
	"PRWS- speech22",
	"PRWS- speech23",
	"PRWS- speech24",
	"PRWS- speech25",
	"PRWS- speech26",
	"PRWS- speech27",
	"PRWS- speech28"
]

TextFrames=[
	"Graphics/Windowskins/PRWS- menu1", # Default: choice 1
	"Graphics/Windowskins/PRWS- menu2",
	"Graphics/Windowskins/PRWS- menu3",
	"Graphics/Windowskins/PRWS- menu4",
	"Graphics/Windowskins/PRWS- menu5",
	"Graphics/Windowskins/PRWS- menu6",
	"Graphics/Windowskins/PRWS- menu7",
	"Graphics/Windowskins/PRWS- menu8",
	"Graphics/Windowskins/PRWS- menu9",
	"Graphics/Windowskins/PRWS- menu10",
	"Graphics/Windowskins/PRWS- menu11",
	"Graphics/Windowskins/PRWS- menu12",
	"Graphics/Windowskins/PRWS- menu13",
	"Graphics/Windowskins/PRWS- menu14",
	"Graphics/Windowskins/PRWS- menu15",
	"Graphics/Windowskins/PRWS- menu16",
	"Graphics/Windowskins/PRWS- menu17",
	"Graphics/Windowskins/PRWS- menu18",
	"Graphics/Windowskins/PRWS- menu19",
	"Graphics/Windowskins/PRWS- menu20",
	"Graphics/Windowskins/PRWS- menu21",
	"Graphics/Windowskins/PRWS- menu22",
	"Graphics/Windowskins/PRWS- menu23",
	"Graphics/Windowskins/PRWS- menu24",
	"Graphics/Windowskins/PRWS- menu25",
	"Graphics/Windowskins/PRWS- menu26",
	"Graphics/Windowskins/PRWS- menu27",
	"Graphics/Windowskins/PRWS- menu28"
]

VersionStyles=[
	["PokemonEmerald"]#, # Default font style - Power Green/"Pokemon Emerald"
	#["Power Red and Blue"],
	#["Power Red and Green"],
	#s["Power Clear"]
]

LEFT   = 0
TOP    = 0
RIGHT  = 29
BOTTOM = 19
SQUAREWIDTH  = 16
SQUAREHEIGHT = 16

#===============================================================================
# * Constants for field differences
#===============================================================================

Glitchtypes = [:DARK, :STEEL, :FAIRY]
CHESSMOVES = [:STRENGTH,:ANCIENTPOWER,:PSYCHIC,:CONTINENTALCRUSH, 
   :SECRETPOWER,:SHATTEREDPSYCHE]
TOTALFIELDS = 37

#===============================================================================
# * Mon Specific Map Data (for both evos and form encounters)
#===============================================================================

#Evos first
Crabominable = [26]
#Nosepass, Magnezone...
Magnetic = [249,356]
#Alolan/Galarian evos
Marowak = [375,377,402,403,404,433,434]
Weezing = [354]
Exeggutor = [443]
Raichu = [249,443]

#form encounters
MrMime = [26]
Shellos = []
Deerling = []
Rattata = [75,204,401,426]	#includes A-Meowth
Sandshrew = [31,37,40,46,47,49,50,52]
Vulpix = []
Diglett = []
Meowth = [9]	#G-Meowth
Geodude = [186,187,188,336,337,339,340,341,342]
Grimer = [261,362,363]
Cubone = []
###########
Darumaka = []
Ponyta = [] 
Farfetchd = []
Corsola = []
Zigzagoon = [4,202,333,398,400]
YamaskEvo = [109,110,113,114,116,11,12,14,18,13,20,21,22,23]
YamaskSpawn = [334]
Stunfisk = [337,339,340,341] 
###########
Growlithe = []
Voltorb = []
Typhlosion = []
Qwilfish = []
Sneasel = []
Samurott = []
Lilligant = []
Zorua = []
Braviary = []
Sliggoo = []
Avalugg = []
Decidueye = []
Dreamscape = [315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,343,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,396,397,398,399,400,405,406,450,451,452,453,454,456,457,479]
#===============================================================================
# * Constants for maps to reflect sprites on
#===============================================================================

ReflectSpritesOn=[
    
]

PickupNormal=[
    :ORANBERRY,
    :GREATBALL,
    :FULLHEAL,
    :GOURMETTREAT,
    :MOOMOOMILK,
    :MOONBALL,
    :DUSKBALL,
    :HYPERPOTION,
    :SITRUSBERRY,
    :FULLRESTORE,
    :REVIVE,
    :ETHER,
    :PPUP,
    :HEARTSCALE,
    :ABILITYCAPSULE,
    :HEARTSCALE,
    :BIGNUGGET,
    :SACREDASH
]
 PickupRare=[
    :NUGGET,
    :HYPERPOTION,
    :NUGGET,
    :RARECANDY,
    :DESTINYKNOT,
    :RARECANDY,
    :DESTINYKNOT,
    :PAINTJAR,
    :LEFTOVERS,
    :PAINTJAR,
    :LEFTOVERS
]

PASSWORD_HASH = {
   #QOL
   "mintyfresh" => 822, "mintpack" => 822,
   "freeexpall" => 823,
   "shinycharm" => 824, "earlyshiny" => 824,
   "freemegaz" => 825,
   "easyhms" => :EasyHMs_Password, "nohms" => :EasyHMs_Password, "hmitems" => :EasyHMs_Password, "notmxneeded" => :EasyHMs_Password,
   "earlyincu" => 827,
   "powerpack" => 916,
   "nopoisondam" => :Overworld_Poison_Password, "antidote" => :Overworld_Poison_Password,
   "nodamageroll" => :No_Damage_Rolls, "norolls" => :No_Damage_Rolls, "rolls" => :No_Damage_Rolls,

   # Difficulty passwords
   "litemode" => :Empty_IVs_And_EVs_Password, "noevs" => :Empty_IVs_And_EVs_Password, "emptyevs" => :Empty_IVs_And_EVs_Password,
   "nopenny" => :Penniless_Mode,
   "fullevs" => :Only_Pulse_2,
   "noitems" => :No_Items_Password,
   "nuzlocke" => :Nuzlocke_Mode, "locke" => :Nuzlocke_Mode, "permadeath" => :Nuzlocke_Mode,
   "moneybags" => :Moneybags, "richboy" => :Moneybags, "doublemoney" => :Moneybags,
   "fullivs" => :Full_IVs, "31ivs" => :Full_IVs, "allivs" => :Full_IVs, "mischievous" => :Full_IVs,
   "emptyivs" => :Empty_IVs_Password, "0ivs" => :Empty_IVs_Password, "noivs" => :Empty_IVs_Password,
   "leveloffset" => :Offset_Trainer_Levels, "setlevel" => :Offset_Trainer_Levels, "flatlevel" => :Offset_Trainer_Levels,
   "percentlevel" => :Percent_Trainer_Levels, "levelpercent" => :Percent_Trainer_Levels,
   "stopitems" => :Stop_Items_Password,
   "stopgains" => :Stop_Ev_Gain,
   "noexp" => :No_EXP_Gain, "zeroexp" => :No_EXP_Gain, "0EXP" => :No_EXP_Gain,
   "flatevs" => :Flat_EV_Password, "85evs" => :Flat_EV_Password,
   "noevcap" => :No_Total_EV_Cap, "gen2mode" => :No_Total_EV_Cap,

   # Shenanigans
   "gen5weather" => :Gen_5_Weather,
   "eeveepls" => :eeveepls,
   "prisonbreak" => :prisonbreak,
   "monoamelia" => :ALittleTrolling, "betamemes" => :ALittleTrolling
}
BULK_PASSWORDS = {
  "casspack" => ["noitems", "fullivs", "easyhms", "norolls"], "goodtaste" => ["noitems", "fullivs", "easyhms", "norolls"],
  "easymode" => ["fullivs", "moneybags", "litemode", "stopitems"],
  "hardmode" => ["noitems", "nopenny", "fullevs", "emptyivs"],
  "qol"      => ["easyhms", "earlyincu", "nopoisondam", "freeexpall"]
}