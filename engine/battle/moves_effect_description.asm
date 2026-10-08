HoldBattleMovePowerPane:
	ld a, D_LEFT
	jr HoldBattleMovePane

HoldBattleMoveEffectPane:
	ld a, D_RIGHT

HoldBattleMovePane:
.render
	push af
	bit BIT_D_LEFT, a
	jr z, .effect
	call PrintPowerAccuracy_Far
	jr .held
.effect
	call PrintEffectDescription_Far
.held
	call DelayFrame
	call Joypad
	ldh a, [hJoyHeld]
	and D_LEFT | D_RIGHT
	jr z, .released
	bit BIT_D_LEFT, a
	jr z, .direction
	ld a, D_LEFT
.direction
	ld b, a
	pop af
	cp b
	jr z, .same
	ld a, b
	jr .render
.same
	push af
	jr .held
.released
	pop af
	ret

PrintPowerAccuracy_Far:
	call LoadBattleMovePaneData
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 1, 13
	lb bc, 4, 4
	call ClearScreenArea
	hlcoord 1, 13
	ld de, .powerText
	call PlaceString
	ld a, [wStringBuffer + MOVE_POWER]
	cp 2 ; power 0 or 1 is displayed as a dash
	jr c, .noPower
	hlcoord 2, 14
	ld de, wStringBuffer + MOVE_POWER
	lb bc, 1, 3
	call PrintNumber
	jr .accuracy
.noPower
	hlcoord 4, 14
	ld de, .noPowerText
	call PlaceString
.accuracy
	hlcoord 1, 15
	ld de, .accuracyText
	call PlaceString
	ld a, [wStringBuffer + MOVE_ACC]
	ld hl, 255 ; round the 0-255 accuracy up to a percentage
	ld b, 0
	ld c, a
	ld a, 100
	call AddNTimes
	ld a, h
	ld [wStringBuffer], a
	hlcoord 2, 16
	ld de, wStringBuffer
	lb bc, 1, 3
	call PrintNumber
	jr CommitBattleMoveTextPanel
.noPowerText
	db "-@"
.powerText
	db "Pow@"
.accuracyText
	db "Acc@"

PrintEffectDescription_Far:
	call LoadBattleMovePaneData
	xor a
	ldh [hAutoBGTransferEnabled], a
    hlcoord 1, 13
    lb bc, 4, 4
    call ClearScreenArea

    ld a, [wStringBuffer]
    and a
    jr z, .none
    cp NUM_ATTACKS + 1
    jr nc, .none
    dec a                       ; table starts at move $01
    ld c, a
    ld b, 0
    ld hl, MoveDescriptionPointers
    add hl, bc
    add hl, bc                  ; 2 bytes per entry
    ld a, [hli]
    ld h, [hl]
    ld l, a
    jr .print
.none
    ld hl, EffectNone
.print
    bccoord 1, 13
	ldh a, [hClearLetterPrintingDelayFlags]
	push af
	or %10
	ldh [hClearLetterPrintingDelayFlags], a
    call TextCommandProcessor
	pop af
	ldh [hClearLetterPrintingDelayFlags], a

CommitBattleMoveTextPanel:
	farcall SetBattleMoveTextAttributes
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

LoadBattleMovePaneData:
	ld a, [wStatusFlags7]
	bit BIT_TEST_BATTLE, a
	ld a, [wTestBattlePlayerSelectedMove]
	jr nz, .selected
	ld a, [wCurrentMenuItem]
	dec a
	ld c, a
	ld b, 0
	ld hl, wBattleMonMoves
	add hl, bc
	ld a, [hl]
.selected
	dec a
	cp NUM_ATTACKS
	jr nc, .invalid
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wStringBuffer
	ld a, BANK(Moves)
	jp FarCopyData
.invalid
	ld hl, wStringBuffer
	ld bc, MOVE_LENGTH
	xor a
	jp FillMemory

