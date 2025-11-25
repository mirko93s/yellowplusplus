PewterGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, PewterGymTrainerHeaders
	ld de, PewterGym_ScriptPointers
	ld a, [wPewterGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wPewterGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	call LoadGymLeaderAndCityName
	ret

.CityName:
	db "PEWTER CITY@"

.LeaderName:
	db "BROCK@"

PewterGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wPewterGymCurScript], a
	ld [wCurMapScript], a
	ret

PewterGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw PewterGymBrockPostBattle

PewterGymBrockPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, PewterGymResetScripts
	ld a, $f0
	ld [wJoyIgnore], a
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr z, PewterGymScriptReceiveTM34	
	ld a, $7
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wGymRematched
	set 0, [hl] ; mark gym as beaten
	jp PewterGymResetScripts
; fallthrough
PewterGymScriptReceiveTM34:
	ld a, $4
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_BROCK
	lb bc, TM_BIDE, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $5
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM34
	jr .gymVictory
.BagFull
	ld a, $6
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_BOULDERBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_BOULDERBADGE, [hl]

	ld a, HS_GYM_GUY
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_ROUTE_22_RIVAL_1
	ld [wMissableObjectIndex], a
	predef HideObject

	ResetEvents EVENT_1ST_ROUTE22_RIVAL_BATTLE, EVENT_ROUTE22_RIVAL_WANTS_BATTLE

	; deactivate gym trainers
	SetEvent EVENT_BEAT_PEWTER_GYM_TRAINER_0

	jp PewterGymResetScripts

PewterGym_TextPointers:
	dw BrockText
	dw PewterGymTrainerText1
	dw PewterGymGuideText
	dw BeforeReceivedTM34Text
	dw ReceivedTM34Text
	dw TM34NoRoomText
	dw PewterGymRematchPostBattleText

PewterGymTrainerHeaders:
	def_trainers 2
PewterGymTrainerHeader0:
	trainer EVENT_BEAT_PEWTER_GYM_TRAINER_0, 5, PewterGymBattleText1, PewterGymEndBattleText1, PewterGymAfterBattleText1
	db -1 ; end

BrockText:
	text_asm
	CheckEvent EVENT_BEAT_BROCK
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM34
	jr nz, .afterBeat
	call z, PewterGymScriptReceiveTM34
	call DisableWaitingAfterTextDisplay
	; jr .done
	jp TextScriptEnd
.afterBeat
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .BrockRematch
	ld hl, BrockPostBattleAdviceText
	call PrintText
	jr .done
.beforeBeat
	ld hl, BrockPreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set 6, [hl]
	set 7, [hl]
	ld hl, ReceivedBoulderBadgeText
	ld de, ReceivedBoulderBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $1
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	jr .endBattle
.BrockRematch
	ld a, [wGymRematched]
	bit 0, a
	jr z, .rematch
	ld hl, PewterGymRematchCooldownText
	call PrintText
	jp TextScriptEnd ; exit here
.rematch
	ld hl, PewterGymRematchPreBattleText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, PewterGymRematchAcceptedText
	call PrintText
	call Delay3
	ld hl, wStatusFlags3
	set 6, [hl]
	set 7, [hl]
	ld hl, PewterGymRematchDefeatedText
	ld de, PewterGymRematchDefeatedText
	call SaveEndBattleTextPointers
	ld a, OPP_BROCK
	ld [wCurOpponent], a
	ld a, 2
	ld [wTrainerNo], a
	jr .endBattle
.refused
	ld hl, PewterGymRematchRefusedText
	call PrintText
	jr .done
.endBattle
	ld a, $3
	ld [wPewterGymCurScript], a
	ld [wCurMapScript], a
.done
	jp TextScriptEnd

BrockPreBattleText:
	text_far _BrockPreBattleText
	text_end

BrockPostBattleAdviceText:
	text_far _BrockPostBattleAdviceText
	text_end

BeforeReceivedTM34Text:
	text_far _BeforeReceivedTM34Text
	text_end

ReceivedTM34Text:
	text_far _ReceivedTM34Text
	sound_get_item_1
	text_far _TM34ExplanationText
	text_end

TM34NoRoomText:
	text_far _TM34NoRoomText
	text_end

ReceivedBoulderBadgeText:
	text_far _ReceivedBoulderBadgeText
	sound_get_item_1
	text_far _BrockBoulerBadgeInfoText ; Text to tell that the flash technique can be used
	text_end

PewterGymTrainerText1:
	text_asm
	ld hl, PewterGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PewterGymBattleText1:
	text_far _PewterGymBattleText1
	text_end

PewterGymEndBattleText1:
	text_far _PewterGymEndBattleText1
	text_end

PewterGymAfterBattleText1:
	text_far _PewterGymAfterBattleText1
	text_end

PewterGymGuideText:
	text_asm
	ld a, [wBeatGymFlags]
	bit BIT_BOULDERBADGE, a
	jr nz, .afterBeat
	ld hl, PewterGymGuidePreAdviceText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .PewterGymGuideBeginAdviceText
	ld a, [wd471]
	bit 7, a
	jp nz, .asm_5c3fa
	ld hl, PewterGymGuideBeginAdviceText
	call PrintText
	jr .PewterGymGuideAdviceText
.PewterGymGuideBeginAdviceText
	ld hl, PewterGymText_5c524
	call PrintText
.PewterGymGuideAdviceText
	ld hl, PewterGymGuideAdviceText
	call PrintText
	jr .done
.afterBeat
	ld hl, PewterGymGuidePostBattleText
	call PrintText
.done
	jp TextScriptEnd
.asm_5c3fa
	ld hl, PewterGymText_5c41c
	call PrintText
	jp TextScriptEnd

PewterGymGuidePreAdviceText:
	text_far _PewterGymGuidePreAdviceText
	text_end

PewterGymGuideBeginAdviceText:
	text_far _PewterGymGuideBeginAdviceText
	text_end

PewterGymGuideAdviceText:
	text_far _PewterGymGuideAdviceText
	text_end

PewterGymText_5c524:
	text_far _PewterGymText_5c524
	text_end

PewterGymGuidePostBattleText:
	text_far _PewterGymGuidePostBattleText
	text_end

PewterGymText_5c41c:
	text_far _PewterGymGuyText
	text_end

PewterGymRematchPreBattleText:
	text_far _PewterGymRematchPreBattleText
	text_end
	
PewterGymRematchAcceptedText:
	text_far _PewterGymRematchAcceptedText
	text_end
	
PewterGymRematchRefusedText:
	text_far _PewterGymRematchRefusedText
	text_end

PewterGymRematchDefeatedText:
	text_far _PewterGymRematchDefeatedText
	text_end

PewterGymRematchPostBattleText:
	text_far _PewterGymRematchPostBattleText
	text_end

PewterGymRematchCooldownText:
	text_far _PewterGymRematchCooldownText
	text_end
