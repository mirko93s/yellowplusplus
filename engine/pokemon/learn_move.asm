LearnMove:
	call SaveScreenTilesToBuffer1
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, wNameBuffer
	ld de, wLearnMoveMonName
	ld bc, NAME_LENGTH
	call CopyData

DontAbandonLearning:
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2Moves - wPartyMon1Moves
	ld a, [wWhichPokemon]
	call AddNTimes
	ld d, h
	ld e, l
	ld b, NUM_MOVES
.findEmptyMoveSlotLoop
	ld a, [hl]
	and a
	jr z, .next
	inc hl
	dec b
	jr nz, .findEmptyMoveSlotLoop
	push de
	call TryingToLearn
	pop de
	jp c, AbandonLearning
	push hl
	push de
	ld [wNamedObjectIndex], a
	call GetMoveName
	ld hl, OneTwoAndText
	call PrintText
	pop de
	pop hl
.next
	ld a, [wMoveNum]
	ld [hl], a
	ld bc, wPartyMon1PP - wPartyMon1Moves
	add hl, bc
	push hl
	push de
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wBuffer
	ld a, BANK(Moves)
	call FarCopyData
	ld a, [wBuffer + 5] ; a = move's max PP
	pop de
	pop hl
	ld [hl], a
	ld a, [wIsInBattle]
	and a
	jp z, PrintLearnedMove
	ld a, [wWhichPokemon]
	ld b, a
	ld a, [wPlayerMonNumber]
	cp b
	jp nz, PrintLearnedMove
	ld h, d
	ld l, e
	ld de, wBattleMonMoves
	ld bc, NUM_MOVES
	call CopyData
	ld bc, wPartyMon1PP - wPartyMon1OTID
	add hl, bc
	ld de, wBattleMonPP
	ld bc, NUM_MOVES
	call CopyData
	jp PrintLearnedMove

AbandonLearning:
	ld hl, AbandonLearningText
	call PrintText
	hlcoord 14, 7
	lb bc, 8, 15
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jp nz, DontAbandonLearning
	ld hl, DidNotLearnText
	call PrintText
	ld b, 0
	ret

PrintLearnedMove:
	ld hl, LearnedMove1Text
	call PrintText
	ld b, 1
	ret

TryingToLearn:
	push hl
	ld hl, TryingToLearnText
	call PrintText
	hlcoord 14, 7
	lb bc, 8, 15
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	pop hl
	ld a, [wCurrentMenuItem]
	rra
	ret c
	ld bc, -NUM_MOVES
	add hl, bc
	push hl
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	pop hl
.loop
	push hl
	ldh a, [rLCDC]
	push af ; keep sprite visibility on the stack for this menu's lifetime
	res 1, a
	ldh [rLCDC], a
	farcall DrawMoveLearningMenu
	xor a
	ld [wCurrentMenuItem], a
	farcall HandleMoveLearningInput
	ldh a, [hJoy5]
	push af
	farcall RestoreMoveLearningAttributes
	call LoadScreenTilesFromBuffer1
	call Delay3 ; finish restoring the background before showing sprites
	pop bc ; b = menu input
	pop af
	and %10
	ld e, a
	ldh a, [rLCDC]
	res 1, a
	or e
	ldh [rLCDC], a
	ld a, b
	pop hl
	bit BIT_B_BUTTON, a
	jr nz, .cancel
	push hl
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	push af
	push bc
	call IsMoveHM
	pop bc
	pop de
	ld a, d
	jr c, .hm
	pop hl
	add hl, bc
	and a
	ret
.hm
	ld hl, HMCantDeleteText
	call PrintText
	pop hl
	jr .loop
.cancel
	scf
	ret

LearnedMove1Text:
	text_far _LearnedMove1Text
	sound_get_item_1 ; plays SFX_GET_ITEM_1 in the party menu (rare candy) and plays SFX_LEVEL_UP in battle
	text_promptbutton
	text_end

WhichMoveToForgetText:
	text_far _WhichMoveToForgetText
	text_end

AbandonLearningText:
	text_far _AbandonLearningText
	text_end

DidNotLearnText:
	text_far _DidNotLearnText
	text_end

TryingToLearnText:
	text_far _TryingToLearnText
	text_end

OneTwoAndText:
; bugfix: In Red/Blue, the SFX_SWAP sound was played in the wrong bank, which played an incorrect sound
; Yellow has fixed this by swapping to the correct bank
	text_far _OneTwoAndText
	text_pause
	text_asm
	push af
	push bc
	push de
	push hl
	ld a, $1
	ld [wMuteAudioAndPauseMusic], a
	call DelayFrame
	ld a, [wAudioROMBank]
	push af
	ld a, BANK(SFX_Swap_1)
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	call WaitForSoundToFinish
	ld a, SFX_SWAP
	call PlaySound
	call WaitForSoundToFinish
	pop af
	ld [wAudioROMBank], a
	ld [wAudioSavedROMBank], a
	xor a
	ld [wMuteAudioAndPauseMusic], a
	pop hl
	pop de
	pop bc
	pop af
	ld hl, PoofText
	ret

PoofText:
	text_far _PoofText
	text_pause
ForgotAndText:
	text_far _ForgotAndText
	text_end

HMCantDeleteText:
	text_far _HMCantDeleteText
	text_end
