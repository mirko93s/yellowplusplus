PokedexEntryPointers:
	table_width 2, PokedexEntryPointers
	dw BulbasaurDexEntry
	dw IvysaurDexEntry
	dw VenusaurDexEntry
	dw CharmanderDexEntry
	dw CharmeleonDexEntry
	dw CharizardDexEntry
	dw SquirtleDexEntry
	dw WartortleDexEntry
	dw BlastoiseDexEntry
	dw CaterpieDexEntry
	dw MetapodDexEntry
	dw ButterfreeDexEntry
	dw WeedleDexEntry
	dw KakunaDexEntry
	dw BeedrillDexEntry
	dw PidgeyDexEntry
	dw PidgeottoDexEntry
	dw PidgeotDexEntry
	dw RattataDexEntry
	dw RaticateDexEntry
	dw SpearowDexEntry
	dw FearowDexEntry
	dw EkansDexEntry
	dw ArbokDexEntry
	dw PikachuDexEntry
	dw RaichuDexEntry
	dw SandshrewDexEntry
	dw SandslashDexEntry
	dw NidoranFDexEntry
	dw NidorinaDexEntry
	dw NidoqueenDexEntry
	dw NidoranMDexEntry
	dw NidorinoDexEntry
	dw NidokingDexEntry
	dw ClefairyDexEntry
	dw ClefableDexEntry
	dw VulpixDexEntry
	dw NinetalesDexEntry
	dw JigglypuffDexEntry
	dw WigglytuffDexEntry
	dw ZubatDexEntry
	dw GolbatDexEntry
	dw OddishDexEntry
	dw GloomDexEntry
	dw VileplumeDexEntry
	dw ParasDexEntry
	dw ParasectDexEntry
	dw VenonatDexEntry
	dw VenomothDexEntry
	dw DiglettDexEntry
	dw DugtrioDexEntry
	dw MeowthDexEntry
	dw PersianDexEntry
	dw PsyduckDexEntry
	dw GolduckDexEntry
	dw MankeyDexEntry
	dw PrimeapeDexEntry
	dw GrowlitheDexEntry
	dw ArcanineDexEntry
	dw PoliwagDexEntry
	dw PoliwhirlDexEntry
	dw PoliwrathDexEntry
	dw AbraDexEntry
	dw KadabraDexEntry
	dw AlakazamDexEntry
	dw MachopDexEntry
	dw MachokeDexEntry
	dw MachampDexEntry
	dw BellsproutDexEntry
	dw WeepinbellDexEntry
	dw VictreebelDexEntry
	dw TentacoolDexEntry
	dw TentacruelDexEntry
	dw GeodudeDexEntry
	dw GravelerDexEntry
	dw GolemDexEntry
	dw PonytaDexEntry
	dw RapidashDexEntry
	dw SlowpokeDexEntry
	dw SlowbroDexEntry
	dw MagnemiteDexEntry
	dw MagnetonDexEntry
	dw FarfetchdDexEntry
	dw DoduoDexEntry
	dw DodrioDexEntry
	dw SeelDexEntry
	dw DewgongDexEntry
	dw GrimerDexEntry
	dw MukDexEntry
	dw ShellderDexEntry
	dw CloysterDexEntry
	dw GastlyDexEntry
	dw HaunterDexEntry
	dw GengarDexEntry
	dw OnixDexEntry
	dw DrowzeeDexEntry
	dw HypnoDexEntry
	dw KrabbyDexEntry
	dw KinglerDexEntry
	dw VoltorbDexEntry
	dw ElectrodeDexEntry
	dw ExeggcuteDexEntry
	dw ExeggutorDexEntry
	dw CuboneDexEntry
	dw MarowakDexEntry
	dw HitmonleeDexEntry
	dw HitmonchanDexEntry
	dw LickitungDexEntry
	dw KoffingDexEntry
	dw WeezingDexEntry
	dw RhyhornDexEntry
	dw RhydonDexEntry
	dw ChanseyDexEntry
	dw TangelaDexEntry
	dw KangaskhanDexEntry
	dw HorseaDexEntry
	dw SeadraDexEntry
	dw GoldeenDexEntry
	dw SeakingDexEntry
	dw StaryuDexEntry
	dw StarmieDexEntry
	dw MrMimeDexEntry
	dw ScytherDexEntry
	dw JynxDexEntry
	dw ElectabuzzDexEntry
	dw MagmarDexEntry
	dw PinsirDexEntry
	dw TaurosDexEntry
	dw MagikarpDexEntry
	dw GyaradosDexEntry
	dw LaprasDexEntry
	dw DittoDexEntry
	dw EeveeDexEntry
	dw VaporeonDexEntry
	dw JolteonDexEntry
	dw FlareonDexEntry
	dw PorygonDexEntry
	dw OmanyteDexEntry
	dw OmastarDexEntry
	dw KabutoDexEntry
	dw KabutopsDexEntry
	dw AerodactylDexEntry
	dw SnorlaxDexEntry
	dw ArticunoDexEntry
	dw ZapdosDexEntry
	dw MoltresDexEntry
	dw DratiniDexEntry
	dw DragonairDexEntry
	dw DragoniteDexEntry
	dw MewtwoDexEntry
	dw MewDexEntry
	assert_table_length NUM_POKEMON_INDEXES

