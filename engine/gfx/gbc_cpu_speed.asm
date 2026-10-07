; Temporary double speed for the CPU-bound sprite decoder, as in pureRGB.
; PPU timing and the caller's speed are unchanged outside decompression.
GBCSetCPU2xSpeed::
	ldh a, [hGBC]
	and a
	ret z
	ldh a, [rKEY1]
	bit 7, a
	ret nz
	jr GBCToggleCPUSpeed

; D contains KEY1 from before decompression. DMG never executes STOP.
GBCRestoreCPUSpeed::
	ldh a, [hGBC]
	and a
	ret z
	ldh a, [rKEY1]
	xor d
	and $80
	ret z

GBCToggleCPUSpeed:
	di
	ldh a, [rIE]
	push af
	ldh a, [rJOYP]
	push af
	ldh a, [rIF]
	push af
	xor a
	ldh [rIE], a
	ldh [rIF], a
	ld a, $30
	ldh [rJOYP], a
	ldh a, [rKEY1]
	or 1
	ldh [rKEY1], a
	stop
	; Retain pending interrupts, including ones raised during the switch.
	pop bc
	ldh a, [rIF]
	or b
	ldh [rIF], a
	pop af
	ldh [rJOYP], a
	pop af
	ldh [rIE], a
	reti
