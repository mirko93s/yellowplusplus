	; See constants/pokemon_data_constants.asm
	; The max number of evolutions per monster is MAX_EVOLUTIONS

EvosMovesPointerTable:
	table_width 2, EvosMovesPointerTable
	dw BulbasaurEvosMoves
	dw IvysaurEvosMoves
	dw VenusaurEvosMoves
	dw CharmanderEvosMoves
	dw CharmeleonEvosMoves
	dw CharizardEvosMoves
	dw SquirtleEvosMoves
	dw WartortleEvosMoves
	dw BlastoiseEvosMoves
	dw CaterpieEvosMoves
	dw MetapodEvosMoves
	dw ButterfreeEvosMoves
	dw WeedleEvosMoves
	dw KakunaEvosMoves
	dw BeedrillEvosMoves
	dw PidgeyEvosMoves
	dw PidgeottoEvosMoves
	dw PidgeotEvosMoves
	dw RattataEvosMoves
	dw RaticateEvosMoves
	dw SpearowEvosMoves
	dw FearowEvosMoves
	dw EkansEvosMoves
	dw ArbokEvosMoves
	dw PikachuEvosMoves
	dw RaichuEvosMoves
	dw SandshrewEvosMoves
	dw SandslashEvosMoves
	dw NidoranFEvosMoves
	dw NidorinaEvosMoves
	dw NidoqueenEvosMoves
	dw NidoranMEvosMoves
	dw NidorinoEvosMoves
	dw NidokingEvosMoves
	dw ClefairyEvosMoves
	dw ClefableEvosMoves
	dw VulpixEvosMoves
	dw NinetalesEvosMoves
	dw JigglypuffEvosMoves
	dw WigglytuffEvosMoves
	dw ZubatEvosMoves
	dw GolbatEvosMoves
	dw OddishEvosMoves
	dw GloomEvosMoves
	dw VileplumeEvosMoves
	dw ParasEvosMoves
	dw ParasectEvosMoves
	dw VenonatEvosMoves
	dw VenomothEvosMoves
	dw DiglettEvosMoves
	dw DugtrioEvosMoves
	dw MeowthEvosMoves
	dw PersianEvosMoves
	dw PsyduckEvosMoves
	dw GolduckEvosMoves
	dw MankeyEvosMoves
	dw PrimeapeEvosMoves
	dw GrowlitheEvosMoves
	dw ArcanineEvosMoves
	dw PoliwagEvosMoves
	dw PoliwhirlEvosMoves
	dw PoliwrathEvosMoves
	dw AbraEvosMoves
	dw KadabraEvosMoves
	dw AlakazamEvosMoves
	dw MachopEvosMoves
	dw MachokeEvosMoves
	dw MachampEvosMoves
	dw BellsproutEvosMoves
	dw WeepinbellEvosMoves
	dw VictreebelEvosMoves
	dw TentacoolEvosMoves
	dw TentacruelEvosMoves
	dw GeodudeEvosMoves
	dw GravelerEvosMoves
	dw GolemEvosMoves
	dw PonytaEvosMoves
	dw RapidashEvosMoves
	dw SlowpokeEvosMoves
	dw SlowbroEvosMoves
	dw MagnemiteEvosMoves
	dw MagnetonEvosMoves
	dw FarfetchdEvosMoves
	dw DoduoEvosMoves
	dw DodrioEvosMoves
	dw SeelEvosMoves
	dw DewgongEvosMoves
	dw GrimerEvosMoves
	dw MukEvosMoves
	dw ShellderEvosMoves
	dw CloysterEvosMoves
	dw GastlyEvosMoves
	dw HaunterEvosMoves
	dw GengarEvosMoves
	dw OnixEvosMoves
	dw DrowzeeEvosMoves
	dw HypnoEvosMoves
	dw KrabbyEvosMoves
	dw KinglerEvosMoves
	dw VoltorbEvosMoves
	dw ElectrodeEvosMoves
	dw ExeggcuteEvosMoves
	dw ExeggutorEvosMoves
	dw CuboneEvosMoves
	dw MarowakEvosMoves
	dw HitmonleeEvosMoves
	dw HitmonchanEvosMoves
	dw LickitungEvosMoves
	dw KoffingEvosMoves
	dw WeezingEvosMoves
	dw RhyhornEvosMoves
	dw RhydonEvosMoves
	dw ChanseyEvosMoves
	dw TangelaEvosMoves
	dw KangaskhanEvosMoves
	dw HorseaEvosMoves
	dw SeadraEvosMoves
	dw GoldeenEvosMoves
	dw SeakingEvosMoves
	dw StaryuEvosMoves
	dw StarmieEvosMoves
	dw MrMimeEvosMoves
	dw ScytherEvosMoves
	dw JynxEvosMoves
	dw ElectabuzzEvosMoves
	dw MagmarEvosMoves
	dw PinsirEvosMoves
	dw TaurosEvosMoves
	dw MagikarpEvosMoves
	dw GyaradosEvosMoves
	dw LaprasEvosMoves
	dw DittoEvosMoves
	dw EeveeEvosMoves
	dw VaporeonEvosMoves
	dw JolteonEvosMoves
	dw FlareonEvosMoves
	dw PorygonEvosMoves
	dw OmanyteEvosMoves
	dw OmastarEvosMoves
	dw KabutoEvosMoves
	dw KabutopsEvosMoves
	dw AerodactylEvosMoves
	dw SnorlaxEvosMoves
	dw ArticunoEvosMoves
	dw ZapdosEvosMoves
	dw MoltresEvosMoves
	dw DratiniEvosMoves
	dw DragonairEvosMoves
	dw DragoniteEvosMoves
	dw MewtwoEvosMoves
	dw MewEvosMoves
	assert_table_length NUM_POKEMON_INDEXES


BulbasaurEvosMoves:
	; Evolutions
	db EV_LEVEL, 16, IVYSAUR
	db 0
	; Learnset
	db 5, VINE_WHIP
	db 9, LEECH_SEED
	db 14, POISONPOWDER
	db 14, SLEEP_POWDER
	db 18, TAKE_DOWN
	db 23, RAZOR_LEAF
	db 27, GROWTH
	db 32, DOUBLE_EDGE
	db 0

IvysaurEvosMoves:
	; Evolutions
	db EV_LEVEL, 32, VENUSAUR
	db 0
	; Learnset
	db 5, VINE_WHIP
	db 9, LEECH_SEED
	db 14, POISONPOWDER
	db 14, SLEEP_POWDER
	db 22, TAKE_DOWN
	db 31, RAZOR_LEAF
	db 39, GROWTH
	db 48, DOUBLE_EDGE
	db 56, SOLARBEAM
	db 0

VenusaurEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, VINE_WHIP
	db 9, LEECH_SEED
	db 14, POISONPOWDER
	db 14, SLEEP_POWDER
	db 22, TAKE_DOWN
	db 31, RAZOR_LEAF
	db 44, GROWTH
	db 58, DOUBLE_EDGE
	db 71, SOLARBEAM
	db $FF, PETAL_DANCE ; EVO
	db 0

CharmanderEvosMoves:
	; Evolutions
	db EV_LEVEL, 16, CHARMELEON
	db 0
	; Learnset
	db 4, GROWL
	db 9, SMOKESCREEN
	db 13, EMBER
	db 18, FURY_SWIPES
	db 22, DRAGON_RAGE
	db 27, FIRE_SPIN
	db 31, SLASH
	db 36, FLAMETHROWER
	db 0

CharmeleonEvosMoves:
	; Evolutions
	db EV_LEVEL, 36, CHARIZARD
	db 0
	; Learnset
	db 4, GROWL
	db 9, SMOKESCREEN
	db 13, EMBER
	db 20, FURY_SWIPES
	db 26, DRAGON_RAGE
	db 33, FIRE_SPIN
	db 39, SLASH
	db 46, FLAMETHROWER
	db 0

CharizardEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, GROWL
	db 9, SMOKESCREEN
	db 13, EMBER
	db 20, FURY_SWIPES
	db 26, DRAGON_RAGE
	db 33, FIRE_SPIN
	db 43, SLASH
	db 54, FLAMETHROWER
	db $FF, WING_ATTACK ; EVO
	db 0

SquirtleEvosMoves:
	; Evolutions
	db EV_LEVEL, 16, WARTORTLE
	db 0
	; Learnset
	db 5, TAIL_WHIP
	db 9, BUBBLE
	db 14, WITHDRAW
	db 18, WATER_GUN
	db 23, BITE
	db 27, BUBBLEBEAM
	db 36, HEADBUTT
	db 41, HYDRO_PUMP
	db 45, SKULL_BASH
	db 0

WartortleEvosMoves:
	; Evolutions
	db EV_LEVEL, 36, BLASTOISE
	db 0
	; Learnset
	db 5, TAIL_WHIP
	db 9, BUBBLE
	db 14, WITHDRAW
	db 20, WATER_GUN
	db 27, BITE
	db 33, BUBBLEBEAM
	db 46, HEADBUTT
	db 53, HYDRO_PUMP
	db 59, SKULL_BASH
	db 0

BlastoiseEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, TAIL_WHIP
	db 9, BUBBLE
	db 14, WITHDRAW
	db 20, WATER_GUN
	db 27, BITE
	db 33, BUBBLEBEAM
	db 54, HEADBUTT
	db 65, HYDRO_PUMP
	db 75, SKULL_BASH
	db 0

CaterpieEvosMoves:
	; Evolutions
	db EV_LEVEL, 7, METAPOD
	db 0
	; Learnset
	db 0

MetapodEvosMoves:
	; Evolutions
	db EV_LEVEL, 10, BUTTERFREE
	db 0
	; Learnset
	db 7, HARDEN
	db $FF, HARDEN ; EVO
	db 0

ButterfreeEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 13, POISONPOWDER
	db 13, STUN_SPORE
	db 13, SLEEP_POWDER
	db 16, PSYBEAM
	db 19, SUPERSONIC
	db 25, WHIRLWIND
	db $FF, GUST ; EVO
	db 0

WeedleEvosMoves:
	; Evolutions
	db EV_LEVEL, 7, KAKUNA
	db 0
	; Learnset
	db 0

KakunaEvosMoves:
	; Evolutions
	db EV_LEVEL, 10, BEEDRILL
	db 0
	; Learnset
	db $FF, HARDEN ; EVO
	db 0

BeedrillEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 10, TWINEEDLE
	db 13, RAGE
	db 16, FURY_ATTACK
	db 19, FOCUS_ENERGY
	db 25, AGILITY
	db 28, PIN_MISSILE
	db 0

PidgeyEvosMoves:
	; Evolutions
	db EV_LEVEL, 18, PIDGEOTTO
	db 0
	; Learnset
	db 3, SAND_ATTACK
	db 5, GUST
	db 9, MIRROR_MOVE
	db 11, QUICK_ATTACK
	db 15, WING_ATTACK
	db 21, WHIRLWIND
	db 29, AGILITY
	db 29, RAZOR_WIND
	db 0

PidgeottoEvosMoves:
	; Evolutions
	db EV_LEVEL, 36, PIDGEOT
	db 0
	; Learnset
	db 3, SAND_ATTACK
	db 5, GUST
	db 9, QUICK_ATTACK
	db 11, MIRROR_MOVE
	db 15, WING_ATTACK
	db 25, WHIRLWIND
	db 31, AGILITY
	db 45, RAZOR_WIND
	db 0

PidgeotEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 3, SAND_ATTACK
	db 5, GUST
	db 9, QUICK_ATTACK
	db 11, MIRROR_MOVE
	db 15, WING_ATTACK
	db 25, WHIRLWIND
	db 31, AGILITY
	db 53, RAZOR_WIND
	db 0

RattataEvosMoves:
	; Evolutions
	db EV_LEVEL, 20, RATICATE
	db 0
	; Learnset
	db 3, TAIL_WHIP
	db 6, QUICK_ATTACK
	db 9, FOCUS_ENERGY
	db 12, BITE
	db 15, SUPER_FANG
	db 21, HYPER_FANG
	db 27, DOUBLE_EDGE
	db 0

RaticateEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 3, TAIL_WHIP
	db 6, QUICK_ATTACK
	db 9, FOCUS_ENERGY
	db 12, BITE
	db 15, SUPER_FANG
	db 26, HYPER_FANG
	db 42, DOUBLE_EDGE
	db 0

SpearowEvosMoves:
	; Evolutions
	db EV_LEVEL, 20, FEAROW
	db 0
	; Learnset
	db 3, GROWL
	db 8, LEER
	db 11, FOCUS_ENERGY
	db 16, FURY_ATTACK
	db 19, MIRROR_MOVE
	db 27, AGILITY
	db 32, DRILL_PECK
	db 0

FearowEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 3, GROWL
	db 8, LEER
	db 11, FOCUS_ENERGY
	db 16, FURY_ATTACK
	db 19, MIRROR_MOVE
	db 37, AGILITY
	db 47, DRILL_PECK
	db 0