MoveDescriptionPointers:
	table_width 2, MoveDescriptionPointers

	dw EffectNone              ; POUND
	dw EffectHighCrit          ; KARATE_CHOP
	dw EffectMultiHit          ; DOUBLESLAP
	dw EffectMultiHit          ; COMET_PUNCH
	dw EffectNone              ; MEGA_PUNCH
	dw EffectPayDay            ; PAY_DAY
	dw EffectBurnSide1         ; FIRE_PUNCH
	dw EffectFreezeSide1       ; ICE_PUNCH
	dw EffectParalyzeSide1     ; THUNDERPUNCH
	dw EffectNone              ; SCRATCH
	dw EffectNone              ; VICEGRIP
	dw EffectOHKO              ; GUILLOTINE
	dw EffectChargeHighCrit    ; RAZOR_WIND
	dw EffectAttackUp2         ; SWORDS_DANCE
	dw EffectNone              ; CUT
	dw EffectNone              ; GUST
	dw EffectNone              ; WING_ATTACK
	dw EffectSwitch            ; WHIRLWIND
	dw EffectFly               ; FLY
	dw EffectTrapping          ; BIND
	dw EffectNone              ; SLAM
	dw EffectNone              ; VINE_WHIP
	dw EffectFlinchSide2       ; STOMP
	dw EffectAttackTwice       ; DOUBLE_KICK
	dw EffectNone              ; MEGA_KICK
	dw EffectJumpKick          ; JUMP_KICK
	dw EffectFlinchSide2       ; ROLLING_KICK
	dw EffectAccuracyDown1     ; SAND_ATTACK
	dw EffectFlinchSide2       ; HEADBUTT
	dw EffectNone              ; HORN_ATTACK
	dw EffectMultiHit          ; FURY_ATTACK
	dw EffectOHKO              ; HORN_DRILL
	dw EffectNone              ; TACKLE
	dw EffectParalyzeSide2     ; BODY_SLAM
	dw EffectTrapping          ; WRAP
	dw EffectRecoil            ; TAKE_DOWN
	dw EffectThrash            ; THRASH
	dw EffectRecoil            ; DOUBLE_EDGE
	dw EffectDefenseDown1      ; TAIL_WHIP
	dw EffectPoisonSide1       ; POISON_STING
	dw EffectTwineedle         ; TWINEEDLE
	dw EffectMultiHit          ; PIN_MISSILE
	dw EffectDefenseDown1      ; LEER
	dw EffectFlinchSide2       ; BITE
	dw EffectAttackDown1       ; GROWL
	dw EffectSwitch            ; ROAR
	dw EffectSleep             ; SING
	dw EffectConfusion         ; SUPERSONIC
	dw EffectDmg20             ; SONICBOOM
	dw EffectDisable           ; DISABLE
	dw EffectDefenseDownSide   ; ACID
	dw EffectBurnSide1         ; EMBER
	dw EffectBurnSide1         ; FLAMETHROWER
	dw EffectMist              ; MIST
	dw EffectNone              ; WATER_GUN
	dw EffectNone              ; HYDRO_PUMP
	dw EffectNone              ; SURF
	dw EffectFreezeSide1       ; ICE_BEAM
	dw EffectFreezeSide1       ; BLIZZARD
	dw EffectConfusionSide     ; PSYBEAM
	dw EffectSpeedDownSide     ; BUBBLEBEAM
	dw EffectAttackDownSide    ; AURORA_BEAM
	dw EffectHyperBeam         ; HYPER_BEAM
	dw EffectNone              ; PECK
	dw EffectNone              ; DRILL_PECK
	dw EffectRecoil            ; SUBMISSION
	dw EffectFlinchSide2       ; LOW_KICK
	dw EffectCounter           ; COUNTER
	dw EffectDmgLevel          ; SEISMIC_TOSS
	dw EffectNone              ; STRENGTH
	dw EffectDrain             ; ABSORB
	dw EffectDrain             ; MEGA_DRAIN
	dw EffectLeechSeed         ; LEECH_SEED
	dw EffectSpclAtkUp1        ; GROWTH
	dw EffectHighCrit          ; RAZOR_LEAF
	dw EffectCharge            ; SOLARBEAM
	dw EffectPoison            ; POISONPOWDER
	dw EffectParalyze          ; STUN_SPORE
	dw EffectSleep             ; SLEEP_POWDER
	dw EffectThrash            ; PETAL_DANCE
	dw EffectSpeedDown2        ; STRING_SHOT
	dw EffectDmg40             ; DRAGON_RAGE
	dw EffectTrapping          ; FIRE_SPIN
	dw EffectParalyzeSide1     ; THUNDERSHOCK
	dw EffectParalyzeSide1     ; THUNDERBOLT
	dw EffectParalyze          ; THUNDER_WAVE
	dw EffectParalyzeSide2     ; THUNDER
	dw EffectNone              ; ROCK_THROW
	dw EffectNone              ; EARTHQUAKE
	dw EffectOHKO              ; FISSURE
	dw EffectFly               ; DIG
	dw EffectToxic             ; TOXIC
	dw EffectConfusionSide     ; CONFUSION
	dw EffectSpclDefDownSide   ; PSYCHIC_M
	dw EffectSleep             ; HYPNOSIS
	dw EffectAttackUp1         ; MEDITATE
	dw EffectSpeedUp2          ; AGILITY
	dw EffectPriority          ; QUICK_ATTACK
	dw EffectRage              ; RAGE
	dw EffectSwitch            ; TELEPORT
	dw EffectDmgLevel          ; NIGHT_SHADE
	dw EffectMimic             ; MIMIC
	dw EffectDefenseDown2      ; SCREECH
	dw EffectEvasionUp1        ; DOUBLE_TEAM
	dw EffectHeal              ; RECOVER
	dw EffectDefenseUp1        ; HARDEN
	dw EffectEvasionUp1        ; MINIMIZE
	dw EffectAccuracyDown1     ; SMOKESCREEN
	dw EffectConfusion         ; CONFUSE_RAY
	dw EffectDefenseUp1        ; WITHDRAW
	dw EffectDefenseUp1        ; DEFENSE_CURL
	dw EffectDefenseUp2        ; BARRIER
	dw EffectLightScreen       ; LIGHT_SCREEN
	dw EffectHaze              ; HAZE
	dw EffectReflect           ; REFLECT
	dw EffectFocusEnergy       ; FOCUS_ENERGY
	dw EffectBide              ; BIDE
	dw EffectMetronome         ; METRONOME
	dw EffectMirrorMove        ; MIRROR_MOVE
	dw EffectExplode           ; SELFDESTRUCT
	dw EffectNone              ; EGG_BOMB
	dw EffectParalyzeSide2     ; LICK
	dw EffectPoisonSide2       ; SMOG
	dw EffectPoisonSide2       ; SLUDGE
	dw EffectFlinchSide1       ; BONE_CLUB
	dw EffectBurnSide1         ; FIRE_BLAST
	dw EffectNone              ; WATERFALL
	dw EffectTrapping          ; CLAMP
	dw EffectSwift             ; SWIFT
	dw EffectCharge            ; SKULL_BASH
	dw EffectMultiHit          ; SPIKE_CANNON
	dw EffectSpeedDownSide     ; CONSTRICT
	dw EffectSpclDefUp2        ; AMNESIA
	dw EffectAccuracyDown1     ; KINESIS
	dw EffectHeal              ; SOFTBOILED
	dw EffectJumpKick          ; HI_JUMP_KICK
	dw EffectParalyze          ; GLARE
	dw EffectDreamEater        ; DREAM_EATER
	dw EffectPoison            ; POISON_GAS
	dw EffectMultiHit          ; BARRAGE
	dw EffectDrain             ; LEECH_LIFE
	dw EffectSleep             ; LOVELY_KISS
	dw EffectChargeHighCrit    ; SKY_ATTACK
	dw EffectTransform         ; TRANSFORM
	dw EffectSpeedDownSide     ; BUBBLE
	dw EffectConfusionSide     ; DIZZY_PUNCH
	dw EffectSleep             ; SPORE
	dw EffectAccuracyDown1     ; FLASH
	dw EffectDmgRandom         ; PSYWAVE
	dw EffectNone              ; SPLASH
	dw EffectDefenseUp2        ; ACID_ARMOR
	dw EffectHighCrit          ; CRABHAMMER
	dw EffectExplode           ; EXPLOSION
	dw EffectMultiHit          ; FURY_SWIPES
	dw EffectAttackTwice       ; BONEMERANG
	dw EffectRest              ; REST
	dw EffectFlinchSide2       ; ROCK_SLIDE
	dw EffectFlinchSide1       ; HYPER_FANG
	dw EffectAttackUp1         ; SHARPEN
	dw EffectConversion        ; CONVERSION
	dw EffectTriAttack         ; TRI_ATTACK
	dw EffectSuperFang         ; SUPER_FANG
	dw EffectHighCrit          ; SLASH
	dw EffectSubstitute        ; SUBSTITUTE
	dw EffectStruggle          ; STRUGGLE

	assert_table_length NUM_ATTACKS

