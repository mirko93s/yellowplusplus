; [wd0b5] = pokemon ID
; hl = dest addr
PrintMonType:
	call GetPredefRegisters
	push hl
	call GetMonHeader
	pop hl
	push hl
	ld a, [wMonHType1]
	call PrintType
	ld a, [wMonHType1]
	ld b, a
	ld a, [wMonHType2]
	cp b
	pop hl
	jr z, EraseType2Text
	ld bc, SCREEN_WIDTH * 1
	add hl, bc

; a = type
; hl = dest addr
PrintType:
	push hl
	ld hl, TypeNames
	jr PrintType_

; erase "TYPE2/" if the mon only has 1 type
EraseType2Text:
	ld a, ' '
	ld bc, $14
	add hl, bc
	ld bc, $6
	jp FillMemory

PrintMoveType: ; only used in battle
	call GetPredefRegisters
	push hl
	ld a, [wPlayerMoveType]
	ld hl, TypeNamesShort
; fall through

PrintType_:
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString

INCLUDE "data/types/names.asm"
