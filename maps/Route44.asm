const_value set 2
	const ROUTE44_FISHER1
	const ROUTE44_FISHER2
	const ROUTE44_YOUNGSTER1
	const ROUTE44_SUPER_NERD
	const ROUTE44_YOUNGSTER2
	const ROUTE44_COOLTRAINER_M
	const ROUTE44_COOLTRAINER_F
	const ROUTE44_FRUIT_TREE
	const ROUTE44_POKE_BALL1
	const ROUTE44_POKE_BALL2
	const ROUTE44_POKE_BALL3

Route44_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TrainerBirdKeeperVance1:
	trainer EVENT_BEAT_BIRD_KEEPER_VANCE, BIRD_KEEPER, VANCE1, BirdKeeperVance1SeenText, BirdKeeperVance1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_BIRDKEEPER_VANCE
	end_if_just_battled
	opentext
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	checkcellnum PHONE_BIRDKEEPER_VANCE
	iftrue Route44NumberAcceptedM
	checkevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BirdKeeperVanceLegendaryBirdsText
	buttonsound
	setevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
	scall Route44AskNumber1M
	jump .AskForNumber

.AskedAlready:
	scall Route44AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BIRDKEEPER_VANCE
	if_equal $1, Route44PhoneFullM
	if_equal $2, Route44NumberDeclinedM
	trainertotext BIRD_KEEPER, VANCE1, $0
	scall Route44RegisteredNumberM
	jump Route44NumberAcceptedM

.WantsBattle:
	scall Route44RematchM
	winlosstext BirdKeeperVance1BeatenText, 0
	copybytetovar wVanceFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer BIRD_KEEPER, VANCE1
	startbattle
	reloadmapafterbattle
	loadvar wVanceFightCount, 1
	clearflag ENGINE_VANCE
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, VANCE2
	startbattle
	reloadmapafterbattle
	loadvar wVanceFightCount, 2
	clearflag ENGINE_VANCE
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, VANCE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_VANCE
	checkevent EVENT_VANCE_CARBOS
	iftrue .Carbos
	checkevent EVENT_GOT_CARBOS_FROM_VANCE
	iftrue .ReceivedCarbosBefore
	scall Route44RematchGiftM
	verbosegiveitem CARBOS
	iffalse VancePackFull
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	jump Route44NumberAcceptedM

.ReceivedCarbosBefore:
	end

.Carbos:
	opentext
	writetext BirdKeeperVance2BeatenText
	waitbutton
	verbosegiveitem CARBOS
	iffalse VancePackFull
	clearevent EVENT_VANCE_CARBOS
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	jump Route44NumberAcceptedM

Route44AskNumber1M:
	jumpstd asknumber1m
	end

Route44AskNumber2M:
	jumpstd asknumber2m
	end

Route44RegisteredNumberM:
	jumpstd registerednumberm
	end

Route44NumberAcceptedM:
	jumpstd numberacceptedm
	end

Route44NumberDeclinedM:
	jumpstd numberdeclinedm
	end

Route44PhoneFullM:
	jumpstd phonefullm
	end

Route44RematchM:
	jumpstd rematchm
	end

Route44GiftM:
	jumpstd giftm
	end

Route44PackFullM:
	jumpstd packfullm
	end

VancePackFull:
	setevent EVENT_VANCE_CARBOS
	jumpstd packfullm
	end

Route44RematchGiftM:
	jumpstd rematchgiftm
	end

TrainerPsychicPhil:
	trainer EVENT_BEAT_PSYCHIC_PHIL, PSYCHIC_T, PHIL, PsychicPhilSeenText, PsychicPhilBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PsychicPhilAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherWilton1:
	trainer EVENT_BEAT_FISHER_WILTON, FISHER, WILTON1, FisherWilton1SeenText, FisherWilton1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_FISHER_WILTON
	end_if_just_battled
	opentext
	checkflag ENGINE_WILTON
	iftrue WiltonWantsBattle
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue WiltonHasItem
	checkcellnum PHONE_FISHER_WILTON
	iftrue Route44NumberAcceptedM
	checkevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext FisherWiltonHugePoliwagText
	buttonsound
	setevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	scall Route44AskNumber1M
	jump .AskForNumber