EkansEvosMoves:
	; Evolutions
	db EV_LEVEL, 22, ARBOK
	db 0
	; Learnset
	db 4, LEER
	db 8, ACID
	db 12, BITE
	db 16, HAZE
	db 20, GLARE
	db 28, SLAM
	db 32, SCREECH
	db 36, TOXIC
	db 0

ArbokEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, LEER
	db 9, ACID
	db 12, BITE
	db 16, HAZE
	db 20, GLARE
	db 36, SLAM
	db 44, SCREECH
	db 52, TOXIC
	db 0

PikachuEvosMoves:
	; Evolutions
	db EV_ITEM, THUNDER_STONE, 1, RAICHU
	db 0
	; Learnset
	db 3, TAIL_WHIP
	db 6, QUICK_ATTACK
	db 9, DOUBLE_KICK
	db 12, DOUBLE_TEAM
	db 15, THUNDER_WAVE
	db 18, LIGHT_SCREEN
	db 21, THUNDERBOLT
	db 24, SLAM
	db 27, AGILITY
	db 30, THUNDER
	db 0

RaichuEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db $FF, THUNDERPUNCH ; EVO
	db 0

SandshrewEvosMoves:
	; Evolutions
	db EV_LEVEL, 22, SANDSLASH
	db 0
	; Learnset
	db 4, POISON_STING
	db 8, SAND_ATTACK
	db 12, SWIFT
	db 16, FURY_SWIPES
	db 20, DIG
	db 28, SWORDS_DANCE
	db 32, SLASH
	db 36, EARTHQUAKE
	db 0

SandslashEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, POISON_STING
	db 8, SAND_ATTACK
	db 12, SWIFT
	db 16, FURY_SWIPES
	db 20, DIG
	db 36, SWORDS_DANCE
	db 44, SLASH
	db 52, EARTHQUAKE
	db 0

NidoranFEvosMoves:
	; Evolutions
	db EV_LEVEL, 16, NIDORINA
	db 0
	; Learnset
	db 3, TAIL_WHIP
	db 6, POISON_STING
	db 9, DOUBLE_KICK
	db 12, BITE
	db 18, TOXIC
	db 21, FURY_SWIPES
	db 27, SUPER_FANG
	db 0

NidorinaEvosMoves:
	; Evolutions
	db EV_ITEM, MOON_STONE, 1, NIDOQUEEN
	db 0
	; Learnset
	db 3, TAIL_WHIP
	db 6, POISON_STING
	db 9, DOUBLE_KICK
	db 12, BITE
	db 23, TOXIC
	db 31, FURY_SWIPES
	db 47, SUPER_FANG
	db 0

NidoqueenEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db $FF, BODY_SLAM ; EVO
	db 0

NidoranMEvosMoves:
	; Evolutions
	db EV_LEVEL, 16, NIDORINO
	db 0
	; Learnset
	db 3, FOCUS_ENERGY
	db 6, POISON_STING
	db 9, DOUBLE_KICK
	db 12, HORN_ATTACK
	db 18, TOXIC
	db 21, FURY_ATTACK
	db 27, HORN_DRILL
	db 0

NidorinoEvosMoves:
	; Evolutions
	db EV_ITEM, MOON_STONE, 1, NIDOKING
	db 0
	; Learnset
	db 3, FOCUS_ENERGY
	db 6, POISON_STING
	db 9, DOUBLE_KICK
	db 12, HORN_ATTACK
	db 23, TOXIC
	db 31, FURY_ATTACK
	db 47, HORN_DRILL
	db 0

NidokingEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db $FF, THRASH ; EVO
	db 0

ClefairyEvosMoves:
	; Evolutions
	db EV_ITEM, MOON_STONE, 1, CLEFABLE
	db 0
	; Learnset
	db 4, DEFENSE_CURL
	db 6, SING
	db 10, MINIMIZE
	db 12, DOUBLESLAP
	db 16, AMNESIA
	db 18, METRONOME
	db 24, BODY_SLAM
	db 0

ClefableEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db $FF, METRONOME ; EVO
	db 0

VulpixEvosMoves:
	; Evolutions
	db EV_ITEM, FIRE_STONE, 1, NINETALES
	db 0
	; Learnset
	db 3, TAIL_WHIP
	db 7, EMBER
	db 10, QUICK_ATTACK
	db 14, CONFUSE_RAY
	db 21, FIRE_SPIN
	db 24, FLAMETHROWER
	db 28, ROAR
	db 31, FIRE_BLAST
	db 0

NinetalesEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 0

JigglypuffEvosMoves:
	; Evolutions
	db EV_ITEM, MOON_STONE, 1, WIGGLYTUFF
	db 0
	; Learnset
	db 4, POUND
	db 6, DEFENSE_CURL
	db 10, BIDE
	db 12, DOUBLESLAP
	db 16, DISABLE
	db 18, REST
	db 22, BODY_SLAM
	db 24, MIMIC
	db 28, DOUBLE_EDGE
	db 0

WigglytuffEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 0

ZubatEvosMoves:
	; Evolutions
	db EV_LEVEL, 22, GOLBAT
	db 0
	; Learnset
	db 4, WING_ATTACK
	db 9, BITE
	db 12, SWIFT
	db 17, CONFUSE_RAY
	db 20, HAZE
	db 25, LEECH_LIFE
	db 28, TOXIC
	db 0

GolbatEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, WING_ATTACK
	db 8, BITE
	db 12, SWIFT
	db 17, CONFUSE_RAY
	db 20, HAZE
	db 31, LEECH_LIFE
	db 40, TOXIC
	db 0

OddishEvosMoves:
	; Evolutions
	db EV_LEVEL, 21, GLOOM
	db 0
	; Learnset
	db 4, GROWTH
	db 8, ACID
	db 12, POISONPOWDER
	db 13, STUN_SPORE
	db 14, SLEEP_POWDER
	db 18, RAZOR_LEAF
	db 22, MEGA_DRAIN
	db 26, TOXIC
	db 0

GloomEvosMoves:
	; Evolutions
	db EV_ITEM, LEAF_STONE, 1, VILEPLUME
	db 0
	; Learnset
	db 4, GROWTH
	db 8, ACID
	db 12, POISONPOWDER
	db 13, STUN_SPORE
	db 14, SLEEP_POWDER
	db 18, RAZOR_LEAF
	db 27, MEGA_DRAIN
	db 36, TOXIC
	db 0

VileplumeEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 54, PETAL_DANCE
	db 0

ParasEvosMoves:
	; Evolutions
	db EV_LEVEL, 24, PARASECT
	db 0
	; Learnset
	db 2, SLEEP_POWDER
	db 4, STUN_SPORE
	db 6, POISONPOWDER
	db 9, ABSORB
	db 12, GROWTH
	db 15, FURY_SWIPES
	db 19, SLASH
	db 23, LEECH_LIFE
	db 27, SPORE
	db 0

ParasectEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 2, SLEEP_POWDER
	db 4, STUN_SPORE
	db 6, POISONPOWDER
	db 9, ABSORB
	db 12, GROWTH
	db 15, FURY_SWIPES
	db 19, SLASH
	db 23, LEECH_LIFE
	db 33, SPORE
	db 0

VenonatEvosMoves:
	; Evolutions
	db EV_LEVEL, 31, VENOMOTH
	db 0
	; Learnset
	db 4, DISABLE
	db 8, SUPERSONIC
	db 12, CONFUSION
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 20, PSYBEAM
	db 24, SLEEP_POWDER
	db 28, LEECH_LIFE
	db 32, PSYCHIC_M
	db 0

VenomothEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, DISABLE
	db 8, SUPERSONIC
	db 12, CONFUSION
	db 14, POISONPOWDER
	db 16, STUN_SPORE
	db 20, PSYBEAM
	db 24, SLEEP_POWDER
	db 28, LEECH_LIFE
	db 37, PSYCHIC_M
	db 0

DiglettEvosMoves:
	; Evolutions
	db EV_LEVEL, 26, DUGTRIO
	db 0
	; Learnset
	db 4, SAND_ATTACK
	db 8, GROWL
	db 12, AGILITY
	db 15, FURY_SWIPES
	db 18, DIG
	db 21, SLASH
	db 29, EARTHQUAKE
	db 33, FISSURE
	db 0

DugtrioEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, SAND_ATTACK
	db 8, GROWL
	db 12, AGILITY
	db 15, FURY_SWIPES
	db 18, DIG
	db 21, SLASH
	db 35, EARTHQUAKE
	db 45, FISSURE
	db $FF, TRI_ATTACK ; EVO
	db 0

MeowthEvosMoves:
	; Evolutions
	db EV_LEVEL, 28, PERSIAN
	db 0
	; Learnset
	db 3, BITE
	db 12, PAY_DAY
	db 19, FURY_SWIPES
	db 23, SCREECH
	db 27, SLASH
	db 0

PersianEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 3, BITE
	db 12, PAY_DAY
	db 19, FURY_SWIPES
	db 23, SCREECH
	db 27, SLASH
	db $FF, SWIFT ; EVO
	db 0

PsyduckEvosMoves:
	; Evolutions
	db EV_LEVEL, 33, GOLDUCK
	db 0
	; Learnset
	db 5, TAIL_WHIP
	db 9, WATER_GUN
	db 14, CONFUSION
	db 18, FURY_SWIPES
	db 23, DISABLE
	db 27, PSYBEAM
	db 32, SCREECH
	db 36, SURF
	db 41, AMNESIA
	db 45, HYDRO_PUMP
	db 0

GolduckEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, TAIL_WHIP
	db 9, WATER_GUN
	db 14, CONFUSION
	db 18, FURY_SWIPES
	db 23, DISABLE
	db 27, PSYBEAM
	db 32, SCREECH
	db 42, SURF
	db 53, AMNESIA
	db 63, HYDRO_PUMP
	db 0

MankeyEvosMoves:
	; Evolutions
	db EV_LEVEL, 28, PRIMEAPE
	db 0
	; Learnset
	db 5, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 16, FURY_SWIPES
	db 21, LOW_KICK
	db 24, SEISMIC_TOSS
	db 32, SCREECH
	db 37, THRASH
	db 0

PrimeapeEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 16, FURY_SWIPES
	db 21, LOW_KICK
	db 24, SEISMIC_TOSS
	db 40, SCREECH
	db 49, THRASH
	db $FF, RAGE ; EVO
	db 0

GrowlitheEvosMoves:
	; Evolutions
	db EV_ITEM, FIRE_STONE, 1, ARCANINE
	db 0
	; Learnset
	db 3, EMBER
	db 7, LEER
	db 14, TAKE_DOWN
	db 17, FLAMETHROWER
	db 21, AGILITY
	db 0

ArcanineEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 0

PoliwagEvosMoves:
	; Evolutions
	db EV_LEVEL, 25, POLIWHIRL
	db 0
	; Learnset
	db 4, POUND
	db 8, HYPNOSIS
	db 12, WATER_GUN
	db 16, DOUBLESLAP
	db 21, BUBBLEBEAM
	db 26, LOW_KICK
	db 31, BODY_SLAM
	db 36, HYDRO_PUMP
	db 0

PoliwhirlEvosMoves:
	; Evolutions
	db EV_ITEM, WATER_STONE, 1, POLIWRATH
	db 0
	; Learnset
	db 4, POUND
	db 8, HYPNOSIS
	db 12, WATER_GUN
	db 16, DOUBLESLAP
	db 21, BUBBLEBEAM
	db 30, LOW_KICK
	db 39, BODY_SLAM
	db 48, HYDRO_PUMP
	db 0

PoliwrathEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db $FF, SUBMISSION ; EVO
	db 0

AbraEvosMoves:
	; Evolutions
	db EV_LEVEL, 16, KADABRA
	db 0
	; Learnset
	db 0

KadabraEvosMoves:
	; Evolutions
	db EV_TRADE, 1, ALAKAZAM
	db 0
	; Learnset
	db 6, DISABLE
	db 13, FLASH
	db 19, NIGHT_SHADE
	db 26, SUBSTITUTE
	db 32, REFLECT
	db 39, RECOVER
	db 45, PSYCHIC_M
	db $FF, KINESIS ; EVO
	db $FF, PSYBEAM ; EVO
	db 0

AlakazamEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, DISABLE
	db 13, FLASH
	db 19, NIGHT_SHADE
	db 26, SUBSTITUTE
	db 32, REFLECT
	db 39, RECOVER
	db 45, PSYCHIC_M
	db 0

MachopEvosMoves:
	; Evolutions
	db EV_LEVEL, 28, MACHOKE
	db 0
	; Learnset
	db 4, FOCUS_ENERGY
	db 8, BIDE
	db 12, SEISMIC_TOSS
	db 16, KARATE_CHOP
	db 26, SUBMISSION
	db 0

MachokeEvosMoves:
	; Evolutions
	db EV_TRADE, 1, MACHAMP
	db 0
	; Learnset
	db 4, FOCUS_ENERGY
	db 8, BIDE
	db 12, SEISMIC_TOSS
	db 16, KARATE_CHOP
	db 26, SUBMISSION
	db 0

MachampEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, FOCUS_ENERGY
	db 8, BIDE
	db 12, SEISMIC_TOSS
	db 16, KARATE_CHOP
	db 26, SUBMISSION
	db $FF, STRENGTH ; EVO
	db 0

BellsproutEvosMoves:
	; Evolutions
	db EV_LEVEL, 21, WEEPINBELL
	db 0
	; Learnset
	db 4, GROWTH
	db 8, WRAP
	db 12, ACID
	db 16, SLEEP_POWDER
	db 17, POISONPOWDER
	db 18, STUN_SPORE
	db 22, RAZOR_LEAF
	db 30, SLAM
	db 0

WeepinbellEvosMoves:
	; Evolutions
	db EV_ITEM, LEAF_STONE, 1, VICTREEBEL
	db 0
	; Learnset
	db 4, GROWTH
	db 8, WRAP
	db 12, ACID
	db 16, SLEEP_POWDER
	db 17, POISONPOWDER
	db 18, STUN_SPORE
	db 27, RAZOR_LEAF
	db 45, SLAM
	db 0

VictreebelEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 0

TentacoolEvosMoves:
	; Evolutions
	db EV_LEVEL, 30, TENTACRUEL
	db 0
	; Learnset
	db 4, CONSTRICT
	db 9, SUPERSONIC
	db 13, ACID
	db 18, BUBBLEBEAM
	db 22, WRAP
	db 27, SURF
	db 31, BARRIER
	db 40, SCREECH
	db 45, HYDRO_PUMP
	db 0

TentacruelEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, CONSTRICT
	db 9, SUPERSONIC
	db 13, ACID
	db 18, BUBBLEBEAM
	db 22, WRAP
	db 27, SURF
	db 36, BARRIER
	db 55, SCREECH
	db 65, HYDRO_PUMP
	db 0

GeodudeEvosMoves:
	; Evolutions
	db EV_LEVEL, 25, GRAVELER
	db 0
	; Learnset
	db 3, SAND_ATTACK
	db 6, BIDE
	db 9, ROCK_THROW
	db 15, TAKE_DOWN
	db 19, SELFDESTRUCT
	db 23, ROCK_SLIDE
	db 27, EARTHQUAKE
	db 31, DOUBLE_EDGE
	db 35, EXPLOSION
	db 0

GravelerEvosMoves:
	; Evolutions
	db EV_TRADE, 1, GOLEM
	db 0
	; Learnset
	db 3, SAND_ATTACK
	db 6, BIDE
	db 9, ROCK_THROW
	db 15, TAKE_DOWN
	db 19, SELFDESTRUCT
	db 23, ROCK_SLIDE
	db 31, EARTHQUAKE
	db 39, DOUBLE_EDGE
	db 47, EXPLOSION
	db 0

GolemEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 3, SAND_ATTACK
	db 6, BIDE
	db 9, ROCK_THROW
	db 15, TAKE_DOWN
	db 19, SELFDESTRUCT
	db 23, ROCK_SLIDE
	db 31, EARTHQUAKE
	db 39, DOUBLE_EDGE
	db 47, EXPLOSION
	db 0

PonytaEvosMoves:
	; Evolutions
	db EV_LEVEL, 40, RAPIDASH
	db 0
	; Learnset
	db 5, EMBER
	db 10, QUICK_ATTACK
	db 15, DOUBLE_KICK
	db 20, STOMP
	db 26, FIRE_SPIN
	db 32, AGILITY
	db 38, FIRE_BLAST
	db 44, TAKE_DOWN
	db 0

RapidashEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, EMBER
	db 10, QUICK_ATTACK
	db 15, DOUBLE_KICK
	db 20, STOMP
	db 26, FIRE_SPIN
	db 32, AGILITY
	db 38, FIRE_BLAST
	db 51, TAKE_DOWN
	db $FF, FURY_ATTACK ; EVO
	db 0

SlowpokeEvosMoves:
	; Evolutions
	db EV_LEVEL, 37, SLOWBRO
	db 0
	; Learnset
	db 6, GROWL
	db 12, WATER_GUN
	db 18, CONFUSION
	db 24, DISABLE
	db 30, REST
	db 36, SURF
	db 42, PSYCHIC_M
	db 48, AMNESIA
	db 0

SlowbroEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, GROWL
	db 12, WATER_GUN
	db 18, CONFUSION
	db 24, DISABLE
	db 30, REST
	db 36, SURF
	db 49, PSYCHIC_M
	db 62, AMNESIA
	db $FF, WITHDRAW ; EVO
	db 0

MagnemiteEvosMoves:
	; Evolutions
	db EV_LEVEL, 30, MAGNETON
	db 0
	; Learnset
	db 5, THUNDERSHOCK
	db 10, THUNDER_WAVE
	db 15, SONICBOOM
	db 20, LIGHT_SCREEN
	db 26, THUNDERBOLT
	db 32, SCREECH
	db 44, THUNDER
	db 0

MagnetonEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, THUNDERSHOCK
	db 10, THUNDER_WAVE
	db 15, SONICBOOM
	db 20, LIGHT_SCREEN
	db 26, THUNDERBOLT
	db 36, SCREECH
	db 56, THUNDER
	db $FF, TRI_ATTACK ; EVO
	db 0

FarfetchdEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, FOCUS_ENERGY
	db 9, CUT
	db 13, RAZOR_LEAF
	db 18, FURY_ATTACK
	db 22, AGILITY
	db 27, SLASH
	db 36, SWORDS_DANCE
	db 40, SKY_ATTACK
	db 0

DoduoEvosMoves:
	; Evolutions
	db EV_LEVEL, 31, DODRIO
	db 0
	; Learnset
	db 5, QUICK_ATTACK
	db 10, RAGE
	db 16, FURY_ATTACK
	db 22, AGILITY
	db 27, DRILL_PECK
	db 32, SWORDS_DANCE
	db 38, JUMP_KICK
	db 44, THRASH
	db 0

DodrioEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, QUICK_ATTACK
	db 10, RAGE
	db 16, FURY_ATTACK
	db 22, AGILITY
	db 27, DRILL_PECK
	db 37, SWORDS_DANCE
	db 48, JUMP_KICK
	db 59, THRASH
	db $FF, TRI_ATTACK ; EVO
	db 0

SeelEvosMoves:
	; Evolutions
	db EV_LEVEL, 34, DEWGONG
	db 0
	; Learnset
	db 4, GROWL
	db 20, REST
	db 26, AURORA_BEAM
	db 32, WATERFALL
	db 38, TAKE_DOWN
	db 44, ICE_BEAM
	db 50, DOUBLE_EDGE
	db 0

DewgongEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, GROWL
	db 20, REST
	db 26, AURORA_BEAM
	db 32, WATERFALL
	db 42, TAKE_DOWN
	db 52, ICE_BEAM
	db 62, DOUBLE_EDGE
	db 0

GrimerEvosMoves:
	; Evolutions
	db EV_LEVEL, 38, MUK
	db 0
	; Learnset
	db 6, HARDEN
	db 12, MINIMIZE
	db 18, DISABLE
	db 24, SLUDGE
	db 30, SCREECH
	db 36, TOXIC
	db 42, ACID_ARMOR
	db 0

MukEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, HARDEN
	db 12, MINIMIZE
	db 18, DISABLE
	db 24, SLUDGE
	db 30, SCREECH
	db 36, TOXIC
	db 48, ACID_ARMOR
	db 0

ShellderEvosMoves:
	; Evolutions
	db EV_ITEM, WATER_STONE, 1, CLOYSTER
	db 0
	; Learnset
	db 5, WITHDRAW
	db 9, LEER
	db 18, SUPERSONIC
	db 22, CLAMP
	db 27, AURORA_BEAM
	db 36, ICE_BEAM
	db 45, HYDRO_PUMP
	db 0

CloysterEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db $FF, SPIKE_CANNON ; EVO
	db 0

GastlyEvosMoves:
	; Evolutions
	db EV_LEVEL, 25, HAUNTER
	db 0
	; Learnset
	db 5, CONFUSE_RAY
	db 7, POISON_GAS
	db 12, NIGHT_SHADE
	db 21, TOXIC
	db 33, DREAM_EATER
	db 0

HaunterEvosMoves:
	; Evolutions
	db EV_TRADE, 1, GENGAR
	db 0
	; Learnset
	db 5, CONFUSE_RAY
	db 7, POISON_GAS
	db 12, NIGHT_SHADE
	db 21, TOXIC
	db 45, DREAM_EATER
	db 0

GengarEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, CONFUSE_RAY
	db 7, POISON_GAS
	db 12, NIGHT_SHADE
	db 21, TOXIC
	db 45, DREAM_EATER
	db 0

OnixEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 10, RAGE
	db 15, SCREECH
	db 20, DIG
	db 25, SLAM
	db 30, ROCK_SLIDE
	db 35, EARTHQUAKE
	db 45, DOUBLE_EDGE
	db 0

DrowzeeEvosMoves:
	; Evolutions
	db EV_LEVEL, 26, HYPNO
	db 0
	; Learnset
	db 4, DISABLE
	db 9, CONFUSION
	db 13, POISON_GAS
	db 18, MEDITATE
	db 22, PSYBEAM
	db 27, HEADBUTT
	db 31, PSYCHIC_M
	db 40, DREAM_EATER
	db 0

HypnoEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, DISABLE
	db 9, CONFUSION
	db 13, POISON_GAS
	db 18, MEDITATE
	db 22, PSYBEAM
	db 27, HEADBUTT
	db 36, PSYCHIC_M
	db 55, DREAM_EATER
	db 0

KrabbyEvosMoves:
	; Evolutions
	db EV_LEVEL, 28, KINGLER
	db 0
	; Learnset
	db 5, VICEGRIP
	db 9, LEER
	db 14, HARDEN
	db 18, BUBBLEBEAM
	db 23, STOMP
	db 32, SLAM
	db 36, CRABHAMMER
	db 41, GUILLOTINE
	db 0

KinglerEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, VICEGRIP
	db 9, LEER
	db 14, HARDEN
	db 18, BUBBLEBEAM
	db 23, STOMP
	db 37, SLAM
	db 41, CRABHAMMER
	db 56, GUILLOTINE
	db 0

VoltorbEvosMoves:
	; Evolutions
	db EV_LEVEL, 30, ELECTRODE
	db 0
	; Learnset
	db 3, LIGHT_SCREEN
	db 6, SONICBOOM
	db 9, THUNDERSHOCK
	db 14, SWIFT
	db 19, SELFDESTRUCT
	db 24, SCREECH
	db 31, THUNDERBOLT
	db 45, EXPLOSION
	db 0

ElectrodeEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 3, LIGHT_SCREEN
	db 6, SONICBOOM
	db 9, THUNDERSHOCK
	db 14, SWIFT
	db 19, SELFDESTRUCT
	db 24, SCREECH
	db 36, THUNDERBOLT
	db 60, EXPLOSION
	db 0

ExeggcuteEvosMoves:
	; Evolutions
	db EV_ITEM, LEAF_STONE, 1, EXEGGUTOR
	db 0
	; Learnset
	db 7, HYPNOSIS
	db 14, CONFUSION
	db 16, STUN_SPORE
	db 18, POISONPOWDER
	db 20, SLEEP_POWDER
	db 27, PSYBEAM
	db 34, LEECH_SEED
	db 41, REFLECT
	db 48, SOLARBEAM
	db 0

ExeggutorEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db $FF, STOMP ; EVO
	db 0

CuboneEvosMoves:
	; Evolutions
	db EV_LEVEL, 28, MAROWAK
	db 0
	; Learnset
	db 2, TAIL_WHIP
	db 6, LEER
	db 12, BONE_CLUB
	db 14, HEADBUTT
	db 18, RAGE
	db 24, FOCUS_ENERGY
	db 26, BONEMERANG
	db 30, THRASH
	db 36, DOUBLE_EDGE
	db 0

MarowakEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 2, TAIL_WHIP
	db 6, LEER
	db 12, BONE_CLUB
	db 14, HEADBUTT
	db 18, RAGE
	db 24, FOCUS_ENERGY
	db 26, BONEMERANG
	db 36, THRASH
	db 48, DOUBLE_EDGE
	db $FF, SWORDS_DANCE ; EVO
	db 0

HitmonleeEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, MEDITATE
	db 10, DOUBLE_KICK
	db 30, JUMP_KICK
	db 35, FOCUS_ENERGY
	db 40, MEGA_KICK
	db 45, HI_JUMP_KICK
	db 0

HitmonchanEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, LEER
	db 10, AGILITY
	db 20, SWIFT
	db 25, DIZZY_PUNCH
	db 30, FIRE_PUNCH
	db 30, ICE_PUNCH
	db 30, THUNDERPUNCH
	db 35, FOCUS_ENERGY
	db 40, MEGA_PUNCH
	db 45, COUNTER
	db 0

LickitungEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, WRAP
	db 10, ACID
	db 15, STOMP
	db 20, DISABLE
	db 25, BIND
	db 30, SLAM
	db 35, SCREECH
	db 40, THRASH
	db 0