; string: species name
; height in "meters,decimeters"
; weight in tenths of kilograms
; text entry

BulbasaurDexEntry:
	db "Seed@"
	db 0,7
	dw 69
	text_far _BulbasaurDexEntry
	text_end

IvysaurDexEntry:
	db "Seed@"
	db 1,0
	dw 130
	text_far _IvysaurDexEntry
	text_end

VenusaurDexEntry:
	db "Seed@"
	db 2,0
	dw 1000
	text_far _VenusaurDexEntry
	text_end

CharmanderDexEntry:
	db "Lizard@"
	db 0,6
	dw 85
	text_far _CharmanderDexEntry
	text_end

CharmeleonDexEntry:
	db "Flame@"
	db 1,7
	dw 190
	text_far _CharmeleonDexEntry
	text_end

CharizardDexEntry:
	db "Flame@"
	db 1,7
	dw 905
	text_far _CharizardDexEntry
	text_end

SquirtleDexEntry:
	db "Tinyturtle@"
	db 0,5
	dw 90
	text_far _SquirtleDexEntry
	text_end

WartortleDexEntry:
	db "Turtle@"
	db 1,0
	dw 225
	text_far _WartortleDexEntry
	text_end

BlastoiseDexEntry:
	db "Shellfish@"
	db 1,6
	dw 855
	text_far _BlastoiseDexEntry
	text_end

CaterpieDexEntry:
	db "Worm@"
	db 0,3
	dw 29
	text_far _CaterpieDexEntry
	text_end

MetapodDexEntry:
	db "Cocoon@"
	db 0,7
	dw 99
	text_far _MetapodDexEntry
	text_end

ButterfreeDexEntry:
	db "Butterfly@"
	db 1,1
	dw 320
	text_far _ButterfreeDexEntry
	text_end

WeedleDexEntry:
	db "Hairy Bug@"
	db 0,3
	dw 32
	text_far _WeedleDexEntry
	text_end

KakunaDexEntry:
	db "Cocoon@"
	db 0,6
	dw 100
	text_far _KakunaDexEntry
	text_end

BeedrillDexEntry:
	db "Poison Bee@"
	db 1,0
	dw 295
	text_far _BeedrillDexEntry
	text_end

PidgeyDexEntry:
	db "Tiny Bird@"
	db 0,3
	dw 18
	text_far _PidgeyDexEntry
	text_end

PidgeottoDexEntry:
	db "Bird@"
	db 1,1
	dw 300
	text_far _PidgeottoDexEntry
	text_end

PidgeotDexEntry:
	db "Bird@"
	db 1,5
	dw 395
	text_far _PidgeotDexEntry
	text_end

RattataDexEntry:
	db "Rat@"
	db 0,3
	dw 35
	text_far _RattataDexEntry
	text_end

RaticateDexEntry:
	db "Rat@"
	db 0,7
	dw 185
	text_far _RaticateDexEntry
	text_end

SpearowDexEntry:
	db "Tiny Bird@"
	db 0,4
	dw 20
	text_far _SpearowDexEntry
	text_end

FearowDexEntry:
	db "Beak@"
	db 1,2
	dw 380
	text_far _FearowDexEntry
	text_end

EkansDexEntry:
	db "Snake@"
	db 2,0
	dw 69
	text_far _EkansDexEntry
	text_end

ArbokDexEntry:
	db "Cobra@"
	db 3,5
	dw 650
	text_far _ArbokDexEntry
	text_end

PikachuDexEntry:
	db "Mouse@"
	db 0,4
	dw 6
	text_far _PikachuDexEntry
	text_end

