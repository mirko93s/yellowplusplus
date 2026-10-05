Random::
; Return a random number in a.
; For battles, use BattleRandom.
	push hl
	push de
	push bc
	farcall Random_
	ldh a, [hRandomAdd]
	pop bc
	pop de
	pop hl
	ret

GenerateShinyDVs::
; Input: random byte in a. Output: Attack/Defense in a, Speed/Special in b.
; xx1x 1010 gives Attack 2, 3, 6, 7, 10, 11, 14, or 15; other DVs are 10.
	sla a
	sla a
	sla a
	sla a
	or $2a
	ld b, $aa
	ret
