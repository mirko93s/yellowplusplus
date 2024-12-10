DEF MAX_LEVEL EQU 100

DEF NUM_MOVES EQU 4

; VitaminStats indexes (see data/battle/stat_names.asm)
	const_def
	const STAT_HEALTH
	const STAT_ATTACK
	const STAT_DEFENSE
	const STAT_SPEED
	const STAT_SPECIAL
DEF NUM_STATS EQU const_value

; StatModTextStrings indexes (see data/battle/stat_mod_names.asm)
	const_def
	const MOD_ATTACK
	const MOD_DEFENSE
	const MOD_SPEED
	const MOD_SPECIAL
	const MOD_ACCURACY
	const MOD_EVASION
	const_skip 2
DEF NUM_STAT_MODS EQU const_value

; Moves struct fields (see data/moves/moves.asm)
rsreset
DEF MOVE_ANIM   rb
DEF MOVE_EFFECT rb
DEF MOVE_POWER  rb
DEF MOVE_TYPE   rb
DEF MOVE_ACC    rb
DEF MOVE_PP     rb
DEF MOVE_LENGTH EQU _RS

; D733 flags
DEF BIT_TEST_BATTLE EQU 0

; battle type constants (wBattleType values)
	const_def
	const BATTLE_TYPE_NORMAL  ; 0
	const BATTLE_TYPE_OLD_MAN ; 1
	const BATTLE_TYPE_SAFARI  ; 2
	const BATTLE_TYPE_RUN     ; 3
	const BATTLE_TYPE_PIKACHU ; 4

; damage limits before type effectiveness
DEF MIN_NEUTRAL_DAMAGE EQU 2
DEF MAX_NEUTRAL_DAMAGE EQU 999

; fixed damage constants
DEF SONICBOOM_DAMAGE   EQU 20
DEF DRAGON_RAGE_DAMAGE EQU 40

; type effectiveness factors, scaled by 10
DEF SUPER_EFFECTIVE    EQU 20
DEF MORE_EFFECTIVE     EQU 15
DEF EFFECTIVE          EQU 10
DEF NOT_VERY_EFFECTIVE EQU 05
DEF NO_EFFECT          EQU 00

; non-volatile statuses
DEF SLP_MASK EQU %111 ; 0-7 turns
	const_def 3
	const PSN ; 3
	const BRN ; 4
	const FRZ ; 5
	const PAR ; 6

DEF MAX_STAT_VALUE EQU 999

; trainer dvs
DEF ATKDEFDV_TRAINER EQU $98
DEF SPDSPCDV_TRAINER EQU $88

; wPlayerBattleStatus1 or wEnemyBattleStatus1 bit flags
	const_def
	const STORING_ENERGY           ; 0 ; Bide
	const THRASHING_ABOUT          ; 1 ; e.g. Thrash
	const ATTACKING_MULTIPLE_TIMES ; 2 ; e.g. Double Kick, Fury Attack
	const FLINCHED                 ; 3
	const CHARGING_UP              ; 4 ; e.g. Solar Beam, Fly
	const USING_TRAPPING_MOVE      ; 5 ; e.g. Wrap
	const INVULNERABLE             ; 6 ; charging up Fly/Dig
	const CONFUSED                 ; 7

; wPlayerBattleStatus2 or wEnemyBattleStatus2 bit flags
	const_def
	const USING_X_ACCURACY    ; 0
	const PROTECTED_BY_MIST   ; 1
	const GETTING_PUMPED      ; 2 ; Focus Energy
	const_skip                ; 3 ; unused
	const HAS_SUBSTITUTE_UP   ; 4
	const NEEDS_TO_RECHARGE   ; 5 ; Hyper Beam
	const USING_RAGE          ; 6
	const SEEDED              ; 7

; wPlayerBattleStatus3 or wEnemyBattleStatus3 bit flags
	const_def
	const BADLY_POISONED      ; 0
	const HAS_LIGHT_SCREEN_UP ; 1
	const HAS_REFLECT_UP      ; 2
	const TRANSFORMED         ; 3

; hard mode level caps
DEF LEVEL_CAP_GYM_1 EQU 15
DEF LEVEL_CAP_GYM_2 EQU 26
DEF LEVEL_CAP_GYM_3 EQU 36
DEF LEVEL_CAP_GYM_4 EQU 46
DEF LEVEL_CAP_GYM_5 EQU 56
DEF LEVEL_CAP_GYM_6 EQU 61
DEF LEVEL_CAP_GYM_7 EQU 66
DEF LEVEL_CAP_GYM_8 EQU 70
DEF LEVEL_CAP_CHAMPION EQU 85

; wNuzlockeRegions
	const_def ; First byte 
	const RESET_ROUTES_NUZ    ; 0 ; unused
	const PALLET_TOWN_NUZ     ; 1
	const VIRIDIAN_CITY_NUZ   ; 2
	const CERULEAN_CITY_NUZ   ; 3
	const VERMILION_CITY_NUZ  ; 4
	const CELADON_CITY_NUZ    ; 5
	const FUCHSIA_CITY_NUZ    ; 6
	const CINNABAR_ISLAND_NUZ ; 7
	
	const_def ; Second byte
	const SAFFRON_CITY_NUZ    ; 0
	const ROUTE_1_NUZ         ; 1
	const ROUTE_2_NUZ         ; 2
	const ROUTE_3_NUZ         ; 3
	const ROUTE_4_NUZ         ; 4
	const ROUTE_5_NUZ         ; 5
	const ROUTE_6_NUZ         ; 6
	const ROUTE_7_NUZ         ; 7
		
	const_def ; Third byte
	const ROUTE_8_NUZ         ; 0
	const ROUTE_9_NUZ         ; 1
	const ROUTE_10_NUZ        ; 2
	const ROUTE_11_NUZ        ; 3
	const ROUTE_12_NUZ        ; 4
	const ROUTE_13_NUZ        ; 5
	const ROUTE_14_NUZ        ; 6
	const ROUTE_15_NUZ        ; 7
	
	const_def ; Fourth byte
	const ROUTE_16_NUZ        ; 0
	const ROUTE_17_NUZ        ; 1
	const ROUTE_18_NUZ        ; 2
	const ROUTE_19_NUZ        ; 3
	const ROUTE_20_NUZ        ; 4
	const ROUTE_21_NUZ        ; 5
	const ROUTE_22_NUZ        ; 6
	const ROUTE_23_NUZ        ; 7
		
	const_def ; Fifth byte
	const ROUTE_24_NUZ        ; 0
	const ROUTE_25_NUZ        ; 1
	const VIRIDIAN_FOREST_NUZ ; 2
	const MT_MOON_NUZ         ; 3
	const ROCK_TUNNEL_NUZ     ; 4
	const POWER_PLANT_NUZ     ; 5
	const VICTORY_ROAD_NUZ    ; 6
	const POKEMON_TOWER_NUZ   ; 7

	const_def ; Sixth byte
	const SEAFOAM_ISLANDS_NUZ ; 0
	const DIGLETTS_CAVE_NUZ   ; 1
	const POKEMON_MANSION_NUZ ; 2
	const SAFARI_ZONE_NUZ     ; 3
	const CERULEAN_CAVE_NUZ   ; 4
