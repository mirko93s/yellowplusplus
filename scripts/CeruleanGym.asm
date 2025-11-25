CeruleanGym_Script:
	ld hl, wCurrentMapScriptFlags
	bit 6, [hl]
	res 6, [hl]
	call nz, .LoadNames
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanGymTrainerHeaders
	ld de, CeruleanGym_ScriptPointers
	ld a, [wCeruleanGymCurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeruleanGymCurScript], a
	ret

.LoadNames:
	ld hl, .CityName
	ld de, .LeaderName
	jp LoadGymLeaderAndCityName

.CityName:
	db "CERULEAN CITY@"

.LeaderName:
	db "MISTY@"

CeruleanGymResetScripts:
	xor a
	ld [wJoyIgnore], a
	ld [wCeruleanGymCurScript], a
	ld [wCurMapScript], a
	ret

CeruleanGym_ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw CeruleanGymMistyPostBattle

CeruleanGymMistyPostBattle:
	ld a, [wIsInBattle]
	cp $ff
	jp z, CeruleanGymResetScripts
	ld a, $f0
	ld [wJoyIgnore], a
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr z, CeruleanGymReceiveTM11	
	ld a, $8
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wGymRematched
	set 1, [hl] ; mark gym as beaten
	jp CeruleanGymResetScripts

CeruleanGymReceiveTM11:
	ld a, $5
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_BEAT_MISTY
	lb bc, TM_BUBBLEBEAM, 1
	call GiveItem
	jr nc, .BagFull
	ld a, $6
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_TM11
	jr .gymVictory
.BagFull
	ld a, $7
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.gymVictory
	ld hl, wObtainedBadges
	set BIT_CASCADEBADGE, [hl]
	ld hl, wBeatGymFlags
	set BIT_CASCADEBADGE, [hl]

	; deactivate gym trainers
	SetEvents EVENT_BEAT_CERULEAN_GYM_TRAINER_0, EVENT_BEAT_CERULEAN_GYM_TRAINER_1

	jp CeruleanGymResetScripts

CeruleanGym_TextPointers:
	dw MistyText
	dw CeruleanGymTrainerText1
	dw CeruleanGymTrainerText2
	dw CeruleanGymGuideText
	dw MistyCascadeBadgeInfoText
	dw ReceivedTM11Text
	dw TM11NoRoomText
	dw CeruleanGymRematchPostBattleText

CeruleanGymTrainerHeaders:
	def_trainers 2
CeruleanGymTrainerHeader0:
	trainer EVENT_BEAT_CERULEAN_GYM_TRAINER_0, 3, CeruleanGymBattleText1, CeruleanGymEndBattleText1, CeruleanGymAfterBattleText1
CeruleanGymTrainerHeader1:
	trainer EVENT_BEAT_CERULEAN_GYM_TRAINER_1, 3, CeruleanGymBattleText2, CeruleanGymEndBattleText2, CeruleanGymAfterBattleText2
	db -1 ; end

MistyText:
	text_asm
	CheckEvent EVENT_BEAT_MISTY
	jr z, .beforeBeat
	CheckEventReuseA EVENT_GOT_TM11
	jr nz, .afterBeat
	call z, CeruleanGymReceiveTM11
	call DisableWaitingAfterTextDisplay
	; jr .done
	jp TextScriptEnd
.afterBeat
	CheckEvent EVENT_PLAYER_IS_CHAMPION
	jr nz, .MistyRematch
	ld hl, TM11ExplanationText
	call PrintText
	; jr .done
	jp TextScriptEnd
.beforeBeat
	ld hl, MistyPreBattleText
	call PrintText
	ld hl, wStatusFlags3
	set 6, [hl]
	set 7, [hl]
	ld hl, ReceivedCascadeBadgeText
	ld de, ReceivedCascadeBadgeText
	call SaveEndBattleTextPointers
	ldh a, [hSpriteIndex]
	ld [wSpriteIndex], a
	call EngageMapTrainer
	call InitBattleEnemyParameters
	ld a, $2
	ld [wGymLeaderNo], a
	xor a
	ldh [hJoyHeld], a
	jr .endBattle