RaichuDexEntry:
	db "Mouse@"
	db 0,8
	dw 300
	text_far _RaichuDexEntry
	text_end

SandshrewDexEntry:
	db "Mouse@"
	db 0,6
	dw 120
	text_far _SandshrewDexEntry
	text_end

SandslashDexEntry:
	db "Mouse@"
	db 1,0
	dw 295
	text_far _SandslashDexEntry
	text_end

NidoranFDexEntry:
	db "Poison Pin@"
	db 0,4
	dw 70
	text_far _NidoranFDexEntry
	text_end

NidorinaDexEntry:
	db "Poison Pin@"
	db 0,8
	dw 200
	text_far _NidorinaDexEntry
	text_end

NidoqueenDexEntry:
	db "Drill@"
	db 1,3
	dw 600
	text_far _NidoqueenDexEntry
	text_end

NidoranMDexEntry:
	db "Poison Pin@"
	db 0,5
	dw 90
	text_far _NidoranMDexEntry
	text_end

NidorinoDexEntry:
	db "Poison Pin@"
	db 0,9
	dw 195
	text_far _NidorinoDexEntry
	text_end

NidokingDexEntry:
	db "Drill@"
	db 1,4
	dw 620
	text_far _NidokingDexEntry
	text_end

ClefairyDexEntry:
	db "Fairy@"
	db 0,6
	dw 75
	text_far _ClefairyDexEntry
	text_end

ClefableDexEntry:
	db "Fairy@"
	db 1,3
	dw 400
	text_far _ClefableDexEntry
	text_end

VulpixDexEntry:
	db "Fox@"
	db 0,6
	dw 99
	text_far _VulpixDexEntry
	text_end

NinetalesDexEntry:
	db "Fox@"
	db 1,1
	dw 199
	text_far _NinetalesDexEntry
	text_end

JigglypuffDexEntry:
	db "Balloon@"
	db 0,5
	dw 55
	text_far _JigglypuffDexEntry
	text_end

WigglytuffDexEntry:
	db "Balloon@"
	db 1,0
	dw 120
	text_far _WigglytuffDexEntry
	text_end

ZubatDexEntry:
	db "Bat@"
	db 0,8
	dw 75
	text_far _ZubatDexEntry
	text_end

GolbatDexEntry:
	db "Bat@"
	db 1,6
	dw 550
	text_far _GolbatDexEntry
	text_end

OddishDexEntry:
	db "Weed@"
	db 0,5
	dw 54
	text_far _OddishDexEntry
	text_end

GloomDexEntry:
	db "Weed@"
	db 0,8
	dw 86
	text_far _GloomDexEntry
	text_end

VileplumeDexEntry:
	db "Flower@"
	db 1,2
	dw 186
	text_far _VileplumeDexEntry
	text_end

ParasDexEntry:
	db "Mushroom@"
	db 0,3
	dw 54
	text_far _ParasDexEntry
	text_end

ParasectDexEntry:
	db "Mushroom@"
	db 1,0
	dw 295
	text_far _ParasectDexEntry
	text_end

VenonatDexEntry:
	db "Insect@"
	db 1,0
	dw 300
	text_far _VenonatDexEntry
	text_end

VenomothDexEntry:
	db "Poisonmoth@"
	db 1,5
	dw 125
	text_far _VenomothDexEntry
	text_end

DiglettDexEntry:
	db "Mole@"
	db 0,2
	dw 8
	text_far _DiglettDexEntry
	text_end

DugtrioDexEntry:
	db "Mole@"
	db 0,7
	dw 333
	text_far _DugtrioDexEntry
	text_end

MeowthDexEntry:
	db "Scratchcat@"
	db 0,4
	dw 42
	text_far _MeowthDexEntry
	text_end

PersianDexEntry:
	db "Classy Cat@"
	db 1,0
	dw 320
	text_far _PersianDexEntry
	text_end

PsyduckDexEntry:
	db "Duck@"
	db 0,8
	dw 196
	text_far _PsyduckDexEntry
	text_end

GolduckDexEntry:
	db "Duck@"
	db 1,7
	dw 766
	text_far _GolduckDexEntry
	text_end

MankeyDexEntry:
	db "Pig Monkey@"
	db 0,5
	dw 280
	text_far _MankeyDexEntry
	text_end

PrimeapeDexEntry:
	db "Pig Monkey@"
	db 1,0
	dw 320
	text_far _PrimeapeDexEntry
	text_end

