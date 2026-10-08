RedsHouse1F_Script:
	call EnableAutoTextBoxDrawing
	ld a, [wRedsHouse1FCurScript]
	and a
	jp nz, RedsHouse1F_FinishShoesEvent
	CheckEvent EVENT_GOT_RUNNING_SHOES
	ret nz
	; Only start when arriving downstairs from the bedroom.
	ld a, [wYCoord]
	cp 1
	ret nz
	ld a, [wXCoord]
	cp 7
	ret nz
	call IsPlayerCharacterBeingControlledByGame
	ret nz
	ld a, ~(A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ld a, 3
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, RedsHouse1F_WalkToMom
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, 1
	ld [wRedsHouse1FCurScript], a
	ret

RedsHouse1F_WalkToMom:
	db D_DOWN, 3
	db D_LEFT, 1
	db -1

RedsHouse1F_FinishShoesEvent:
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
	ld a, SPRITE_FACING_LEFT
	ld [wSpritePlayerStateData1FacingDirection], a
	ld [wSpritePlayerStateData1ImageIndex], a
	ld a, SPRITE_FACING_RIGHT
	ld [wSprite01StateData1FacingDirection], a
	call UpdateSprites
	ld a, ~(A_BUTTON | B_BUTTON)
	ld [wJoyIgnore], a
	ld a, 4
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	SetEvent EVENT_GOT_RUNNING_SHOES
	xor a
	ld [wJoyIgnore], a
	ld [wRedsHouse1FCurScript], a
	ret

RedsHouse1F_TextPointers:
	dw RedsHouse1FMomText
	dw RedsHouse1FTVText
	dw RedsHouse1FMomCallText
	dw RedsHouse1FMomShoesText

RedsHouse1FMomCallText:
	text_far _MomRunningShoesCallText
	text_end

RedsHouse1FMomShoesText:
	text_far _MomRunningShoesGiftText
	sound_get_key_item
	text_far _MomRunningShoesInstructionsText
	text_end

RedsHouse1FMomText:
	text_asm
	callfar Func_f1b73
	jp TextScriptEnd

RedsHouse1FTVText:
	text_asm
	callfar Func_f1bc4
	jp TextScriptEnd
