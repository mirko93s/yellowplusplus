; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemPrices (see data/items/prices.asm)
; - TechnicalMachinePrices (see data/items/tm_prices.asm)
; - KeyItemFlags (see data/items/key_items.asm)
; - ItemUsePtrTable (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM       ; $00
	const MASTER_BALL   ; $01
	const ULTRA_BALL    ; $02
	const GREAT_BALL    ; $03
	const POKE_BALL     ; $04
	const TOWN_MAP      ; $05
	const BICYCLE       ; $06
	const SURFBOARD     ; $07 buggy?
	const SAFARI_BALL   ; $08
	const POKEDEX       ; $09
	const MOON_STONE    ; $0A
	const ANTIDOTE      ; $0B
	const BURN_HEAL     ; $0C
	const ICE_HEAL      ; $0D
	const AWAKENING     ; $0E
	const PARLYZ_HEAL   ; $0F
	const FULL_RESTORE  ; $10
	const MAX_POTION    ; $11
	const HYPER_POTION  ; $12
	const SUPER_POTION  ; $13
	const POTION        ; $14
	const BOULDERBADGE  ; $15
	const CASCADEBADGE  ; $16
DEF SAFARI_BAIT EQU $15 ; overload
DEF SAFARI_ROCK EQU $16 ; overload
	const THUNDERBADGE  ; $17
	const RAINBOWBADGE  ; $18
	const SOULBADGE     ; $19
	const MARSHBADGE    ; $1A
	const VOLCANOBADGE  ; $1B
	const EARTHBADGE    ; $1C
	const ESCAPE_ROPE   ; $1D
	const REPEL         ; $1E
	const OLD_AMBER     ; $1F
	const FIRE_STONE    ; $20
	const THUNDER_STONE ; $21
	const WATER_STONE   ; $22
	const HP_UP         ; $23
	const PROTEIN       ; $24
	const IRON          ; $25
	const CARBOS        ; $26
	const CALCIUM       ; $27
	const ZINC          ; $28
	const RARE_CANDY    ; $29
	const DOME_FOSSIL   ; $2A
	const HELIX_FOSSIL  ; $2B
	const SECRET_KEY    ; $2C
	const BIKE_VOUCHER  ; $2D
	const X_ACCURACY    ; $2E
	const LEAF_STONE    ; $2F
	const CARD_KEY      ; $30
	const NUGGET        ; $31
	const PP_UP_2       ; $32
	const POKE_DOLL     ; $33
	const FULL_HEAL     ; $34
	const REVIVE        ; $35
	const MAX_REVIVE    ; $36
	const GUARD_SPEC    ; $37
	const SUPER_REPEL   ; $38
	const MAX_REPEL     ; $39
	const DIRE_HIT      ; $3A
	const COIN          ; $3B
	const FRESH_WATER   ; $3C
	const SODA_POP      ; $3D
	const LEMONADE      ; $3E
	const S_S_TICKET    ; $3F
	const GOLD_TEETH    ; $40
	const X_ATTACK      ; $41
	const X_DEFEND      ; $42
	const X_SPEED       ; $43
	const X_SP_ATK      ; $44
	const X_SP_DEF      ; $45
	const COIN_CASE     ; $46
	const OAKS_PARCEL   ; $47
	const ITEMFINDER    ; $48
	const SILPH_SCOPE   ; $49
	const POKE_FLUTE    ; $4A
	const LIFT_KEY      ; $4B
	const EXP_ALL       ; $4C
	const OLD_ROD       ; $4D
	const GOOD_ROD      ; $4E
	const SUPER_ROD     ; $4F
	const PP_UP         ; $50
	const ETHER         ; $51
	const MAX_ETHER     ; $52
	const ELIXER        ; $53
	const MAX_ELIXER    ; $54
DEF NUM_ITEMS EQU const_value - 1

; elevator floors use item IDs
	const FLOOR_B2F     ; $55
	const FLOOR_B1F     ; $56
	const FLOOR_1F      ; $57
	const FLOOR_2F      ; $58
	const FLOOR_3F      ; $59
	const FLOOR_4F      ; $5A
	const FLOOR_5F      ; $5B
	const FLOOR_6F      ; $5C
	const FLOOR_7F      ; $5D
	const FLOOR_8F      ; $5E
	const FLOOR_9F      ; $5F
	const FLOOR_10F     ; $60
	const FLOOR_11F     ; $61
	const FLOOR_B4F     ; $62
DEF NUM_FLOORS EQU const_value - 1 - NUM_ITEMS

	const_next $C4

; HMs are defined before TMs, so the actual number of TM definitions
; is not yet available. The TM quantity is hard-coded here and must
; match the actual number below.
DEF NUM_TMS EQU 50

DEF __tmhm_value__ = NUM_TMS + 1

MACRO add_tmnum
	DEF \1_TMNUM EQU __tmhm_value__
	DEF __tmhm_value__ += 1
ENDM

MACRO add_hm
; Defines three constants:
; - HM_\1: the item id, starting at $C4
; - \1_TMNUM: the learnable TM/HM flag, starting at 51
; - HM##_MOVE: alias for the move id, equal to the value of \1
	const HM_\1
	DEF HM_VALUE = __tmhm_value__ - NUM_TMS
	DEF HM{02d:HM_VALUE}_MOVE EQU \1
	add_tmnum \1
ENDM

DEF HM01 EQU const_value
	add_hm CUT          ; $C4
	add_hm FLY          ; $C5
	add_hm SURF         ; $C6
	add_hm STRENGTH     ; $C7
	add_hm FLASH        ; $C8
DEF NUM_HMS EQU const_value - HM01

DEF __tmhm_value__ = 1

MACRO add_tm
; Defines three constants:
; - TM_\1: the item id, starting at $C9
; - \1_TMNUM: the learnable TM/HM flag, starting at 1
; - TM##_MOVE: alias for the move id, equal to the value of \1
	const TM_\1
	DEF TM{02d:__tmhm_value__}_MOVE EQU \1
	add_tmnum \1
ENDM

DEF TM01 EQU const_value
	add_tm MEGA_PUNCH   ; $C9 ; MtMoonB2F
	add_tm RAZOR_WIND   ; $CA ; RocketHideoutB4F
	add_tm SWORDS_DANCE ; $CB ; SilphCo7F
	add_tm WHIRLWIND    ; $CC ; Route4
	add_tm MEGA_KICK    ; $CD ; VictoryRoad2F
	add_tm TOXIC        ; $CE ; FuchsiaGym
	add_tm HORN_DRILL   ; $CF ; RocketHideoutB2F
	add_tm BODY_SLAM    ; $D0 ; SSAnne1FRooms
	add_tm TAKE_DOWN    ; $D1 ; SilphCo5F
	add_tm DOUBLE_EDGE  ; $D2 ; RocketHideoutB3F
	add_tm BUBBLEBEAM   ; $D3 ; CeruleanGym
	add_tm WATER_GUN    ; $D4 ; MtMoon1F
	add_tm ICE_BEAM     ; $D5 ; CeladonMartRoof
	add_tm BLIZZARD     ; $D6 ; PokemonMansionB1F
	add_tm HYPER_BEAM   ; $D7 ; GameCornerPrizeRoom
	add_tm PAY_DAY      ; $D8 ; Route12
	add_tm SUBMISSION   ; $D9 ; VictoryRoad2F
	add_tm COUNTER      ; $DA ; CeladonMart3F
	add_tm SEISMIC_TOSS ; $DB ; Route25
	add_tm RAGE         ; $DC ; Route15
	add_tm MEGA_DRAIN   ; $DD ; CeladonGym
	add_tm SOLARBEAM    ; $DE ; PokemonMansionB1F
	add_tm DRAGON_RAGE  ; $DF ; GameCornerPrizeRoom
	add_tm THUNDERBOLT  ; $E0 ; VermilionGym
	add_tm THUNDER      ; $E1 ; PowerPlant
	add_tm EARTHQUAKE   ; $E2 ; SilphCo10F
	add_tm FISSURE      ; $E3 ; ViridianGym
	add_tm DIG          ; $E4 ; CeruleanTrashedHouse
	add_tm PSYCHIC_M    ; $E5 ; MrPsychicsHouse
	add_tm TELEPORT     ; $E6 ; Route9
	add_tm MIMIC        ; $E7 ; CopycatsHouse2F
	add_tm DOUBLE_TEAM  ; $E8 ; SafarZoneWest
	add_tm REFLECT      ; $E9 ; PowerPlant
	add_tm BIDE         ; $EA ; PewterGym
	add_tm METRONOME    ; $EB ; CinnabarLabMetronomeRoom
	add_tm SELFDESTRUCT ; $EC ; SilphCo2F
	add_tm EGG_BOMB     ; $ED ; SafariZoneEast
	add_tm FIRE_BLAST   ; $EE ; CinnabarGym
	add_tm SWIFT        ; $EF ; Route12Gate2F
	add_tm SKULL_BASH   ; $F0 ; SafariZoneNorth
	add_tm SOFTBOILED   ; $F1 ; CeladonCity
	add_tm DREAM_EATER  ; $F2 ; ViridianCity2
	add_tm SKY_ATTACK   ; $F3 ; VictoryRoad1F
	add_tm REST         ; $F4 ; SSAnneB1FRooms
	add_tm THUNDER_WAVE ; $F5 ; Route24
	add_tm PSYWAVE      ; $F6 ; SaffronGym
	add_tm EXPLOSION    ; $F7 ; VictoryRoad3F
	add_tm ROCK_SLIDE   ; $F8 ; CeladonMartRoof
	add_tm TRI_ATTACK   ; $F9 ; CeladonMartRoof
	add_tm SUBSTITUTE   ; $FA ; GameCornerPrizeRoom
ASSERT NUM_TMS == const_value - TM01, "NUM_TMS ({d:NUM_TMS}) does not match the number of add_tm definitions"

DEF NUM_TM_HM EQU NUM_TMS + NUM_HMS

; 50 TMs + 5 HMs = 55 learnable TM/HM flags per Pokémon.
; These fit in 7 bytes, with one unused bit left over.
DEF __tmhm_value__ = NUM_TM_HM + 1
DEF UNUSED_TMNUM EQU __tmhm_value__

; used for Time Capsule held item compatibility
DEF TWISTEDSPOON_GSC EQU $60
DEF LIGHT_BALL_GSC   EQU $a3