GrowlitheDexEntry:
	db "Puppy@"
	db 0,7
	dw 190
	text_far _GrowlitheDexEntry
	text_end

ArcanineDexEntry:
	db "Legendary@"
	db 1,9
	dw 1550
	text_far _ArcanineDexEntry
	text_end

PoliwagDexEntry:
	db "Tadpole@"
	db 0,6
	dw 124
	text_far _PoliwagDexEntry
	text_end

PoliwhirlDexEntry:
	db "Tadpole@"
	db 1,0
	dw 200
	text_far _PoliwhirlDexEntry
	text_end

PoliwrathDexEntry:
	db "Tadpole@"
	db 1,3
	dw 540
	text_far _PoliwrathDexEntry
	text_end

AbraDexEntry:
	db "Psi@"
	db 0,9
	dw 195
	text_far _AbraDexEntry
	text_end

KadabraDexEntry:
	db "Psi@"
	db 1,3
	dw 565
	text_far _KadabraDexEntry
	text_end

AlakazamDexEntry:
	db "Psi@"
	db 1,5
	dw 480
	text_far _AlakazamDexEntry
	text_end

MachopDexEntry:
	db "Superpower@"
	db 0,8
	dw 195
	text_far _MachopDexEntry
	text_end

MachokeDexEntry:
	db "Superpower@"
	db 1,5
	dw 705
	text_far _MachokeDexEntry
	text_end

MachampDexEntry:
	db "Superpower@"
	db 1,6
	dw 1300
	text_far _MachampDexEntry
	text_end

BellsproutDexEntry:
	db "Flower@"
	db 0,7
	dw 40
	text_far _BellsproutDexEntry
	text_end

WeepinbellDexEntry:
	db "Flycatcher@"
	db 1,0
	dw 64
	text_far _WeepinbellDexEntry
	text_end

VictreebelDexEntry:
	db "Flycatcher@"
	db 1,7
	dw 155
	text_far _VictreebelDexEntry
	text_end

TentacoolDexEntry:
	db "Jellyfish@"
	db 0,9
	dw 455
	text_far _TentacoolDexEntry
	text_end

TentacruelDexEntry:
	db "Jellyfish@"
	db 1,6
	dw 550
	text_far _TentacruelDexEntry
	text_end

GeodudeDexEntry:
	db "Rock@"
	db 0,4
	dw 200
	text_far _GeodudeDexEntry
	text_end

GravelerDexEntry:
	db "Rock@"
	db 1,0
	dw 1050
	text_far _GravelerDexEntry
	text_end

GolemDexEntry:
	db "Megaton@"
	db 1,4
	dw 3000
	text_far _GolemDexEntry
	text_end

PonytaDexEntry:
	db "Fire Horse@"
	db 1,0
	dw 300
	text_far _PonytaDexEntry
	text_end

RapidashDexEntry:
	db "Fire Horse@"
	db 1,7
	dw 950
	text_far _RapidashDexEntry
	text_end

SlowpokeDexEntry:
	db "Dopey@"
	db 1,2
	dw 360
	text_far _SlowpokeDexEntry
	text_end

SlowbroDexEntry:
	db "Hermitcrab@"
	db 1,6
	dw 785
	text_far _SlowbroDexEntry
	text_end

MagnemiteDexEntry:
	db "Magnet@"
	db 0,3
	dw 60
	text_far _MagnemiteDexEntry
	text_end

MagnetonDexEntry:
	db "Magnet@"
	db 1,0
	dw 600
	text_far _MagnetonDexEntry
	text_end

FarfetchdDexEntry:
	db "Wild Duck@"
	db 0,8
	dw 150
	text_far _FarfetchdDexEntry
	text_end

DoduoDexEntry:
	db "Twin Bird@"
	db 1,4
	dw 392
	text_far _DoduoDexEntry
	text_end

DodrioDexEntry:
	db "Triplebird@"
	db 1,8
	dw 852
	text_far _DodrioDexEntry
	text_end

SeelDexEntry:
	db "Sea Lion@"
	db 1,1
	dw 900
	text_far _SeelDexEntry
	text_end

DewgongDexEntry:
	db "Sea Lion@"
	db 1,7
	dw 1200
	text_far _DewgongDexEntry
	text_end

GrimerDexEntry:
	db "Sludge@"
	db 0,9
	dw 300
	text_far _GrimerDexEntry
	text_end

MukDexEntry:
	db "Sludge@"
	db 1,2
	dw 300
	text_far _MukDexEntry
	text_end