.AskedAlready:
	scall Route44AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_FISHER_WILTON
	if_equal $1, Route44PhoneFullM
	if_equal $2, Route44NumberDeclinedM
	trainertotext FISHER, WILTON1, $0
	scall Route44RegisteredNumberM
	jump Route44NumberAcceptedM

WiltonWantsBattle:
	scall Route44RematchM
	winlosstext FisherWilton1BeatenText, 0
	copybytetovar wWiltonFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, WILTON1
	startbattle
	reloadmapafterbattle
	loadvar wWiltonFightCount, 1
	clearflag ENGINE_WILTON
	end

.LoadFight1:
	loadtrainer FISHER, WILTON2
	startbattle
	reloadmapafterbattle
	loadvar wWiltonFightCount, 2
	clearflag ENGINE_WILTON
	end

.LoadFight2:
	loadtrainer FISHER, WILTON3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WILTON
	end

WiltonHasItem:
	scall Route44GiftM
	checkevent EVENT_WILTON_HAS_ULTRA_BALL
	iftrue .UltraBall
	checkevent EVENT_WILTON_HAS_GREAT_BALL
	iftrue .GreatBall
	checkevent EVENT_WILTON_HAS_POKE_BALL
	iftrue .PokeBall
.UltraBall:
	verbosegiveitem ULTRA_BALL
	iffalse .Route44PackFullM
	jump .ItemReceived

.GreatBall:
	verbosegiveitem GREAT_BALL
	iffalse .Route44PackFullM
	jump .ItemReceived

.PokeBall:
	verbosegiveitem POKE_BALL
	iffalse .Route44PackFullM
.ItemReceived:
	clearflag ENGINE_WILTON_HAS_ITEM
	jump Route44NumberAcceptedM

.Route44PackFullM:
	jump Route44PackFullM

TrainerFisherEdgar:
	trainer EVENT_BEAT_FISHER_EDGAR, FISHER, EDGAR, FisherEdgarSeenText, FisherEdgarBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherEdgarAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCybil:
	trainer EVENT_BEAT_COOLTRAINERF_CYBIL, COOLTRAINERF, CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerfCybilAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacZach:
	trainer EVENT_BEAT_POKEMANIAC_ZACH, POKEMANIAC, ZACH, PokemaniacZachSeenText, PokemaniacZachBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PokemaniacZachAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAllen:
	trainer EVENT_BEAT_COOLTRAINERM_ALLEN, COOLTRAINERM, ALLEN, CooltrainermAllenSeenText, CooltrainermAllenBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainermAllenAfterBattleText
	waitbutton
	closetext
	end

Route44Sign1:
	jumptext Route44Sign1Text

Route44Sign2:
	jumptext Route44Sign2Text

FruitTreeScript_0x19da40:
	fruittree FRUITTREE_ROUTE_44

Route44MaxRevive:
	itemball MAX_REVIVE

Route44UltraBall:
	itemball ULTRA_BALL

Route44MaxRepel:
	itemball MAX_REPEL

Route44HiddenElixer:
	dwb EVENT_ROUTE_44_HIDDEN_ELIXER, ELIXER


FisherWilton1SeenText:
	text "Aack! You made me"
	line "lose a POLIWAG!"

	para "What are you going"
	line "to do about it?"
	done

FisherWilton1BeatenText:
	text "Just forget about"
	line "it."
	done

FisherWiltonHugePoliwagText:
	text "That POLIWAG that"
	line "got away…"
	cont "It was huge."

	para "I swear it must've"
	line "been 16 feet long!"
	done

FisherEdgarSeenText:
	text "I fish until I"
	line "can't anymore."

	para "I also battle"
	line "until I drop."

	para "That's my"
	line "relationship"
	cont "with my #MON."
	done

FisherEdgarBeatenText:
	text "Hmmmm… "
	line "This isn't right."
	done