; ---------------------------------------------------------------
; Move-specific texts
; ---------------------------------------------------------------

EffectHighCrit:
	text "+1"
	down "Crit"
	done

EffectChargeHighCrit:
	text "+1"
	down "Crit"
	down "2"
	down "Turn"
	done

EffectDmg20:
	text "Does"
	down "20"
	down "HP"
	done

EffectDmg40:
	text "Does"
	down "40"
	down "HP"
	done

EffectDmgLevel:
	text "Dmg"
	down "as"
	down "Lvl"
	done

EffectDmgRandom:
	text "Rand"
	down "Dmg"
	done

EffectCounter:
	text "Back"
	down "2x"
	down "Phys"
	down "Dmg"
	done

EffectPriority:
	text "Hit"
	down "1st"
	done

EffectRest:
	text "Full"
	down "HP"
	down "Then"
	down "SLP"
	done

EffectToxic:
	text "Bad"
	down "PSN"
	done

EffectStruggle:
	text "Lose"
	down "25%"
	down "Max"
	down "HP"
	done

; ---------------------------------------------------------------
; Shared texts
; ---------------------------------------------------------------

EffectNone:
	text "None"
	done

EffectPoisonSide1:
	text "20%"
	down "PSN"
	down "1/8"
	down "HP"
	done

