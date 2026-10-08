AddPlayerMoney::
; Add the three-byte BCD amount at HL to the low six digits at DE.
	and a
	ld c, 3
.add
	ld a, [de]
	adc [hl]
	daa
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .add
	ret nc
	ld hl, wPlayerMoneyMillions
	inc [hl]
	ld a, [hl]
	cp 10
	ret c
CapPlayerMoney:
	ld hl, wPlayerMoneyMillions
	ld [hl], 9
	ld hl, wPlayerMoney
	ld a, $99
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

SubPlayerMoney::
; Subtract a three-byte price; caller ensures the full balance covers it.
	and a
	ld c, 3
.subtract
	ld a, [de]
	sbc [hl]
	daa
	ld [de], a
	dec de
	dec hl
	dec c
	jr nz, .subtract
	jr nc, .done
	ld hl, wPlayerMoneyMillions
	dec [hl]
.done
	and a ; successful purchase
	ret

PrintPlayerMoney::
; Same flags as PrintBCDNumber, with seven digit positions.
	call GetPredefRegisters
	ld de, wPlayerMoney
	ld a, [wPlayerMoneyMillions]
	jr PrintSevenDigitMoney

PrintShopTransactionPrice::
	call GetPredefRegisters
	ld de, wShopTransactionPrice + 1
	ld a, [wShopTransactionPrice]
PrintSevenDigitMoney:
	and a
	jr nz, .millions
	bit 6, c
	jr nz, .lowDigits
	inc hl ; reserve the unused millions position when right-aligned
.lowDigits
	jp PrintBCDNumber
.millions
	bit 5, c
	jr z, .digit
	ld [hl], '¥'
	inc hl
.digit
	add '0'
	ld [hli], a
	ld c, 3 ; print all six low digits, including zeroes
	jr .lowDigits

HasEnoughShopMoney::
	ld a, [wShopTransactionPrice]
	ld b, a
	ld a, [wPlayerMoneyMillions]
	cp b
	ret nz ; unequal high digits decide affordability
	ld de, wPlayerMoney
	ld hl, wShopTransactionPrice + 1
	ld c, 3
	jp StringCmp

SubtractShopTransactionMoney::
; Caller checked affordability across all seven digits.
	ld de, wPlayerMoney + 2
	ld hl, wShopTransactionPrice + 3
	call SubPlayerMoney
	ld a, [wShopTransactionPrice]
	ld b, a
	ld a, [wPlayerMoneyMillions]
	sub b
	ld [wPlayerMoneyMillions], a
	and a
	ret

AddShopTransactionMoney::
	ld a, [wShopTransactionPrice]
	ld b, a
	ld a, [wPlayerMoneyMillions]
	add b
	ld [wPlayerMoneyMillions], a
	ld de, wPlayerMoney + 2
	ld hl, wShopTransactionPrice + 3
	call AddPlayerMoney
	ld a, [wPlayerMoneyMillions]
	cp 10
	jp nc, CapPlayerMoney
	ret

HalvePlayerMoney::
; Long division by two across the seven decimal digits, rounding down.
	ld hl, wPlayerMoneyMillions
	ld a, [hl]
	srl a
	ld [hl], a
	ld b, 0
	jr nc, .lowDigits
	ld b, $50
.lowDigits
	ld hl, wPlayerMoney
	ld c, 3
.byte
	ld a, [hl]
	srl a
	push af ; save the remainder from the low digit
	bit 3, a ; an odd tens digit needs BCD correction after shifting
	jr z, .corrected
	sub 3
.corrected
	add b
	ld [hli], a
	pop af
	ld b, 0
	jr nc, .next
	ld b, $50
.next
	dec c
	jr nz, .byte
	ret