ShellderDexEntry:
	db "Bivalve@"
	db 0,3
	dw 40
	text_far _ShellderDexEntry
	text_end

CloysterDexEntry:
	db "Bivalve@"
	db 1,5
	dw 1325
	text_far _CloysterDexEntry
	text_end

GastlyDexEntry:
	db "Gas@"
	db 1,3
	dw 1
	text_far _GastlyDexEntry
	text_end

HaunterDexEntry:
	db "Gas@"
	db 1,6
	dw 1
	text_far _HaunterDexEntry
	text_end

GengarDexEntry:
	db "Shadow@"
	db 1,5
	dw 405
	text_far _GengarDexEntry
	text_end

OnixDexEntry:
	db "Rock Snake@"
	db 8,8
	dw 2100
	text_far _OnixDexEntry
	text_end

DrowzeeDexEntry:
	db "Hypnosis@"
	db 1,0
	dw 324
	text_far _DrowzeeDexEntry
	text_end

HypnoDexEntry:
	db "Hypnosis@"
	db 1,6
	dw 756
	text_far _HypnoDexEntry
	text_end

KrabbyDexEntry:
	db "River Crab@"
	db 0,4
	dw 65
	text_far _KrabbyDexEntry
	text_end

KinglerDexEntry:
	db "Pincer@"
	db 1,3
	dw 600
	text_far _KinglerDexEntry
	text_end

VoltorbDexEntry:
	db "Ball@"
	db 0,5
	dw 104
	text_far _VoltorbDexEntry
	text_end

ElectrodeDexEntry:
	db "Ball@"
	db 1,2
	dw 666
	text_far _ElectrodeDexEntry
	text_end

ExeggcuteDexEntry:
	db "Egg@"
	db 0,4
	dw 25
	text_far _ExeggcuteDexEntry
	text_end

ExeggutorDexEntry:
	db "Coconut@"
	db 2,0
	dw 1200
	text_far _ExeggutorDexEntry
	text_end

CuboneDexEntry:
	db "Lonely@"
	db 0,4
	dw 65
	text_far _CuboneDexEntry
	text_end

MarowakDexEntry:
	db "Bonekeeper@"
	db 1,0
	dw 450
	text_far _MarowakDexEntry
	text_end

HitmonleeDexEntry:
	db "Kicking@"
	db 1,5
	dw 498
	text_far _HitmonleeDexEntry
	text_end

HitmonchanDexEntry:
	db "Punching@"
	db 1,4
	dw 502
	text_far _HitmonchanDexEntry
	text_end

LickitungDexEntry:
	db "Licking@"
	db 1,2
	dw 655
	text_far _LickitungDexEntry
	text_end

KoffingDexEntry:
	db "Poison Gas@"
	db 0,6
	dw 10
	text_far _KoffingDexEntry
	text_end

WeezingDexEntry:
	db "Poison Gas@"
	db 1,2
	dw 95
	text_far _WeezingDexEntry
	text_end

RhyhornDexEntry:
	db "Spikes@"
	db 1,0
	dw 1150
	text_far _RhyhornDexEntry
	text_end

RhydonDexEntry:
	db "Drill@"
	db 1,9
	dw 1200
	text_far _RhydonDexEntry
	text_end

ChanseyDexEntry:
	db "Egg@"
	db 1,1
	dw 346
	text_far _ChanseyDexEntry
	text_end

TangelaDexEntry:
	db "Vine@"
	db 1,0
	dw 350
	text_far _TangelaDexEntry
	text_end

KangaskhanDexEntry:
	db "Parent@"
	db 2,2
	dw 800
	text_far _KangaskhanDexEntry
	text_end

HorseaDexEntry:
	db "Dragon@"
	db 0,4
	dw 80
	text_far _HorseaDexEntry
	text_end

SeadraDexEntry:
	db "Dragon@"
	db 1,2
	dw 250
	text_far _SeadraDexEntry
	text_end

GoldeenDexEntry:
	db "Goldfish@"
	db 0,6
	dw 150
	text_far _GoldeenDexEntry
	text_end

SeakingDexEntry:
	db "Goldfish@"
	db 1,3
	dw 390
	text_far _SeakingDexEntry
	text_end

StaryuDexEntry:
	db "Starshape@"
	db 0,8
	dw 345
	text_far _StaryuDexEntry
	text_end

StarmieDexEntry:
	db "Mysterious@"
	db 1,1
	dw 800
	text_far _StarmieDexEntry
	text_end