EffectPoisonSide2:
	text "40%"
	down "PSN"
	down "1/8"
	down "HP"
	done

EffectBurnSide1:
	text "10%"
	down "BRN"
	down "1/8"
	down "HP"
	done

EffectFreezeSide1:
	text "10%"
	down "FRZ"
	done

EffectParalyzeSide1:
	text "10%"
	down "PAR"
	done

EffectParalyzeSide2:
	text "30%"
	down "PAR"
	done

EffectFlinchSide1:
	text "10%"
	down "Fli-"
	down "nch"
	done

EffectFlinchSide2:
	text "30%"
	down "Fli-"
	down "nch"
	done

EffectConfusionSide:
	text "10%"
	down "Conf"
	done

EffectDrain:
	text "Heal"
	down "50%"
	down "DMG"
	done

EffectDreamEater:
	text "SLP"
	down "Heal"
	down "50%"
	down "DMG"
	done

EffectMirrorMove:
	text "Use"
	down "Last"
	down "Foe"
	down "Move"
	done

EffectMimic:
	text "Copy"
	down "Foe"
	down "Move"
	done

EffectExplode:
	text "Self"
	down "KO"
	done

EffectPayDay:
	text "Earn"
	down "5x"
	down "Lvl"
	down "¥¥¥¥"
	done

EffectSwift:
	text "100%"
	down "Hit"
	done

EffectConversion:
	text "Copy"
	down "Foe"
	down "Type"
	done

