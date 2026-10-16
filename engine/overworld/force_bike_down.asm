; Banked to leave space in ROM0 for overworld SELECT handling.
IsPlayerCharacterBeingControlledByGame_::
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wMovementFlags]
	bit 1, a ; currently stepping down from door
	ret nz
	ld a, [wStatusFlags5]
	and $80
	ret

ForceBikeDown_::
	ld a, [wStatusFlags7]
	bit 3, a ; check if a trainer wants a challenge
	ret nz
	ld a, [wCurMap]
	cp ROUTE_17 ; Cycling Road
	ret nz
	ldh a, [hJoyHeld]
	and D_DOWN | D_UP | D_LEFT | D_RIGHT | B_BUTTON | A_BUTTON
	ret nz
	ld a, D_DOWN
	ldh [hJoyHeld], a
	ret
