; {stat}_(UP|DOWN)(1|2) means that the move raises the user's (or lowers the target's) corresponding stat modifier by 1 (or 2) stages
; {status condition}_SIDE_EFFECT means that the move has a side chance of causing that condition
; {status condition}_EFFECT means that the move causes the status condition every time it hits the target

; MoveEffectPointerTable indexes (see data/moves/effects_pointers.asm)
	const_def
	const NO_ADDITIONAL_EFFECT       ; $00
	const EFFECT_01                  ; $01 unused
	const POISON_SIDE_EFFECT1        ; $02
	const DRAIN_HP_EFFECT            ; $03
	const BURN_SIDE_EFFECT1          ; $04
	const FREEZE_SIDE_EFFECT         ; $05
	const PARALYZE_SIDE_EFFECT1      ; $06
	const EXPLODE_EFFECT             ; $07 Explosion, Self Destruct
	const DREAM_EATER_EFFECT         ; $08
	const MIRROR_MOVE_EFFECT         ; $09
	const ATTACK_UP1_EFFECT          ; $0A
	const DEFENSE_UP1_EFFECT         ; $0B
	const SPEED_UP1_EFFECT           ; $0C
	const SPCLATK_UP1_EFFECT         ; $0D
	const SPCLDEF_UP1_EFFECT         ; $0E
	const ACCURACY_UP1_EFFECT        ; $0F
	const EVASION_UP1_EFFECT         ; $10
	const PAY_DAY_EFFECT             ; $11
	const SWIFT_EFFECT               ; $12
	const ATTACK_DOWN1_EFFECT        ; $13
	const DEFENSE_DOWN1_EFFECT       ; $14
	const SPEED_DOWN1_EFFECT         ; $15
	const SPCLATK_DOWN1_EFFECT       ; $16
	const SPCLDEF_DOWN1_EFFECT       ; $17
	const ACCURACY_DOWN1_EFFECT      ; $18
	const EVASION_DOWN1_EFFECT       ; $19
	const CONVERSION_EFFECT          ; $1A
	const HAZE_EFFECT                ; $1B
	const BIDE_EFFECT                ; $1C
	const THRASH_PETAL_DANCE_EFFECT  ; $1D
	const SWITCH_AND_TELEPORT_EFFECT ; $1E
	const TWO_TO_FIVE_ATTACKS_EFFECT ; $1F
	const EFFECT_20                  ; $20 unused
	const FLINCH_SIDE_EFFECT1        ; $21
	const SLEEP_EFFECT               ; $22
	const POISON_SIDE_EFFECT2        ; $23
	const BURN_SIDE_EFFECT2          ; $24
	const UNUSED_EFFECT_23           ; $25
	const PARALYZE_SIDE_EFFECT2      ; $26
	const FLINCH_SIDE_EFFECT2        ; $27
	const OHKO_EFFECT                ; $28 moves like Horn Drill
	const CHARGE_EFFECT              ; $29 moves like Solar Beam
	const SUPER_FANG_EFFECT          ; $2A
	const SPECIAL_DAMAGE_EFFECT      ; $2B Seismic Toss, Night Shade, Sonic Boom, Dragon Rage, Psywave
	const TRAPPING_EFFECT            ; $2C moves like Wrap
	const FLY_EFFECT                 ; $2D
	const ATTACK_TWICE_EFFECT        ; $2E
	const JUMP_KICK_EFFECT           ; $2F Jump Kick and Hi Jump Kick effect
	const MIST_EFFECT                ; $30
	const FOCUS_ENERGY_EFFECT        ; $31
	const RECOIL_EFFECT              ; $32 moves like Double Edge
	const CONFUSION_EFFECT           ; $33 Confuse Ray, Supersonic (not the move Confusion)
	const ATTACK_UP2_EFFECT          ; $34
	const DEFENSE_UP2_EFFECT         ; $35
	const SPEED_UP2_EFFECT           ; $36
	const SPCLATK_UP2_EFFECT         ; $37
	const SPCLDEF_UP2_EFFECT         ; $38
	const ACCURACY_UP2_EFFECT        ; $39
	const EVASION_UP2_EFFECT         ; $3A
	const HEAL_EFFECT                ; $3B Recover, Softboiled, Rest
	const TRANSFORM_EFFECT           ; $3C
	const ATTACK_DOWN2_EFFECT        ; $3D
	const DEFENSE_DOWN2_EFFECT       ; $3E
	const SPEED_DOWN2_EFFECT         ; $3F
	const SPCLATK_DOWN2_EFFECT       ; $40
	const SPCLDEF_DOWN2_EFFECT       ; $41
	const ACCURACY_DOWN2_EFFECT      ; $42
	const EVASION_DOWN2_EFFECT       ; $43
	const LIGHT_SCREEN_EFFECT        ; $44
	const REFLECT_EFFECT             ; $45
	const POISON_EFFECT              ; $46
	const PARALYZE_EFFECT            ; $47
	const ATTACK_DOWN_SIDE_EFFECT    ; $48
	const DEFENSE_DOWN_SIDE_EFFECT   ; $49
	const SPEED_DOWN_SIDE_EFFECT     ; $4A
	const SPCLATK_DOWN_SIDE_EFFECT   ; $4B
	const SPCLDEF_DOWN_SIDE_EFFECT   ; $4C
	const_skip                       ; $4D
	const_skip                       ; $4E
	const_skip                       ; $4F
	const_skip                       ; $50
	const CONFUSION_SIDE_EFFECT      ; $51
	const TWINEEDLE_EFFECT           ; $52
	const_skip                       ; $53
	const SUBSTITUTE_EFFECT          ; $54
	const HYPER_BEAM_EFFECT          ; $55
	const RAGE_EFFECT                ; $56
	const MIMIC_EFFECT               ; $57
	const METRONOME_EFFECT           ; $58
	const LEECH_SEED_EFFECT          ; $59
	const SPLASH_EFFECT              ; $5A
	const DISABLE_EFFECT             ; $5B
	const TRI_ATTACK_EFFECT          ; $5C Randomly burn, freeze, or paralyze the opponent
DEF NUM_MOVE_EFFECTS EQU const_value - 1
