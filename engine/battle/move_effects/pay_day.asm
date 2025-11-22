PayDayEffect_:
	xor a
	ld hl, wcd6d
	ld [hli], a
	ldh a, [hWhoseTurn]
	and a
	ld a, [wBattleMonLevel]
	jr z, .payDayEffect
	ld a, [wEnemyMonLevel]
.payDayEffect
; level * 5
	push hl
	ld l, a
	ld h, 0
	ld e, l
	ld d, h
	add hl, hl
	add hl, hl
	add hl, de
	ld a, l
	ldh [hDividend + 3], a
	ld a, h
	ldh [hDividend + 2], a
	xor a
	ldh [hDividend + 1], a
	ldh [hDividend], a
	pop hl
	; convert to BCD
	ld a, 100
	ldh [hDivisor], a
	ld b, $4
	call Divide
	ldh a, [hQuotient + 3]
	ld [hli], a
	ldh a, [hRemainder]
	ldh [hDividend + 3], a
	ld a, 10
	ldh [hDivisor], a
	ld b, $4
	call Divide
	ldh a, [hQuotient + 3]
	swap a
	ld b, a
	ldh a, [hRemainder]
	add b
	ld [hl], a
	ld de, wTotalPayDayMoney + 2
	ld c, $3
	predef AddBCDPredef
	ld hl, CoinsScatteredText
	jp PrintText

CoinsScatteredText:
	text_far _CoinsScatteredText
	text_end