KoffingEvosMoves:
	; Evolutions
	db EV_LEVEL, 35, WEEZING
	db 0
	; Learnset
	db 6, SMOG
	db 18, SLUDGE
	db 24, SELFDESTRUCT
	db 30, TOXIC
	db 36, HAZE
	db 48, EXPLOSION
	db 0

WeezingEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, SMOG
	db 18, SLUDGE
	db 24, SELFDESTRUCT
	db 30, TOXIC
	db 40, HAZE
	db 60, EXPLOSION
	db 0

RhyhornEvosMoves:
	; Evolutions
	db EV_LEVEL, 42, RHYDON
	db 0
	; Learnset
	db 7, FURY_ATTACK
	db 12, STOMP
	db 19, ROCK_THROW
	db 31, TAKE_DOWN
	db 43, ROCK_SLIDE
	db 48, EARTHQUAKE
	db 55, HORN_DRILL
	db 0

RhydonEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 7, FURY_ATTACK
	db 12, STOMP
	db 19, ROCK_THROW
	db 31, TAKE_DOWN
	db 48, ROCK_SLIDE
	db 54, EARTHQUAKE
	db 67, HORN_DRILL
	db 0

ChanseyEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, DEFENSE_CURL
	db 8, TAIL_WHIP
	db 12, DOUBLESLAP
	db 16, SOFTBOILED
	db 20, MINIMIZE
	db 25, TAKE_DOWN
	db 30, SING
	db 35, EGG_BOMB
	db 40, LIGHT_SCREEN
	db 45, DOUBLE_EDGE
	db 0

TangelaEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 5, SLEEP_POWDER
	db 10, CONFUSION
	db 15, VINE_WHIP
	db 17, POISONPOWDER
	db 22, BIND
	db 27, GROWTH
	db 29, STUN_SPORE
	db 34, MEGA_DRAIN
	db 39, LEECH_SEED
	db 44, SLAM
	db 49, AMNESIA
	db 0

KangaskhanEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 11, TAIL_WHIP
	db 17, BITE
	db 22, RAGE
	db 28, MEGA_PUNCH
	db 33, DIZZY_PUNCH
	db 0

HorseaEvosMoves:
	; Evolutions
	db EV_LEVEL, 32, SEADRA
	db 0
	; Learnset
	db 6, SMOKESCREEN
	db 9, WATER_GUN
	db 15, LEER
	db 18, BUBBLEBEAM
	db 24, FOCUS_ENERGY
	db 27, WATERFALL
	db 33, AGILITY
	db 42, HYDRO_PUMP
	db 0

SeadraEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, SMOKESCREEN
	db 9, WATER_GUN
	db 15, LEER
	db 18, BUBBLEBEAM
	db 24, FOCUS_ENERGY
	db 27, WATERFALL
	db 36, AGILITY
	db 51, HYDRO_PUMP
	db 0

GoldeenEvosMoves:
	; Evolutions
	db EV_LEVEL, 33, SEAKING
	db 0
	; Learnset
	db 4, SUPERSONIC
	db 10, QUICK_ATTACK
	db 14, HORN_ATTACK
	db 20, FURY_ATTACK
	db 24, WATERFALL
	db 30, AGILITY
	db 34, HORN_DRILL
	db 0

SeakingEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, SUPERSONIC
	db 10, QUICK_ATTACK
	db 14, HORN_ATTACK
	db 20, FURY_ATTACK
	db 24, WATERFALL
	db 30, AGILITY
	db 39, HORN_DRILL
	db 0

StaryuEvosMoves:
	; Evolutions
	db EV_ITEM, WATER_STONE, 1, STARMIE
	db 0
	; Learnset
	db 4, PSYWAVE
	db 9, WATER_GUN
	db 13, SWIFT
	db 18, MINIMIZE
	db 22, CONFUSE_RAY
	db 27, BUBBLEBEAM
	db 31, LIGHT_SCREEN
	db 36, PSYCHIC_M
	db 40, RECOVER
	db 45, HYDRO_PUMP
	db 0

StarmieEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 0

MrMimeEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, MEDITATE
	db 10, DOUBLESLAP
	db 16, MIMIC
	db 20, PSYWAVE
	db 30, PSYBEAM
	db 36, LIGHT_SCREEN
	db 36, REFLECT
	db 40, SUBSTITUTE
	db 46, PSYCHIC_M
	db 0

ScytherEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, FOCUS_ENERGY
	db 8, DOUBLE_TEAM
	db 16, WING_ATTACK
	db 20, AGILITY
	db 26, SLASH
	db 32, RAZOR_WIND
	db 44, SWORDS_DANCE
	db 0

JynxEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, LICK
	db 12, CONFUSION
	db 18, SCREECH
	db 22, DOUBLESLAP
	db 26, ICE_PUNCH
	db 30, BODY_SLAM
	db 35, LOVELY_KISS
	db 40, PSYCHIC_M
	db 45, BLIZZARD
	db 0

ElectabuzzEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, QUICK_ATTACK
	db 11, THUNDER_WAVE
	db 17, SWIFT
	db 22, LOW_KICK
	db 28, LIGHT_SCREEN
	db 33, THUNDERPUNCH
	db 39, SCREECH
	db 44, THUNDERBOLT
	db 50, THUNDER
	db 0

MagmarEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, SMOG
	db 11, SMOKESCREEN
	db 22, LOW_KICK
	db 28, FIRE_SPIN
	db 33, FIRE_PUNCH
	db 39, CONFUSE_RAY
	db 44, FLAMETHROWER
	db 50, FIRE_BLAST
	db 0

PinsirEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, BIND
	db 8, SEISMIC_TOSS
	db 12, HARDEN
	db 26, SUBMISSION
	db 32, SWORDS_DANCE
	db 38, THRASH
	db 50, GUILLOTINE
	db 0

TaurosEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, TAIL_WHIP
	db 12, RAGE
	db 18, HORN_ATTACK
	db 24, LEER
	db 30, REST
	db 34, TAKE_DOWN
	db 38, FOCUS_ENERGY
	db 42, THRASH
	db 46, DOUBLE_EDGE
	db 0

MagikarpEvosMoves:
	; Evolutions
	db EV_LEVEL, 20, GYARADOS
	db 0
	; Learnset
	db 15, TACKLE
	db 0

GyaradosEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, LEER
	db 11, DRAGON_RAGE
	db 16, BIND
	db 21, RAGE
	db 31, WATERFALL
	db 46, HYDRO_PUMP
	db 51, HYPER_BEAM
	db $FF, BITE ; EVO
	db 0

LaprasEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, GROWL
	db 13, MIST
	db 26, CONFUSE_RAY
	db 32, BODY_SLAM
	db 39, ICE_BEAM
	db 45, SURF
	db 58, BLIZZARD
	db 65, HYDRO_PUMP
	db 0

DittoEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 0

EeveeEvosMoves:
	; Evolutions
	db EV_ITEM, FIRE_STONE, 1, FLAREON
	db EV_ITEM, THUNDER_STONE, 1, JOLTEON
	db EV_ITEM, WATER_STONE, 1, VAPOREON
	db 0
	; Learnset
	db 3, TAIL_WHIP
	db 6, QUICK_ATTACK
	db 10, DOUBLE_KICK
	db 14, SAND_ATTACK
	db 17, BITE
	db 21, SWIFT
	db 24, TAKE_DOWN
	db 28, DOUBLE_EDGE
	db 0

VaporeonEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 3, TAIL_WHIP
	db 6, QUICK_ATTACK
	db 10, DOUBLE_KICK
	db 14, SAND_ATTACK
	db 17, AURORA_BEAM
	db 21, HAZE
	db 24, ACID_ARMOR
	db 31, HYDRO_PUMP
	db $FF, WATER_GUN ; EVO
	db 0

JolteonEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 3, TAIL_WHIP
	db 6, QUICK_ATTACK
	db 10, DOUBLE_KICK
	db 14, SAND_ATTACK
	db 17, PIN_MISSILE
	db 21, THUNDER_WAVE
	db 24, AGILITY
	db 31, THUNDER
	db $FF, THUNDERSHOCK ; EVO
	db 0

FlareonEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 3, TAIL_WHIP
	db 6, QUICK_ATTACK
	db 10, DOUBLE_KICK
	db 14, SAND_ATTACK
	db 17, FIRE_SPIN
	db 21, SMOG
	db 24, FOCUS_ENERGY
	db 31, FIRE_BLAST ; FLARE BLITZ in Let's go Pikachu, changed so the eeveelutions all have their type move at lvl 31
	db $FF, EMBER ; EVO
	db 0

PorygonEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, SHARPEN
	db 9, PSYBEAM
	db 13, AGILITY
	db 18, BARRIER
	db 22, TRI_ATTACK
	db 27, THUNDER_WAVE
	db 31, CONVERSION
	db 36, RECOVER
	db 40, HYPER_BEAM
	db 0

OmanyteEvosMoves:
	; Evolutions
	db EV_LEVEL, 40, OMASTAR
	db 0
	; Learnset
	db 4, WITHDRAW
	db 11, LEER
	db 15, WATER_GUN
	db 22, BITE
	db 26, ROCK_THROW
	db 37, ROCK_SLIDE
	db 44, HYDRO_PUMP
	db 0

OmastarEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 4, WITHDRAW
	db 11, LEER
	db 15, WATER_GUN
	db 22, BITE
	db 26, ROCK_THROW
	db 37, ROCK_SLIDE
	db 50, HYDRO_PUMP
	db $FF, SPIKE_CANNON ; EVO
	db 0

KabutoEvosMoves:
	; Evolutions
	db EV_LEVEL, 40, KABUTOPS
	db 0
	; Learnset
	db 6, HARDEN
	db 12, LEER
	db 18, ABSORB
	db 30, ROCK_THROW
	db 36, SAND_ATTACK
	db 42, ROCK_SLIDE
	db 48, LEECH_LIFE
	db 0

KabutopsEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, HARDEN
	db 12, LEER
	db 18, ABSORB
	db 30, ROCK_THROW
	db 36, SAND_ATTACK
	db 45, ROCK_SLIDE
	db 54, LEECH_LIFE
	db 63, SWORDS_DANCE
	db $FF, SLASH ; EVO
	db 0

AerodactylEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 7, ROAR
	db 14, SUPERSONIC
	db 21, ROCK_THROW
	db 28, AGILITY
	db 42, ROCK_SLIDE
	db 49, FLY
	db 56, TAKE_DOWN
	db 63, HYPER_BEAM
	db 0

SnorlaxEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 6, DEFENSE_CURL
	db 19, LICK
	db 26, HEADBUTT
	db 32, REST
	db 39, SCREECH
	db 45, AMNESIA
	db 52, BODY_SLAM
	db 0

ArticunoEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 8, MIST
	db 16, LEER
	db 32, ICE_BEAM
	db 40, AGILITY
	db 48, REFLECT
	db 64, BLIZZARD
	db 72, SKY_ATTACK
	db 0

ZapdosEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 8, THUNDER_WAVE
	db 16, LEER
	db 24, DRILL_PECK
	db 32, THUNDERBOLT
	db 40, AGILITY
	db 48, LIGHT_SCREEN
	db 64, THUNDER
	db 72, SKY_ATTACK
	db 0

MoltresEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 8, FIRE_SPIN
	db 16, LEER
	db 32, FLAMETHROWER
	db 40, AGILITY
	db 64, FIRE_BLAST ; it's solarbeam in let's go pikachu, why?!
	db 72, SKY_ATTACK
	db 0

DratiniEvosMoves:
	; Evolutions
	db EV_LEVEL, 30, DRAGONAIR
	db 0
	; Learnset
	db 7, THUNDER_WAVE
	db 14, DRAGON_RAGE
	db 21, AGILITY
	db 35, SLAM
	db 49, HYPER_BEAM
	db 0

DragonairEvosMoves:
	; Evolutions
	db EV_LEVEL, 55, DRAGONITE
	db 0
	; Learnset
	db 7, THUNDER_WAVE
	db 14, DRAGON_RAGE
	db 21, AGILITY
	db 40, SLAM
	db 64, HYPER_BEAM
	db 0

DragoniteEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 7, THUNDER_WAVE
	db 14, DRAGON_RAGE
	db 21, AGILITY
	db 40, SLAM
	db 70, HYPER_BEAM
	db $FF, WING_ATTACK ; EVO
	db 0

MewtwoEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 11, MIST
	db 22, PSYBEAM
	db 33, SWIFT
	db 44, AMNESIA
	db 55, RECOVER
	db 66, PSYCHIC_M
	db 77, BARRIER
	db 88, AGILITY
	db 0

MewEvosMoves:
	; Evolutions
	db 0
	; Learnset
	db 11, SWIFT
	db 22, AMNESIA
	db 33, PSYWAVE
	db 44, BARRIER
	db 55, MEGA_PUNCH
	db 66, METRONOME
	db 77, PSYCHIC_M
	; would be cool to have a lvl 88 move, nasty plot in let's go pikachu (+2 sp.atk)
	db 99, TRANSFORM
	db 0