.MistyRematch
	; check if previous gym has been beaten & current gym hasn't been beaten yet
	ld a, [wGymRematched]
	and %00000011
	cp %00000001
	jr z, .rematch
	ld hl, CeruleanGymRematchCooldownText
	call PrintText
	jp TextScriptEnd ; exit here
.rematch
	ld hl, CeruleanGymRematchPreBattleText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, CeruleanGymRematchAcceptedText
	call PrintText
	call Delay3
	ld hl, wStatusFlags3
	set 6, [hl]
	set 7, [hl]
	ld hl, CeruleanGymRematchDefeatedText
	ld de, CeruleanGymRematchDefeatedText
	call SaveEndBattleTextPointers
	ld a, OPP_MISTY
	ld [wCurOpponent], a
	ld a, 2
	ld [wTrainerNo], a
	jr .endBattle
.refused
	ld hl, CeruleanGymRematchRefusedText
	call PrintText
	jr .done
.endBattle
	ld a, $3
	ld [wCeruleanGymCurScript], a
.done
	jp TextScriptEnd

MistyPreBattleText:
	text_far _MistyPreBattleText
	text_end

TM11ExplanationText:
	text_far _TM11ExplanationText
	text_end

MistyCascadeBadgeInfoText:
	text_far _MistyCascadeBadgeInfoText
	text_end

ReceivedTM11Text:
	text_far _ReceivedTM11Text
	sound_get_item_1
	text_end

TM11NoRoomText:
	text_far _TM11NoRoomText
	text_end

ReceivedCascadeBadgeText:
	text_far _ReceivedCascadeBadgeText
	text_end

CeruleanGymTrainerText1:
	text_asm
	ld hl, CeruleanGymTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

CeruleanGymBattleText1:
	text_far _CeruleanGymBattleText1
	text_end

CeruleanGymEndBattleText1:
	text_far _CeruleanGymEndBattleText1
	text_end

CeruleanGymAfterBattleText1:
	text_far _CeruleanGymAfterBattleText1
	text_end

CeruleanGymTrainerText2:
	text_asm
	ld hl, CeruleanGymTrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

CeruleanGymBattleText2:
	text_far _CeruleanGymBattleText2
	text_end

CeruleanGymEndBattleText2:
	text_far _CeruleanGymEndBattleText2
	text_end

CeruleanGymAfterBattleText2:
	text_far _CeruleanGymAfterBattleText2
	text_end

CeruleanGymGuideText:
	text_asm
	CheckEvent EVENT_BEAT_MISTY
	jr nz, .afterBeat
	ld hl, CeruleanGymGuidePreBattleText
	call PrintText
	jr .done
.afterBeat
	ld hl, CeruleanGymGuidePostBattleText
	call PrintText
.done
	jp TextScriptEnd

CeruleanGymGuidePreBattleText:
	text_far _CeruleanGymGuidePreBattleText
	text_end

CeruleanGymGuidePostBattleText:
	text_far _CeruleanGymGuidePostBattleText
	text_end

CeruleanGymRematchPreBattleText:
    text_far _CeruleanGymRematchPreBattleText
    text_end
    
CeruleanGymRematchAcceptedText:
    text_far _CeruleanGymRematchAcceptedText
    text_end
    
CeruleanGymRematchRefusedText:
    text_far _CeruleanGymRematchRefusedText
    text_end

CeruleanGymRematchDefeatedText:
    text_far _CeruleanGymRematchDefeatedText
    text_end

CeruleanGymRematchPostBattleText:
    text_far _CeruleanGymRematchPostBattleText
    text_end

CeruleanGymRematchCooldownText:
    text_far _CeruleanGymRematchCooldownText
    text_end