FisherEdgarAfterBattleText:
	text "That's 100 wins"
	line "to 101 losses."

	para "I won't battle"
	line "again for a while."
	done

BirdKeeperVance1SeenText:
	text "Do you know about"
	line "the legendary bird"
	cont "#MON?"
	done

BirdKeeperVance1BeatenText:
	text "Whew! You're hot"
	line "stuff."
	done

BirdKeeperVanceLegendaryBirdsText:
	text "ARTICUNO, ZAPDOS"
	line "and MOLTRES are"

	para "the three legend-"
	line "ary bird #MON."

	para "I heard there are"
	line "other legendary"
	cont "birds, though."
	done

BirdKeeperVance2BeatenText:
	text "Why can't I ever"
	line "beat you?"

	para "Oh yeah, here you"
	line "go. It's that gift"

	para "I couldn't give"
	line "you last time."
	done

PsychicPhilSeenText:
	text "I'm gonna win,"
	line "for sure!"
	done

PsychicPhilBeatenText:
	text "Arrgh… That's a"
	line "shocking loss…"
	done

PsychicPhilAfterBattleText:
	text "It's important to"
	line "have conviction"
	cont "on your side."
	done

PokemaniacZachSeenText:
	text "I'll do anything"
	line "to get my hands on"
	cont "rare #MON!"
	done

PokemaniacZachBeatenText:
	text "Oooh, your #MON"
	line "are so appealing."
	done

PokemaniacZachAfterBattleText:
	text "If a #MON has"
	line "different colors"

	para "from usual, it's"
	line "more valuable."

	para "What? You mean"
	line "that's not true?"
	done

CooltrainermAllenSeenText:
	text "I can tell you're"
	line "a good trainer by"
	cont "looking at you."

	para "I'm good at #-"
	line "MON, and I can see"
	cont "that you are too."
	done

CooltrainermAllenBeatenText:
	text "Tch! It's a total"
	line "loss on my part."
	done

CooltrainermAllenAfterBattleText:
	text "Wow. You have a"
	line "lot of BADGES."

	para "No wonder you're"
	line "so tough."

	para "I wonder if"
	line "ECRUTEAK GYM's"

	para "MORTY is still in"
	line "training?"

	para "He really hammered"
	line "me."
	done

CooltrainerfCybilSeenText:
	text "You look strong."

	para "Good trainers seek"
	line "tough opponents"
	cont "instinctively."
	done

CooltrainerfCybilBeatenText:
	text "Nope! This won't"
	line "do at all."
	done

CooltrainerfCybilAfterBattleText:
	text "We all get better"
	line "by experiencing"
	cont "many battles."

	para "I battled a lot to"
	line "become what I am"
	cont "today--an elite."
	done

Route44Sign1Text:
	text "ROUTE 44"
	line "ICE PATH AHEAD"
	done

Route44Sign2Text:
	text "ROUTE 44"

	para "MAHOGANY TOWN -"
	line "BLACKTHORN CITY"
	done

Route44_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def 56, 7, 1, ICE_PATH_1F

.CoordEvents:
	db 0

.BGEvents:
	db 3
	bg_event 53, 7, BGEVENT_READ, Route44Sign1
	bg_event 6, 10, BGEVENT_READ, Route44Sign2
	bg_event 32, 9, BGEVENT_ITEM, Route44HiddenElixer

.ObjectEvents:
	db 11
	object_event 35, 3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherWilton1, -1
	object_event 19, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherEdgar, -1
	object_event 10, 9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicPhil, -1
	object_event 43, 2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacZach, -1
	object_event 51, 5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperVance1, -1
	object_event 41, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainermAllen, -1
	object_event 31, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfCybil, -1
	object_event 9, 5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FruitTreeScript_0x19da40, -1
	object_event 30, 8, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44MaxRevive, EVENT_ROUTE_44_MAX_REVIVE
	object_event 45, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44UltraBall, EVENT_ROUTE_44_ULTRA_BALL
	object_event 14, 9, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44MaxRepel, EVENT_ROUTE_44_MAX_REPEL
