LCDC::
	push af
	ld a, [wStorageUIActive]
	and a
	jr z, .normalLCDC
	; Switch in HBlank of line 71, before the first minisprite scanline.
.storageHBlank
	ldh a, [rSTAT]
	and 3
	jr nz, .storageHBlank
	ldh a, [rLCDC]
	or $10
	ldh [rLCDC], a
	pop af
	reti
.normalLCDC
	ldh a, [hLCDCPointer] ; doubles as enabling byte
	and a
	jr z, .noLCDCInterrupt
	push hl
	; [C700 + [rLY]] --> [FF00 + [hLCDCPointer]]
	ldh a, [rLY]
	ld l, a
	ld h, HIGH(wLYOverrides)
	ld h, [hl] ; h != not part of pointer
	ldh a, [hLCDCPointer]
	ld l, a
	ld a, h
	ld h, $ff
	ld [hl], a
	pop hl
.noLCDCInterrupt
	pop af
	reti
