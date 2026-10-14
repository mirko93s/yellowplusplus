ViridianSchoolHouse_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wViridianSchoolHouseCurScript]
	and a
	jp nz, ViridianSchoolHouseFinishLesson
	CheckEvent EVENT_GOT_TYPE_CHART
	ret nz
	CheckEvent EVENT_02D ; the old man's catching demonstration is complete
	ret z
	call IsPlayerCharacterBeingControlledByGame
	ret nz
	; Both entrance tiles lead around the desks through the left aisle.
	ld a, [wYCoord]
	cp 6
	jr z, .entrance
	cp 7
	ret nz
.entrance
	ld a, [wXCoord]
	cp 2
	jr z, .callPlayer
	cp 3
	ret nz
.callPlayer
	; The old man has finished his escort; remove him while indoors.
	ld a, HS_OLD_MAN
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, ~(A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ld a, 4
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ld de, ViridianSchoolWalkFromLeftDoor
	ld a, [wYCoord]
	cp 7
	jr z, .bottomRow
	ld de, ViridianSchoolWalkFromLeftAisle
	ld a, [wXCoord]
	cp 2
	jr z, .walk
	ld de, ViridianSchoolWalkFromRightAisle
	jr .walk
.bottomRow
	ld a, [wXCoord]
	cp 2
	jr z, .walk
	ld de, ViridianSchoolWalkFromRightDoor
.walk
	ld hl, wSimulatedJoypadStatesEnd
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, 1
	ld [wViridianSchoolHouseCurScript], a
	ret

ViridianSchoolWalkFromLeftDoor:
	; The simulated-input buffer is consumed backwards.
	db NO_INPUT, 1, D_RIGHT, 2, D_UP, 5, -1
ViridianSchoolWalkFromRightDoor:
	db NO_INPUT, 1, D_RIGHT, 2, D_UP, 5, D_LEFT, 1, -1
ViridianSchoolWalkFromLeftAisle:
	db NO_INPUT, 1, D_RIGHT, 2, D_UP, 4, -1
ViridianSchoolWalkFromRightAisle:
	db NO_INPUT, 1, D_RIGHT, 2, D_UP, 4, D_LEFT, 1, -1

ViridianSchoolHouseFinishLesson:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	ld a, [wWalkCounter]
	and a
	ret nz
	call Delay3
	xor a
	ld [wPlayerMovingDirection], a
	ld [wSpritePlayerStateData1IntraAnimFrameCounter], a
	ld [wSpritePlayerStateData1AnimFrameCounter], a
	ld a, SPRITE_FACING_UP
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wSpritePlayerStateData1ImageIndex], a
	ld a, SPRITE_FACING_DOWN
	ld [wSprite02StateData1FacingDirection], a
	call UpdateSprites
	ld a, ~(A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ld a, 5
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ld [wViridianSchoolHouseCurScript], a
	ret

ViridianSchoolHouse_TextPointers:
	dw SchoolText1
	dw SchoolText2
	dw SchoolText3
	dw ViridianSchoolTeacherCallText
	dw ViridianSchoolTeacherGiftText

SchoolText1:
	text_far _SchoolText1
	text_end

SchoolText2:
	text_asm
	CheckEvent EVENT_GOT_TYPE_CHART
	jr nz, .vanilla
	CheckEvent EVENT_02D
	jr z, .vanilla
	call ViridianSchoolGiveTypeChart
	jp TextScriptEnd
.vanilla
	farcall Func_f1c0f
	jp TextScriptEnd

ViridianSchoolTeacherCallText:
	text_far _ViridianSchoolTeacherCallText
	text_end

ViridianSchoolTeacherGiftText:
	text_asm
	call ViridianSchoolGiveTypeChart
	jp TextScriptEnd

ViridianSchoolGiveTypeChart:
	CheckEvent EVENT_GOT_TYPE_CHART
	ret nz
	ld hl, ViridianSchoolTypeLessonText
	call PrintText
	lb bc, TYPE_CHART, 1
	call GiveItem
	ret nc ; a failed gift can be retried by talking to the teacher
	SetEvent EVENT_GOT_TYPE_CHART
	ld hl, ViridianSchoolReceivedTypeChartText
	jp PrintText

ViridianSchoolTypeLessonText:
	text_far _ViridianSchoolTypeLessonText
	text_end

ViridianSchoolReceivedTypeChartText:
	text_far _ViridianSchoolReceivedTypeChartText
	sound_get_key_item
	text_far _ViridianSchoolTypeChartInstructionsText
	text_end

SchoolText3:
	text_asm
	farcall Func_f1c03
	jp TextScriptEnd
