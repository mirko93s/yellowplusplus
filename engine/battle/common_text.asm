PrintBeginningBattleText:
	ld a, [wIsInBattle]
	dec a
	jr nz, .trainerBattle
	ld a, [wCurMap]
	cp POKEMON_TOWER_3F
	jr c, .notPokemonTower
	cp POKEMON_TOWER_7F + 1
	jp c, .pokemonTower
.notPokemonTower
	; play animation if mon is shiny
	ld de, wEnemyMonDVs
	ld b, Bank(IsMonShiny)
	ld hl, IsMonShiny
	call Bankswitch
	jr z, .noFlash
	; play shiny animation
	ld hl, wShinyMonFlag
	set 1, [hl]
	ld hl, PlayShinySparkleAnimation
	ld b, Bank(PlayShinySparkleAnimation)
	call Bankswitch
	callfar AnimationFlashScreen
.noFlash
	ld a, [wBattleType]
	cp BATTLE_TYPE_PIKACHU
	jr nz, .notPikachuBattle
	callfar IsPlayerPikachuAsleepInParty
	ld e, $24
	jr c, .asm_f4026
	ld e, $a
.asm_f4026
	callfar PlayPikachuSoundClip
	jr .continue
.notPikachuBattle
	ld a, [wEnemyMonSpecies2]
	call PlayCry
.continue
	ld hl, WildMonAppearedText
	ld a, [wMoveMissed]
	and a
	jr z, .notFishing
	ld hl, HookedMonAttackedText
.notFishing
	jr .wildBattle
.trainerBattle
	call .playSFX
	ld c, 20
	call DelayFrames
	ld hl, TrainerWantsToFightText
.wildBattle
	ld a, [wBattleType]
	and a
	jr nz, .doNotDrawPokeballs
	push hl
	callfar DrawAllPokeballs
	pop hl
.doNotDrawPokeballs
	call PrintText
	ld a, [wExtraFlags]
	bit 3, a
	ret z ; if not in nuzlocke mode skip	
	ld a, [wIsInBattle]
	dec a 
	ret nz ; Check if trainer battle or not
	callfar checkNuzlockeStatus
	ret nz

	ld a, [wBattleType]
	cp BATTLE_TYPE_OLD_MAN ; don't say the pokemon is catchable in the old man battle
	ret z
	cp BATTLE_TYPE_PIKACHU ; don't say the pokemon is catchable in the pikachu battle
	ret z

	ld hl, WildMonCatchableText
	call PrintText	
	ret
.pokemonTower
	ld b, SILPH_SCOPE
	call IsItemInBag
	ld a, [wEnemyMonSpecies2]
	ld [wCurPartySpecies], a
	cp RESTLESS_SOUL
	jr z, .isMarowak
	ld a, b
	and a
	jr z, .noSilphScope
	callfar LoadEnemyMonData
	jp .notPokemonTower
.noSilphScope
	ld hl, EnemyAppearedText
	call PrintText
	ld hl, GhostCantBeIDdText
	call PrintText
	jr .done
.isMarowak
	ld a, b
	and a
	jr z, .noSilphScope
	ld hl, EnemyAppearedText
	call PrintText
	ld hl, UnveiledGhostText
	call PrintText
	callfar LoadEnemyMonData
	callfar MarowakAnim
	ld hl, WildMonAppearedText
	call PrintText

.playSFX
	xor a
	ld [wFrequencyModifier], a
	ld a, $80
	ld [wTempoModifier], a
	ld a, SFX_SILPH_SCOPE
	call PlaySound
	jp WaitForSoundToFinish
.done
	ret

WildMonAppearedText:
	text_far _WildMonAppearedText
	text_end

WildMonCatchableText:
	text_far _WildMonCatchableText
	text_end

HookedMonAttackedText:
	text_far _HookedMonAttackedText
	text_end

EnemyAppearedText:
	text_far _EnemyAppearedText
	text_end

TrainerWantsToFightText:
	text_far _TrainerWantsToFightText
	text_end

UnveiledGhostText:
	text_far _UnveiledGhostText
	text_end

GhostCantBeIDdText:
	text_far _GhostCantBeIDdText
	text_end

PrintSendOutMonMessage:
	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl]
	ld hl, GoText
	jr z, .printText
	xor a
	ldh [hMultiplicand], a
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wLastSwitchInEnemyMonHP], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ld [wLastSwitchInEnemyMonHP + 1], a
	ldh [hMultiplicand + 2], a
	ld a, 25
	ldh [hMultiplier], a
	call Multiply
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ldh [hDivisor], a ; enemy mon max HP divided by 4
	call Divide
	ldh a, [hQuotient + 3] ; a = (enemy mon current HP * 25) / (enemy max HP / 4); this approximates the current percentage of max HP
	ld hl, GoText ; 70% or greater
	cp 70
	jr nc, .printText
	ld hl, DoItText ; 40% - 69%
	cp 40
	jr nc, .printText
	ld hl, GetmText ; 10% - 39%
	cp 10
	jr nc, .printText
	ld hl, EnemysWeakText ; 0% - 9%
.printText
	jp PrintText

GoText:
	text_far _GoText
	text_asm
	jr PrintPlayerMon1Text

DoItText:
	text_far _DoItText
	text_asm
	jr PrintPlayerMon1Text

GetmText:
	text_far _GetmText
	text_asm
	jr PrintPlayerMon1Text

EnemysWeakText:
	text_far _EnemysWeakText
	text_asm

PrintPlayerMon1Text:
	ld hl, PlayerMon1Text
	ret

PlayerMon1Text:
	text_far _PlayerMon1Text
	text_end

RetreatMon:
	ld hl, PlayerMon2Text
	jp PrintText

PlayerMon2Text:
	text_far _PlayerMon2Text
	text_asm
	push de
	push bc
	ld hl, wEnemyMonHP + 1
	ld de, wLastSwitchInEnemyMonHP + 1
	ld b, [hl]
	dec hl
	ld a, [de]
	sub b
	ldh [hMultiplicand + 2], a
	dec de
	ld b, [hl]
	ld a, [de]
	sbc b
	ldh [hMultiplicand + 1], a
	ld a, 25
	ldh [hMultiplier], a
	call Multiply
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld b, [hl]
	srl a
	rr b
	srl a
	rr b
	ld a, b
	ld b, 4
	ldh [hDivisor], a
	call Divide
	pop bc
	pop de
	ldh a, [hQuotient + 3] ; a = ((LastSwitchInEnemyMonHP - CurrentEnemyMonHP) / 25) / (EnemyMonMaxHP / 4)
; Assuming that the enemy mon hasn't gained HP since the last switch in,
; a approximates the percentage that the enemy mon's total HP has decreased
; since the last switch in.
; If the enemy mon has gained HP, then a is garbage due to wrap-around and
; can fall in any of the ranges below.
	ld hl, EnoughText ; HP stayed the same
	and a
	ret z
	ld hl, ComeBackText ; HP went down 1% - 29%
	cp 30
	ret c
	ld hl, OKExclamationText ; HP went down 30% - 69%
	cp 70
	ret c
	ld hl, GoodText ; HP went down 70% or more
	ret

EnoughText:
	text_far _EnoughText
	text_asm
	jr PrintComeBackText

OKExclamationText:
	text_far _OKExclamationText
	text_asm
	jr PrintComeBackText

GoodText:
	text_far _GoodText
	text_asm
	jr PrintComeBackText

PrintComeBackText:
	ld hl, ComeBackText
	ret

ComeBackText:
	text_far _ComeBackText
	text_end