MrMimeDexEntry:
	db "Barrier@"
	db 1,4
	dw 568
	text_far _MrMimeDexEntry
	text_end

ScytherDexEntry:
	db "Mantis@"
	db 1,5
	dw 560
	text_far _ScytherDexEntry
	text_end

JynxDexEntry:
	db "Humanshape@"
	db 1,4
	dw 406
	text_far _JynxDexEntry
	text_end

ElectabuzzDexEntry:
	db "Electric@"
	db 1,1
	dw 300
	text_far _ElectabuzzDexEntry
	text_end

MagmarDexEntry:
	db "Spitfire@"
	db 1,3
	dw 445
	text_far _MagmarDexEntry
	text_end

PinsirDexEntry:
	db "Stagbeetle@"
	db 1,5
	dw 550
	text_far _PinsirDexEntry
	text_end

TaurosDexEntry:
	db "Wild Bull@"
	db 1,4
	dw 884
	text_far _TaurosDexEntry
	text_end

MagikarpDexEntry:
	db "Fish@"
	db 0,9
	dw 100
	text_far _MagikarpDexEntry
	text_end

GyaradosDexEntry:
	db "Atrocious@"
	db 6,5
	dw 3050
	text_far _GyaradosDexEntry
	text_end

LaprasDexEntry:
	db "Transport@"
	db 2,5
	dw 2200
	text_far _LaprasDexEntry
	text_end

DittoDexEntry:
	db "Transform@"
	db 0,3
	dw 40
	text_far _DittoDexEntry
	text_end

EeveeDexEntry:
	db "Evolution@"
	db 0,3
	dw 65
	text_far _EeveeDexEntry
	text_end

VaporeonDexEntry:
	db "Bubble Jet@"
	db 1,0
	dw 290
	text_far _VaporeonDexEntry
	text_end

JolteonDexEntry:
	db "Lightning@"
	db 0,8
	dw 245
	text_far _JolteonDexEntry
	text_end

FlareonDexEntry:
	db "Flame@"
	db 0,9
	dw 250
	text_far _FlareonDexEntry
	text_end

PorygonDexEntry:
	db "Virtual@"
	db 0,8
	dw 365
	text_far _PorygonDexEntry
	text_end

OmanyteDexEntry:
	db "Spiral@"
	db 0,4
	dw 75
	text_far _OmanyteDexEntry
	text_end

OmastarDexEntry:
	db "Spiral@"
	db 1,0
	dw 350
	text_far _OmastarDexEntry
	text_end

KabutoDexEntry:
	db "Shellfish@"
	db 0,5
	dw 115
	text_far _KabutoDexEntry
	text_end

KabutopsDexEntry:
	db "Shellfish@"
	db 1,3
	dw 405
	text_far _KabutopsDexEntry
	text_end

AerodactylDexEntry:
	db "Fossil@"
	db 1,8
	dw 590
	text_far _AerodactylDexEntry
	text_end

SnorlaxDexEntry:
	db "Sleeping@"
	db 2,1
	dw 4600
	text_far _SnorlaxDexEntry
	text_end

ArticunoDexEntry:
	db "Freeze@"
	db 1,7
	dw 554
	text_far _ArticunoDexEntry
	text_end

ZapdosDexEntry:
	db "Electric@"
	db 1,6
	dw 526
	text_far _ZapdosDexEntry
	text_end

MoltresDexEntry:
	db "Flame@"
	db 2,0
	dw 600
	text_far _MoltresDexEntry
	text_end

DratiniDexEntry:
	db "Dragon@"
	db 1,8
	dw 33
	text_far _DratiniDexEntry
	text_end

DragonairDexEntry:
	db "Dragon@"
	db 4,0
	dw 165
	text_far _DragonairDexEntry
	text_end

DragoniteDexEntry:
	db "Dragon@"
	db 2,2
	dw 2100
	text_far _DragoniteDexEntry
	text_end

MewtwoDexEntry:
	db "Genetic@"
	db 2,0
	dw 1220
	text_far _MewtwoDexEntry
	text_end

MewDexEntry:
	db "New Specie@"
	db 0,4
	dw 40
	text_far _MewDexEntry
	text_end

; MissingNoDexEntry:
; 	db "???@"
; 	db 10 ; 1.0 m
; 	dw 100 ; 10.0 kg
; 	db "コメント　さくせいちゅう@" ; コメント作成中 (Comment to be written)