EffectHaze:
	text "Undo"
	down "All"
	down "Stat"
	done

EffectBide:
	text "2x"
	down "Dmg"
	done

EffectThrash:
	text "3-4"
	down "Turn"
	down "Lock"
	done

EffectSwitch:
	text "Wild"
	down "Flee"
	done

EffectMultiHit:
	text "2-5"
	down "Hits"
	done

EffectSleep:
	text "SLP"
	down "Foe"
	down "1-3"
	down "Turn"
	done

EffectOHKO:
	text "OHKO"
	done

EffectCharge:
	text "2"
	down "Turn"
	down "Chrg"
	done

EffectSuperFang:
	text "Half"
	down "Foe"
	down "HP"
	done

EffectTrapping:
	text "Trap"
	down "2-5"
	down "Turn"
	done

EffectFly:
	text "2"
	down "Turn"
	down "Inv"
	done

EffectAttackTwice:
	text "2"
	down "Hits"
	done

EffectJumpKick:
	text "Miss"
	down "Hurt"
	done

EffectMist:
	text "Stop"
	down "Stat"
	down "Drop"
	done

EffectFocusEnergy:
	text "+2"
	down "Crit"
	done

EffectRecoil:
	text "25%"
	down "Self"
	down "Dmg"
	done

EffectConfusion:
	text "Conf"
	down "Foe"
	done

EffectHeal:
	text "Heal"
	down "50%"
	down "HP"
	done

EffectTransform:
	text "Copy"
	down "Foe"
	down "Stat"
	done

EffectLightScreen:
	text "Spc"
	down "Dmg"
	down "Half"
	done

EffectReflect:
	text "Phys"
	down "Dmg"
	down "Half"
	done

EffectPoison:
	text "PSN"
	down "Foe"
	done

EffectParalyze:
	text "PAR"
	down "Foe"
	done

EffectTwineedle:
	text "2"
	down "Hits"
	down "20%"
	down "PSN"
	done

EffectSubstitute:
	text "25%"
	down "HP"
	down "Sub"
	done

EffectHyperBeam:
	text "Rest"
	down "Next"
	done

EffectRage:
	text "ATK"
	down "+1"
	down "Hit"
	done

EffectMetronome:
	text "Rand"
	down "Move"
	done

EffectLeechSeed:
	text "1/8"
	down "HP"
	down "Seed"
	done

EffectDisable:
	text "Dsbl"
	down "Rand"
	down "Foe"
	down "Move"
	done

EffectTriAttack:
	text "10%"
	down "BRN"
	down "FRZ"
	down "PAR"
	done

; --- stat changes ---

EffectAttackUp1:
	text "+1"
	down "ATK"
	done

EffectAttackUp2:
	text "+2"
	down "ATK"
	done

EffectDefenseUp1:
	text "+1"
	down "DEF"
	done

EffectDefenseUp2:
	text "+2"
	down "DEF"
	done

EffectSpeedUp2:
	text "+2"
	down "SPD"
	done

EffectSpclAtkUp1:
	text "+1"
	down "SATK"
	done

EffectSpclDefUp2:
	text "+2"
	down "SDEF"
	done

EffectEvasionUp1:
	text "+1"
	down "Eva-"
	down "sion"
	done

EffectAttackDown1:
	text "-1"
	down "ATK"
	done

EffectDefenseDown1:
	text "-1"
	down "DEF"
	done

EffectDefenseDown2:
	text "-2"
	down "DEF"
	done

EffectSpeedDown2:
	text "-2"
	down "SPD"
	done

EffectAccuracyDown1:
	text "-1"
	down "Accu"
	down "racy"
	done

EffectAttackDownSide:
	text "33%"
	down "-1"
	down "ATK"
	done

EffectDefenseDownSide:
	text "33%"
	down "-1"
	down "DEF"
	done

EffectSpeedDownSide:
	text "33%"
	down "-1"
	down "SPD"
	done

EffectSpclDefDownSide:
	text "33%"
	down "-1"
	down "SDEF"
	done
