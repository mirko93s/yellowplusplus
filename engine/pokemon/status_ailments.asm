PrintStatusAilment::
	ld a, [de]
	bit PSN, a
	jr nz, .psn
	bit BRN, a
	jr nz, .brn
	bit FRZ, a
	jr nz, .frz
	bit PAR, a
	jr nz, .par
	and SLP_MASK
	ret z
	ld a, '<SLP>'
	jr .place
.psn
	ld a, '<PSN>'
	jr .place
.brn
	ld a, '<BRN>'
	jr .place
.frz
	ld a, '<FRZ>'
	jr .place
.par
	ld a, '<PAR>'
.place
	ld [hl], a
	ret
