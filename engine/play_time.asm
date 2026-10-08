CheckPlayTimeLimit::
; Stop before the next second would exceed 99999:59:59.
	ld a, [wPlayTimeHours]
	cp $01
	ret nz
	ld a, [wPlayTimeHours + 1]
	cp $86
	ret nz
	ld a, [wPlayTimeHours + 2]
	cp $9f
	ret nz
	ld a, [wPlayTimeMinutes]
	cp 59
	ret nz
	ld a, [wPlayTimeSeconds]
	cp 59
	ret nz
SetMaxPlayTime::
	xor a
	ld [wPlayTimeFrames], a
	ld a, 59
	ld [wPlayTimeSeconds], a
	ld [wPlayTimeMinutes], a
	ld a, $01
	ld [wPlayTimeHours], a
	ld a, $86
	ld [wPlayTimeHours + 1], a
	ld a, $9f
	ld [wPlayTimeHours + 2], a
	ld a, $ff
	ld [wPlayTimeMaxed], a
	ret
