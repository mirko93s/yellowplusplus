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
	ld a, '_S'
	ld [hli], a
	ld a, '_L'
	ld [hli], a
	ld [hl], '_P'
	ret
.psn
	ld a, '_P'
	ld [hli], a
	ld a, '_S'
	ld [hli], a
	ld [hl], '_N'
	ret
.brn
	ld a, '_B'
	ld [hli], a
	ld a, '_R'
	ld [hli], a
	ld [hl], '_N'
	ret
.frz
	ld a, '_F'
	ld [hli], a
	ld a, '_R'
	ld [hli], a
	ld [hl], '_Z'
	ret
.par
	ld a, '_P'
	ld [hli], a
	ld a, '_A'
	ld [hli], a
	ld [hl], '_R'
	ret
